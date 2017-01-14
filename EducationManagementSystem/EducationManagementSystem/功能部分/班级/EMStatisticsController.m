//
//  EMStatisticsController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/13.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMStatisticsController.h"
#import "EMStatisticsCell.h"
#import "EMDetailController.h"
#import "EMStatisticsModel.h"

@interface EMStatisticsController ()<cellDelegate>

@property(nonatomic,strong) NSMutableArray *dataArray;


@end

@implementation EMStatisticsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = AAdaption(560);
    self.tableView.separatorColor = BLUE_COLOR;
    self.title = @"上课考勤";
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self downLoadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)downLoadData {
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [NetRequest GET:getCurriculumList parameters:self.para success:^(id responseObject) {
            
            //NSLog(@"------------学生考勤情况---------------\n%@",responseObject);
            NSArray *result = responseObject[@"result"];
            for (NSDictionary *dict in result) {
                EMStatisticsModel *model = [EMStatisticsModel mj_objectWithKeyValues:dict];
                [self.dataArray addObject:model];
            }
            [self.tableView.mj_header endRefreshing];
            [self.tableView reloadData];
        } failture:^(NSError *error) {
            
        }];
        
    }];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - cell代理

- (void)cellWithcell:(EMStatisticsCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSLog(@"扇形图所在cell第几行:%ld",indexPath.row);
    
    EMStatisticsModel *model = self.dataArray[indexPath.row];
    
    NSDictionary *para = @{@"curriculumId":model.curriculumId,@"className":model.curriculumName,@"time":model.curriculumStartTime,@"time":model.curriculumStartTime,@"token":USER_INFO[@"token"]};
    EMDetailController *detailVC = [[EMDetailController alloc]  init];
    detailVC.para = para;
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"StatisticsID";
    
    EMStatisticsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[EMStatisticsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.delegateWithCell = self;
    EMStatisticsModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    return cell;
}

#pragma mark - getters

- (NSMutableArray *)dataArray {
    
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}



@end
