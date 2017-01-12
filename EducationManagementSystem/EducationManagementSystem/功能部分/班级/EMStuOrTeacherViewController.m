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

@interface EMStuOrTeacherViewController ()<UITableViewDelegate,UITableViewDataSource,cellBtnClickedDelegate>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,assign) CGFloat searchMaxY;

@end

@implementation EMStuOrTeacherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)addSearchView {
    
    EMSearchBarView *searchV = [[EMSearchBarView alloc] initWithFrame:CGRectMake(0, 64/AAdaptionWidth(), 750, 120) WithTextChangeBlock:^(NSString *text) {
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
    return  10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"STCELL_ID";
    
    EMSTCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[EMSTCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.delegate = self;
    
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
