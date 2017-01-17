//
//  EMClassViewModel.h
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/10.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMClassViewModel : NSObject

@property(nonatomic,strong) NSMutableArray *viewModelArr;


- (void)loadDataWithFinish:(void(^)(BOOL isOk))isSuccess;

@end
