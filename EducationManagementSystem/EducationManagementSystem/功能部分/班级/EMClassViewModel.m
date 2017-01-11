//
//  EMClassViewModel.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/10.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMClassViewModel.h"
#import "URL.h"

@implementation EMClassViewModel


- (void)loadDataWithFinish:(void(^)(BOOL))isSuccess {

    NSDictionary *userInfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserInfo"];
    NSNumber *staffId = userInfo[@"staffId"];
    NSNumber *administrationId = userInfo[@"administrationId"];
    NSString *token = userInfo[@"token"];
    
    NSDictionary *paramters = @{@"staffId":staffId,@"teacher":administrationId,@"token":token};
    [NetRequest GET:getClassList parameters:paramters success:^(id responseObject) {
//        NSLog(@"%@",responseObject);
        NSArray *result = responseObject[@"result"];
        NSLog(@"%@",result);
        isSuccess(YES);
    } failture:^(NSError *error) {
        isSuccess(NO);

    }];
    
    
    //    NSString *urlStr = @"http://192.168.0.117/api/staff/login.html";
    //    NSDictionary *para = @{@"account":@"Q16078856",@"password":@"888888"};
    //    NSString *urlStr = @"http://192.168.0.117/api/staff/getClassList.html";
    //UserInfoSave

    //232,a230ff516bac4cf6b921e363e1315b8a
    //
    
//    [NetRequest GET:urlStr parameters:paramters success:^(id responseObject) {
//        isSuccess(YES);
//        NSLog(@"%@",responseObject);
//    } failture:^(NSError *error) {
//        isSuccess(NO);
//    }];
    
}

@end
