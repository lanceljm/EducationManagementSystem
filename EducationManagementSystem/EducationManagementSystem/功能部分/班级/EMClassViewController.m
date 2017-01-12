//
//  EMClassViewController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/6.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMClassViewController.h"
#import "EMIconDirectionButton.h"
#import "EMClassViewCell.h"
#import "EMClassViewModel.h"
#import "EMStuOrTeacherViewController.h"
#import "EMClassModel.h"
#import "EMStuModel.h"
#import <MJRefresh.h>
#import <MBProgressHUD.h>
#import <MJExtension.h>
#import "URL.h"

@interface EMClassViewController ()<cellBtnClickedDelegate>

@property(nonatomic,strong) EMClassViewModel *classVM;


@end

@implementation EMClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.rowHeight = AAdaption(280);
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(downLoadData) name:@"networking" object:nil];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)downLoadData {
    __weak typeof(self)weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [weakSelf.classVM loadDataWithFinish:^(BOOL isOk) {
        
        [weakSelf.tableView.mj_header endRefreshing];
            [weakSelf.tableView reloadData];
        }];
        
    }];
    [self.tableView.mj_header beginRefreshing];

}


-(void)cellBtnClick:(UIButton *)btn {
    
    EMClassViewCell *cell = (EMClassViewCell *)[[btn superview] superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    NSLog(@"我在第%ld行",(long)indexPath.row);
    EMClassModel *Model = self.classVM.viewModelArr[indexPath.row];
    NSArray *teacherModelArr = Model.staffList;
    NSString *className = Model.className;
    NSNumber *sstaffId = [NSNumber new];
    sstaffId = [NSNumber numberWithInteger:Model.staffList.firstObject.staffId];
    
    NSDictionary *userInfo = [[NSUserDefaults standardUserDefaults]objectForKey:UserInfoKey];
    NSString *token = userInfo[@"token"];
    
    EMStuOrTeacherViewController *sTVc = [[EMStuOrTeacherViewController alloc] init];

    switch (btn.tag) {
        case 100:{
            sTVc.btnTag = btn.tag;
            //学生界面
            NSMutableArray *stuArr = [NSMutableArray new];
                NSDictionary *para = @{@"staffId":sstaffId,@"className":className,@"token":token};
                [NetRequest GET:getStudentList parameters:para success:^(id responseObject) {
                    NSLog(@"-------------学生列表----------%@",responseObject);
                    NSArray *result = responseObject[@"result"];
                    for (NSDictionary *dict in result) {
                        EMStuModel *model = [EMStuModel mj_objectWithKeyValues:dict];
                        [stuArr addObject:model];
                    }
                    
                    NSDictionary *param = @{@"staffId":sstaffId,@"className":className,@"token":token};
                    sTVc.stuModelArr = stuArr;
                    sTVc.param = param;
                    [self.navigationController pushViewController:sTVc animated:YES];

                } failture:^(NSError *error) {
    
                    [self.navigationController pushViewController:sTVc animated:YES];
                }];
        }
            break;
        case 101:{
            //老师界面
            EMStuOrTeacherViewController *sTVc = [[EMStuOrTeacherViewController alloc] init];
            sTVc.staffList = teacherModelArr;
            [self.navigationController pushViewController:sTVc animated:YES];
        }
            break;
        case 102:{
            //签到
        }
        case 103:{
            //签退
        }
        default: {
            //统计
        }
            break;
    }

    
}


#pragma mark - tableview delegate and dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.classVM.viewModelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EMClassViewCell *cell = [EMClassViewCell loadCellWithTableView:tableView Vc:self];
    cell.delegate = self;
    
    EMClassModel *model = self.classVM.viewModelArr[indexPath.row];
    cell.model = model;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选择%ld行",indexPath.row);
}

- (EMClassViewModel *)classVM {
    
    if (!_classVM) {
        _classVM = [[EMClassViewModel alloc] init];
    }
    return _classVM;
}

@end
