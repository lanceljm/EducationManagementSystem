//
//  RootViewController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/6.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "RootViewController.h"
#import "EMLoginViewController.h"
#import "EMLuanchViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setControllerS];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //注册通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(againLogin) name:@"againLoginVc" object:nil];
}

//重新登录
-(void)againLogin {
    [self setTabVc];
    [self setLoginVc];
}

-(void)dealloc {
    //移除通知
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setControllerS {
    [self setTabVc];
    [self setLoginVc];
    [self setLuanchVc];
}

- (void)setLoginVc {
    EMLoginViewController *login = [[EMLoginViewController alloc] init];
    [self addChildViewController:login];
    [self.view addSubview:login.view];
}

- (void)setLuanchVc {
    EMLuanchViewController *luanch = [[EMLuanchViewController alloc] init];
    [self addChildViewController:luanch];
    [self.view addSubview:luanch.view];
}

- (void)setTabVc {
    EMTabBarController *tabVc = [[EMTabBarController alloc] init];
    [self.view addSubview:tabVc.view];
    [self addChildViewController:tabVc];
    
}



@end
