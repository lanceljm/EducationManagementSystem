//
//  EMleaveModel.h
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/14.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EMStuModel.h"

@interface EMleaveModel : NSObject

@property(nonatomic,strong) NSString *askForLeaveStartTime;
@property(nonatomic,strong) NSString *askForLeaveEndTime;

@property(nonatomic,strong) NSString *askForLeaveContent; //请假原因
@property(nonatomic,strong) NSString *askForLeaveType;  //请假类型
@property(nonatomic,strong) NSString *askForLeaveStatus;  //批假状态
@property(nonatomic,strong) NSNumber *askForLeaveId;


@property(nonatomic,strong) EMStuModel *student;



@end
