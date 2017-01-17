//
//  EMNoticeViewController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/6.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMNoticeViewController.h"
#import "EMNotificationCell.h"
#import <MJRefresh.h>
#import "EMNotificationVM.h"
#import <MBProgressHUD.h>
#import "EMDetailNotificationVC.h"

@interface EMNoticeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)EMNotificationVM *notificationVM;

@end

@implementation EMNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    self.tableView.rowHeight = AAdaption(140);
    
    [self downLoadSource];
    
}

-(void)downLoadSource {
    __weak typeof(self) weakself = self;
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
       [weakself.notificationVM loadNetData:^(BOOL isOK) {
           [weakself.tableView.mj_header endRefreshing];
           [weakself.tableView reloadData];
       }];
    }];
    [self.tableView.mj_header beginRefreshing];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _notificationVM.dataSourceArr.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EMNotificationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[EMNotificationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
//    cell.textLabel.text = self.dataArray[indexPath.row][@"noticeTitle"];
//    cell.detailTextLabel.text = self.dataArray[indexPath.row][@"noticeDate"];
    EMNotificationModel *model = self.notificationVM.dataSourceArr[indexPath.row];
    cell.model = model;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    EMDetailNotificationVC *detailVC = [[EMDetailNotificationVC alloc]init];
    detailVC.title = @"通知详情";
    [self.navigationController pushViewController:detailVC animated:YES];
}

-(EMNotificationVM *)notificationVM {
    if (!_notificationVM) {
        _notificationVM = [[EMNotificationVM alloc]init];
    }
    return _notificationVM;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
