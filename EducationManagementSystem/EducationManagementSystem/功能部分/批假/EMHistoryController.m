//
//  EMHistoryController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/10.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMHistoryController.h"
#import "EMLeaveCell.h"

@interface EMHistoryController ()

@end

@implementation EMHistoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = AAdaption(140);
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EMLeaveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"histroyID"];
    if (!cell) {
        cell = [[EMLeaveCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"histroyID"];
    }
    
    return cell;
}




@end
