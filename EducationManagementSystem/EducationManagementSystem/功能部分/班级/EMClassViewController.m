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

@interface EMClassViewController ()


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


#pragma mark - tableview delegate and dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EMClassViewCell *cell = [EMClassViewCell loadCellWithTableView:tableView Vc:self];
        
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"选择%ld行",indexPath.row);
}

@end
