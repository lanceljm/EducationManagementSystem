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

@interface EMClassViewController ()<cellBtnClickedDelegate>


@end

@implementation EMClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.rowHeight = AAdaption(280);
    [self downLoadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)downLoadData {
    EMClassViewModel* viewModel = [[EMClassViewModel alloc] init];
    [viewModel loadDataWithFinish:^(BOOL isok) {
        if (isok) {
            NSLog(@"请求成功");
        }
    }];
}


-(void)cellBtnClick:(UIButton *)btn {
    
    EMClassViewCell *cell = (EMClassViewCell *)[[btn superview] superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    NSLog(@"我在第%ld行",(long)indexPath.row);
    switch (btn.tag) {
        case 100:{
            //学生界面
            NSLog(@"推出学生界面");
            EMStuOrTeacherViewController *sTVc = [[EMStuOrTeacherViewController alloc] init];
            [self.navigationController pushViewController:sTVc animated:YES];
        }
            break;
        case 101:{
            //老师界面
            EMStuOrTeacherViewController *sTVc = [[EMStuOrTeacherViewController alloc] init];
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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EMClassViewCell *cell = [EMClassViewCell loadCellWithTableView:tableView Vc:self];
    cell.delegate = self;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"选择%ld行",indexPath.row);
}

@end
