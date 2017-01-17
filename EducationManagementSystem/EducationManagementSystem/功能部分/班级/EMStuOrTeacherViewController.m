//
//  EMStuOrTeacherViewController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/9.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMStuOrTeacherViewController.h"
#import "EMSearchBarView.h"
#import "EMSTCell.h"
#import "EMTeacherList.h"

@interface EMStuOrTeacherViewController ()<UITableViewDelegate,UITableViewDataSource,cellBtnClickedDelegate>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,assign) CGFloat searchMaxY;

@end

@implementation EMStuOrTeacherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self addSearchView];
    [self.view addSubview:self.tableView];
    //隐藏多余cell
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)addSearchView {

    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:self.param];
    EMSearchBarView *searchV = [[EMSearchBarView alloc] initWithFrame:CGRectMake(0, 64/AAdaptionWidth(), 750, 120) WithTextChangeBlock:^(NSString *text) {
        [dict setObject:text forKey:@"studentName"];
        [self.stuModelArr removeAllObjects];
        [NetRequest GET:getStudentByName parameters:dict success:^(id responseObject) {
            NSLog(@"- - - -  - -  -%@",responseObject);
            NSArray *result = responseObject[@"result"];
            for (NSDictionary *dict in result) {
                EMStuModel *model = [EMStuModel mj_objectWithKeyValues:dict];
                [self.stuModelArr addObject:model];
            }
            [self.tableView reloadData];
            
        } failture:^(NSError *error) {
            
        }];
        //搜索的网络请求
        NSLog(@"%@",text);
    }];
    
    _searchMaxY = CGRectGetMaxY(searchV.frame);
    [self.view addSubview:searchV];

}

#pragma mark - 自定义cell的代理方法
-(void)cellBtnClick:(UIButton *)btn {
    
    EMSTCell *cell = (EMSTCell *)[[btn superview] superview];
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    NSLog(@"被点击的cell在%ld行",indexPath.row);
}

#pragma mark - tableViewDataSource delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.btnTag != 100) {
        return  self.staffList.count;
    }
    return self.stuModelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"STCELL_ID";
    
    EMSTCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[EMSTCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.delegate = self;
    
    if (self.btnTag != 100) {
        EMTeacherList *tModel = self.staffList[indexPath.row];
        cell.model = tModel;
    }else{
        EMStuModel *model = self.stuModelArr[indexPath.row];
        cell.stuModel = model;
    }
        
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"---");
}

#pragma mark - getter

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _searchMaxY, kwidth, kheight - _searchMaxY) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = AAdaption(100);
        
    }
    return _tableView;
}


@end
