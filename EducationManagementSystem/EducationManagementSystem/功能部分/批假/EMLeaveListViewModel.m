//
//  EMLeaveListViewModel.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/14.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMLeaveListViewModel.h"
#import "EMleaveModel.h"

@implementation EMLeaveListViewModel


- (void)downLoadDataWithStatus:(NSNumber *)status withFinish:(void (^)(BOOL))finished {
    
    _listViewModel = [NSMutableArray new];
    
    NSDictionary *para = @{@"staffId":USER_INFO[@"staffId"] ,@"history":status,@"token": USER_INFO[@"token"],};
    [NetRequest GET:getStaffList parameters:para success:^(id responseObject) {
        
        NSArray *result = responseObject[@"result"];
        NSLog(@"------------学生请假列表----------\n%@",result);
        
        for (NSDictionary *dict in result) {
            EMleaveModel *model = [EMleaveModel mj_objectWithKeyValues:dict];
            NSLog(@"------%@------%@",model.askForLeaveStatus,model.student.studentName);
            [_listViewModel addObject:model];
        }
        finished(YES);
    } failture:^(NSError *error) {
        finished(NO);
    }];
    

}


@end
