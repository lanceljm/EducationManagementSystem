//
//  EMLuanchViewController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/6.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMLuanchViewController.h"
#import "EMSysButton.h"

@interface EMLuanchViewController ()

@end

@implementation EMLuanchViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tips.text = @"加载页面,点击消失";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
