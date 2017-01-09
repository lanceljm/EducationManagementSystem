//
//  EMLeaveViewController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/6.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMLeaveViewController.h"

@interface EMLeaveViewController ()

@end

@implementation EMLeaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"history"] style:UIBarButtonItemStyleDone target:self action:@selector(btnClicked)];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = btn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)btnClicked {
    NSLog(@"批假界面的历史记录");
}

@end
