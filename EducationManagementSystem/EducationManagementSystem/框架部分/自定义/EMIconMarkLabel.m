//
//  EMIconMarkLabel.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMIconMarkLabel.h"
#import "EMIconDirectionButton.h"

@implementation EMIconMarkLabel

- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title TitleCol:(UIColor *)titleCol imageName:(NSString *)imgName Font:(CGFloat)font
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat H = self.frame.size.height;
        EMIconDirectionButton *btn = [[EMIconDirectionButton alloc] initWithFrame:CGRectMake(AAdaption(-220), 0, AAdaption(200), H) withTag:0 withTitle:title withTitleColor:titleCol withImage:imgName withFont:font withDirection:left withBlock:nil];
        self.font = AAFont(font+10);
        [self addSubview:btn];
    }
    return self;
}


@end
