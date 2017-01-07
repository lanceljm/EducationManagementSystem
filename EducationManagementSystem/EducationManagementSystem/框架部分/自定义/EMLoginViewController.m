//
//  EMLoginViewController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/6.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMLoginViewController.h"
#import "EMIconUnderLineTextF.h"

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
    self.view.backgroundColor = [UIColor whiteColor];

    /*
     *  注释部分为测试代码 可删除
     *
    EMIconUnderLineTextF *count = [[EMIconUnderLineTextF alloc] initWithFrame:AAdaptionRect(120, 120, 300, 44) andImageName:@"User" withPlaceholder:@"请输入账号"];
    [self.view addSubview:count];
    */
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
