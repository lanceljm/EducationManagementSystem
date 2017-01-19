//
//  EMHistoryController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/10.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMHistoryController.h"
#import "EMLeaveCell.h"
#import "EMLeaveListViewModel.h"

@interface EMHistoryController ()

@property(nonatomic,strong) EMLeaveListViewModel *leaveVM;

@end

@implementation EMHistoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = AAdaption(140);
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.leaveVM.listViewModel.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EMLeaveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"histroyID"];
    if (!cell) {
        cell = [[EMLeaveCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"histroyID"];
    }
    EMleaveModel *model = self.leaveVM.listViewModel[indexPath.row];
    cell.model = model;
    
    return cell;
}

#pragma mark - getters
- (EMLeaveListViewModel *)leaveVM {
    
    if (!_leaveVM) {
        _leaveVM = [[EMLeaveListViewModel alloc] init];
    }
    
    return _leaveVM;
}


@end
