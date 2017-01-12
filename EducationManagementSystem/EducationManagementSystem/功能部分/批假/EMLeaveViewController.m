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
@interface EMLeaveViewController ()

@end

@implementation EMLeaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"history"] style:UIBarButtonItemStyleDone target:self action:@selector(btnClicked)];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = btn;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.rowHeight = AAdaption(140);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)btnClicked {
    NSLog(@"批假界面的历史记录");
    [self.navigationController pushViewController:[[EMHistoryController alloc]init] animated:YES];
}

#pragma mark - tableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EMLeaveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leaveID"];
    
    if (!cell) {
        cell = [[EMLeaveCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"leaveID"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EMLeaveDetailController *vc =  [[EMLeaveDetailController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
