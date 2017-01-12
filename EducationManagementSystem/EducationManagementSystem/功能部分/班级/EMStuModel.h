//
//  EMStuModel.h
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/12.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMStuModel : NSObject

@property(nonatomic,strong) NSString *studentTelphone;
@property(nonatomic,assign) NSInteger studentId;
@property(nonatomic,strong) NSDictionary *scoll;
@property(nonatomic,strong) NSString *studentName;
@property(nonatomic,strong) NSString *studentSex;

@end
