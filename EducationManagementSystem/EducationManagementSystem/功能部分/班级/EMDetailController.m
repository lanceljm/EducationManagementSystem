//
//  EMDetailController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/13.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMDetailController.h"
#import "EMSTCell.h"
#import "EMDetailModel.h"

@interface EMDetailController ()

@property(nonatomic,strong) NSMutableArray *dataArr;


@end

@implementation EMDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr = [NSMutableArray new];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

    [self loadData];
}


- (void)loadData {
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [NetRequest GET:getStuRollcallList parameters:self.para success:^(id responseObject) {
           
            NSLog(@"---------------- 学生考勤情况详细 --------------\n%@",responseObject);
            NSArray *result = responseObject[@"result"];
            for (NSDictionary *dict in result) {
                EMDetailModel *model = [EMDetailModel mj_objectWithKeyValues:dict];
                //NSLog(@"%@",model.student.studentName);
                [_dataArr addObject:model];
            }
            [self.tableView.mj_header endRefreshing];
            [self.tableView reloadData];
        } failture:^(NSError *error) {
            
        }];
    }];
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *detailID = @"detailID";
    EMSTCell *cell = [tableView dequeueReusableCellWithIdentifier:detailID];
    if (!cell) {
        cell = [[EMSTCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailID];
    }
    EMDetailModel *model = _dataArr[indexPath.row];
    cell.detailModel = model;
    
    return cell;
}


@end
