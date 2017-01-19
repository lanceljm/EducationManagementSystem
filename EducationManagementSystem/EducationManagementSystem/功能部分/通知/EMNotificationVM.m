//
//  EMNotificationVM.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/13.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMNotificationVM.h"
#import "EMNotificationModel.h"
#import <MJExtension.h>

@implementation EMNotificationVM

-(void)loadNetData:(void (^)(BOOL isOK))isSuccess {
    
    _dataSourceArr = [NSMutableArray array];
    
    NSString *userType = USER_INFO[@"staffPost"];
    if ([userType isEqualToString:@"学生"] ) {
        userType = @"学生";
    }else {
        userType = @"教职工";
    }
    NSDictionary *parm = @{@"userId":USER_INFO[@"staffId"],@"userType":userType};
    [NetRequest GET:getNotificationUrl parameters:parm success:^(id responseObject) {
        NSArray *resultArr = [NSArray arrayWithArray: responseObject[@"result"]];
        //循环遍历，给模型赋值
        NSLog(@"%@",responseObject);
        for (NSDictionary *dic in resultArr) {
            //使用三方循环转换
            EMNotificationModel *model = [EMNotificationModel mj_objectWithKeyValues:dic];
            [_dataSourceArr addObject:model];
        }
        isSuccess(YES);
    } failture:^(NSError *error) {
        NSLog(@"网络错误%@",error);
        isSuccess(NO);
    }];
    
}

@end
