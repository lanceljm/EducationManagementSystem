//
//  EMLeaveListViewModel.h
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/14.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMLeaveListViewModel : NSObject

@property(nonatomic,strong) NSMutableArray *listViewModel;


- (void)downLoadDataWithStatus:(NSNumber *)status withFinish:(void(^)(BOOL success))finished;


@end
