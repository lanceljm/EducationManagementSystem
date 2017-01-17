//
//  EMNotificationVM.h
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/13.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMNotificationVM : NSObject

@property(nonatomic,strong)NSMutableArray *dataSourceArr;

-(void)loadNetData:(void(^)(BOOL))isSuccess;

@end
