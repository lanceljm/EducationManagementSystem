//
//  EMTabBarController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/6.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMTabBarController.h"
#import "RootViewController.h"

@interface EMTabBarController ()

@end

@implementation EMTabBarController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setVc];
    }
    return self;
}

- (void)setVc {
    
    [self addChildVcWithClassName:@"EMClassViewController" WithTitle:@"班级" WithImageName:@"class" WithSelectedImage:@"class02"];
    [self addChildVcWithClassName:@"EMLeaveViewController" WithTitle:@"批假" WithImageName:@"approve" WithSelectedImage:@"approve02"];
    [self addChildVcWithClassName:@"EMAttendanceController"  WithTitle: @"考勤" WithImageName:@"work-attendance" WithSelectedImage:@"work-attendance02"];
    [self addChildVcWithClassName:@"EMNoticeViewController" WithTitle:@"通知" WithImageName:@"Mail" WithSelectedImage:@"Mail02"];
    [self addChildVcWithClassName:@"EMAboutMeViewController" WithTitle:@"我" WithImageName:@"user" WithSelectedImage:@"user02"];
    
}

- (void)addChildVcWithClassName:(NSString *)className WithTitle:(NSString *)title WithImageName:(NSString*)imgName WithSelectedImage:(NSString *)selectedImg {
    
    UIViewController *vc = [[NSClassFromString(className) alloc] init];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:imgName] selectedImage:[UIImage imageNamed:selectedImg]];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.barTintColor = BLUE_COLOR;
    nav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    nav.navigationBar.tintColor = [UIColor whiteColor];
    
    
    vc.title = title;
    [self addChildViewController:nav];
    
    
}


@end
