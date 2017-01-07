//
//  EMLoginViewController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/6.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMLoginViewController.h"

@interface EMLoginViewController ()

@end

@implementation EMLoginViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tips.text = @"登录见面，点击消失";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
