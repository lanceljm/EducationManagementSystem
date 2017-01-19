//
//  EMTipView.h
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/18.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMNotificationModel.h"

@interface EMTipView : UIButton

@property(nonatomic,strong)ButtomClickedWithSender btnClicked;
@property(nonatomic,strong)EMNotificationModel *model;

-(instancetype)initWithFrame:(CGRect)frame withTipTitle:(NSString *)title withTime:(NSString *)time withBlock:(ButtomClickedWithSender)clicked;

@end
