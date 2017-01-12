//
//  EMTeacherList.h
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/12.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMTeacherList : NSObject

@property(nonatomic,strong) NSString *staffName;
@property(nonatomic,strong) NSString *staffTelphone;
@property(nonatomic,strong) NSDictionary *curriculum;
@property(nonatomic,strong) NSString *staffSex;
@property(nonatomic,assign) NSInteger staffId;



@end
