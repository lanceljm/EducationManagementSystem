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

//    NSString *urlStr = @"http://192.168.0.117/api/staff/login.html";
//    NSDictionary *para = @{@"account":@"Q16078856",@"password":@"888888"};
    NSString *urlStr = @"http://192.168.0.117/api/staff/getClassList.html";
    NSDictionary *paramters = @{@"staffId":@232,@"teacher":@1,@"token":@"b6d4d0358d344184884247420183a85f"};
    [NetRequest GET:urlStr parameters:paramters success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        isSuccess(YES);
    } failture:^(NSError *error) {
        NSLog(@"%@",error);
        isSuccess(NO);
    }];
    
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
