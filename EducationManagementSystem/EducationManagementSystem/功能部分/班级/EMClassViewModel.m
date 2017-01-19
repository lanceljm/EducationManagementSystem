//
//  EMClassViewModel.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/10.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMClassViewModel.h"
#import "URL.h"
#import "EMClassModel.h"
#import <MJExtension.h>

@implementation EMClassViewModel


- (void)loadDataWithFinish:(void(^)(BOOL isOk))isSuccess {
    _viewModelArr = [NSMutableArray new];
    
    NSDictionary *userInfo = [[NSUserDefaults standardUserDefaults] objectForKey:UserInfoKey];
    if (!userInfo) {
        return;
    }
    NSNumber *staffId = userInfo[@"staffId"];
    NSNumber *administrationId = userInfo[@"administrationId"];
    NSString *token = userInfo[@"token"];
    //NSLog(@"%@",userInfo);
    NSDictionary *paramters = @{@"staffId":staffId,@"teacher":administrationId,@"token":token};
    
    [NetRequest GET:getClassList parameters:paramters success:^(id responseObject) {
        NSArray *result = responseObject[@"result"];
        NSLog(@"-----result-----%@",result);
        for (NSDictionary *dic in result) {
            EMClassModel *model = [EMClassModel mj_objectWithKeyValues:dic];
            [_viewModelArr addObject:model];
        }
//        for (EMClassModel *model in _viewModelArr) {
//            //NSLog(@"%@",model.className);
//            for (EMTeacherList *Tm in model.staffList) {
//            //NSLog(@"%@---------/n--------%@",Tm.staffName,Tm.curriculum);
//            }
//        }
        
        isSuccess(YES);
    } failture:^(NSError *error) {
        isSuccess(NO);

    }];
    
}

@end
