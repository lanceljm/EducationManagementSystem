//
//  EMDetailModel.h
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/13.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EMStuModel.h"

@interface EMDetailModel : NSObject

@property(nonatomic,strong) NSString *rollcallStudentType;
@property(nonatomic,strong) EMStuModel *student;


@end
