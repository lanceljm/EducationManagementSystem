//
//  EMNoticeViewController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/6.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMNoticeViewController.h"
#import "EMNotificationModel.h"
#import "EMEntificationCell.h"
#import <MJRefresh.h>
#import "EMNotificationVM.h"
#import <MBProgressHUD.h>
#import "EMDetailNotificationVC.h"
//#import "EMAlertViewController.h"

@interface EMNoticeViewController ()

@property(nonatomic,strong)EMNotificationVM *notificationVM;

@end

@implementation EMNoticeViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh) name:@"alertTip" object:nil];
    }
    return self;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"alertTip" object:nil];
}

-(void)refresh {
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = AAdaption(140);
    [self downLoadSource];
    
}

-(void)downLoadSource {
    __weak typeof(self) weakself = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [weakself.notificationVM loadNetData:^(BOOL isOK) {
           [weakself.tableView.mj_header endRefreshing];
           [weakself.tableView reloadData];
       }];
    }];
    [self.tableView.mj_header beginRefreshing];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"返回多少行：%ld",self.notificationVM.dataSourceArr.count);
    return self.notificationVM.dataSourceArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    EMEntificationCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[EMEntificationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    [cell showData:self.notificationVM.dataSourceArr[indexPath.row]];
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (!cell) {
////        cell = [[NSBundle mainBundle] loadNibNamed:@"UITableViewCell" owner:self options:nil].firstObject;
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
//    }
//    cell.textLabel.text = self.notificationVM.dataSourceArr[indexPath.row][@"noticeTitle"];
//    cell.detailTextLabel.text = self.notificationVM.dataSourceArr[indexPath.row][@"noticeDate"];
    
//    EMNotificationModel *model = self.notificationVM.dataSourceArr[indexPath.row];
//    cell.textLabel.text = model.noticeTitle;
//    cell.detailTextLabel.text = model.noticeDate;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    EMNotificationModel *model = self.notificationVM.dataSourceArr[indexPath.row];
    
    EMDetailNotificationVC *detailVC = [[EMDetailNotificationVC alloc]init];
    detailVC.title = @"通知详情";
    NSString *contentStr = [NSString stringWithFormat:@"<h3 style=\"text-align:center\">%@</h3>%@<time style=\"text-align:right; display:block\">%@</time>",model.noticeTitle,model.noticeContent,model.noticeDate];
    detailVC.contents = contentStr;
    
    detailVC.titleString = model.noticeTitle;
    detailVC.timeString = model.noticeDate;
    
    detailVC.model = model;
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
//    //直接传到提醒界面
//    EMAlertViewController *emalertVC = [[EMAlertViewController alloc]init];
//    emalertVC.titleStr = model.noticeTitle;
//    emalertVC.timeStr = model.noticeDate;
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
