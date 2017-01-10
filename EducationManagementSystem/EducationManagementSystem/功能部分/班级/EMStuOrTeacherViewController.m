//
//  EMStuOrTeacherViewController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/9.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMStuOrTeacherViewController.h"
#import "EMSearchBarView.h"
#import "EMStuCell.h"

@interface EMStuOrTeacherViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,assign) CGFloat searchMaxY;



@end

@implementation EMStuOrTeacherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    EMSearchBarView *searchV = [[EMSearchBarView alloc] initWithFrame:CGRectMake(0, 64/AAdaptionWidth(), 750, 120)];
    _searchMaxY = CGRectGetMaxY(searchV.frame);
    [self.view addSubview:searchV];

    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - tableViewDataSource delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EMStuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"stuID"];
    
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
        [_tableView registerClass:[EMStuCell class] forCellReuseIdentifier:@"stuID"];
    }
    return _tableView;
}


@end
