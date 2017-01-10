//
//  EMClassViewModel.h
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/10.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMClassViewModel : NSObject

- (void)loadDataWithFinish:(void(^)(BOOL))isSuccess;

@end
