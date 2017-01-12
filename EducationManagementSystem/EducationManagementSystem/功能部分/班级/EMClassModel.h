//
//  EMClassModel.h
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/10.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EMTeacherList.h"

@interface EMClassModel : NSObject

@property(nonatomic,strong) NSString *classSum;
@property(nonatomic,strong) NSString *className;
@property(nonatomic,strong) NSArray<EMTeacherList*> *staffList;


@end
