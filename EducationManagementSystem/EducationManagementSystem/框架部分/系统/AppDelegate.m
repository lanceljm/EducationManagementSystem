//
//  AppDelegate.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/6.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MBProgressHUD.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[RootViewController alloc]init];
    [self.window makeKeyAndVisible];
    
    [AMapServices sharedServices].apiKey = @"4cf61caa3709d177eb7bbe9683f8b36c";
    
    
    //注册本地通知设置
    UIUserNotificationType types = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [application registerUserNotificationSettings:settings];
    
    //添加本地通知
    [self addLocalNotification];
    
    return YES;
}

-(void)addLocalNotification{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    // 初始化本地通知对象
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    if (notification) {
        
        //获得闹钟设定的时间
        NSDate *setDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"setTipDate"];
        
        // 设置通知的提醒时间
        NSDate *currentDate   = setDate;//[NSDate date];
        notification.timeZone = [NSTimeZone defaultTimeZone]; // 使用本地时区
        
        if (currentDate == setDate) {
            
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
            hud.mode = MBProgressHUDModeIndeterminate;
            hud.label.text = @"通知";
            hud.detailsLabel.text = @"查看详情";
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                hud.hidden = YES;
            });
            
            notification.fireDate = currentDate;
            // 设置重复间隔
            notification.repeatInterval = kCFCalendarUnitMinute;
            // 设置提醒的文字内容
            notification.alertBody   = @"哈喽，那个男孩！起床了啊";
            notification.alertAction = NSLocalizedString(@"起床了", nil);
            // 通知提示音 使用默认的
            notification.soundName= UILocalNotificationDefaultSoundName;
            // 设置应用程序右上角的提醒个数
            notification.applicationIconBadgeNumber++;
            // 设定通知的userInfo，用来标识该通知
            NSMutableDictionary *aUserInfo = [[NSMutableDictionary alloc] init];
            
            //        aUserInfo[kLocalNotificationID] = @"LocalNotificationID";
            
            notification.userInfo = aUserInfo;
        }
        
//        notification.fireDate = currentDate;


        // 将通知添加到系统中
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
    NSArray *localNotifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
    
    NSLog(@"%@", localNotifications);
    
}
-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    
    NSLog(@"Application did receive local notifications");
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"welcome" delegate:nil
    //                                          cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    //    [alert show];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
