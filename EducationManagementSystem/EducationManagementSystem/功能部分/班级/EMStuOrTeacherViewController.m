//
//  EMStuOrTeacherViewController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/9.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMStuOrTeacherViewController.h"
#import "EMSearchBarView.h"

@interface EMStuOrTeacherViewController ()

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,assign) CGFloat searchMaxY;



@end

@implementation EMStuOrTeacherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    EMSearchBarView *searchV = [[EMSearchBarView alloc] initWithFrame:CGRectMake(0, 64/AAdaptionWidth(), 750, 120)];
    _searchMaxY = CGRectGetMaxY(searchV.frame);
    [self.view addSubview:searchV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getter

//- (UITableView *)tableView {
//    
//    if (!_tableView) {
//        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _searchMaxY, kwidth, kheight - _searchMaxY) style:UITableViewStylePlain];
//    }
//    return _tableView;
//}


@end
