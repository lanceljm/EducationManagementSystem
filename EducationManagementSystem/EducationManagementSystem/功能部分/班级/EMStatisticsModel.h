//
//  EMStatisticsModel.h
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/13.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMStatisticsModel : NSObject

@property(nonatomic,assign) CGFloat absent;  // 旷课
@property(nonatomic,assign) CGFloat late; //迟到
@property(nonatomic,assign) CGFloat leaveEarly; //早退
@property(nonatomic,assign) CGFloat ask; //请假
@property(nonatomic,assign) CGFloat rollcall; //正常

@property(nonatomic,strong) NSString *curriculumStartTime; //课程开始时间
@property(nonatomic,strong) NSString *curriculumEndTime;

@property(nonatomic,strong) NSString *teacherName;
@property(nonatomic,strong) NSString *curriculumName; //班级名称


@property(nonatomic,assign) NSNumber *curriculumId;


@end
