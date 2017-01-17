//
//  EMLeaveViewController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/6.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMLeaveViewController.h"
#import "EMLeaveCell.h"
#import "EMHistoryController.h"
#import "EMLeaveDetailController.h"
#import "EMLeaveListViewModel.h"
#import "EMleaveModel.h"

@interface EMLeaveViewController ()

@property(nonatomic,strong) EMLeaveListViewModel *leaveVM;


@end

@implementation EMLeaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"history"] style:UIBarButtonItemStyleDone target:self action:@selector(btnClicked)];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = btn;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.rowHeight = AAdaption(140);
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)loadData {
    
    __weak typeof(self) weakSelf = self;
   
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [weakSelf.leaveVM downLoadDataWithStatus:@1 withFinish:^(BOOL success) {
            [weakSelf.tableView reloadData];
            [weakSelf.tableView.mj_header endRefreshing];
        }];
    }];
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)btnClicked {
    NSLog(@"批假界面的历史记录");
    [self.navigationController pushViewController:[[EMHistoryController alloc]init] animated:YES];
}

#pragma mark - tableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  self.leaveVM.listViewModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EMLeaveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leaveID"];
    
    if (!cell) {
        cell = [[EMLeaveCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"leaveID"];
    }
    
    EMleaveModel *model = self.leaveVM.listViewModel[indexPath.row];
    cell.model = model;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    EMleaveModel *model = self.leaveVM.listViewModel[indexPath.row];
    EMLeaveDetailController *vc =  [[EMLeaveDetailController alloc] init];
    vc.model = model;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - getters
- (EMLeaveListViewModel *)leaveVM {
    
    if (!_leaveVM) {
        _leaveVM = [[EMLeaveListViewModel alloc] init];
    }
    return _leaveVM;
}


@end
