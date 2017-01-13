//
//  EMUserinfoLabel.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMUserinfoLabel.h"

@implementation EMUserinfoLabel

-(instancetype)initWithFrame:(CGRect)frame withText:(NSString *)text withTextColor:(UIColor *)textColor withTextCenter:(NSTextAlignment)textCenter withTextFontSize:(CGFloat)textFontSize {
    self = [super initWithFrame:frame];
    if (self) {
        [self setText:text];
        [self setTextColor:textColor];
        [self setTextAlignment:textCenter];
        [self setFont:AAFont(textFontSize)];
    }
    return self;
}

@end
