//
//  BaseViewController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/6.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTipsLabel];
    self.view.backgroundColor = [UIColor greenColor];

}

- (void)setTipsLabel {
    _tips = [[UILabel alloc] initWithFrame:self.view.bounds];
    _tips.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_tips];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
