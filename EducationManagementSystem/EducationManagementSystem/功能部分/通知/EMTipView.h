//
//  EMTipView.h
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/18.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMTipView : UIButton

@property(nonatomic,strong)ButtomClickedWithSender btnClicked;

-(instancetype)initWithFrame:(CGRect)frame withTipTitle:(NSString *)title withTime:(NSString *)time withBlock:(ButtomClickedWithSender)clicked;

@end
