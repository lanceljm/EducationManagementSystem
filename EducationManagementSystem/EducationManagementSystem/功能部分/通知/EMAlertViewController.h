//
//  EMAlertViewController.h
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/18.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMNotificationModel.h"

@interface EMAlertViewController : UIViewController

@property(nonatomic,strong)NSString *titleStr;
@property(nonatomic,strong)NSString *timeStr;

@property(nonatomic,strong)EMNotificationModel *model;

@end
