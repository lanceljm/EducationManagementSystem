//
//  EMDetailNotificationVC.h
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/14.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMNotificationModel.h"

@interface EMDetailNotificationVC : UIViewController

@property(nonatomic,strong)NSString *contents;

@property(nonatomic,strong)NSString *titleString;
@property(nonatomic,strong)NSString *timeString;

@property(nonatomic,strong)EMNotificationModel *model;

@end
