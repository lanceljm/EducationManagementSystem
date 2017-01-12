//
//  EMMySingleton.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/12.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMMySingleton.h"

@implementation EMMySingleton

+(instancetype)sharedUserInfo {
    static EMMySingleton *sharedSingleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSingleton = [[EMMySingleton alloc]init];
    });
    return sharedSingleton;
}



@end
