//
//  EMFeedBackTV.h
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/12.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMFeedBackTV : UIView

@property(nonatomic,strong)UITextView *textView;

-(instancetype)initWithFrame:(CGRect)frame withTextColor:(UIColor *)textColor withFontSize:(CGFloat)fontSize withBgColor:(UIColor *)bgColor withCornerRadious:(CGFloat)corner;

@end
