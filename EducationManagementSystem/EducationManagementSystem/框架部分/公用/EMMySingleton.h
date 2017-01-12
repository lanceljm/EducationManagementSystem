//
//  EMMySingleton.h
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/12.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol mysingleton <NSObject>

@property(nonatomic,strong)NSDictionary *userInfo;

@end

@interface EMMySingleton : NSObject

+(instancetype)sharedUserInfo;

@end
