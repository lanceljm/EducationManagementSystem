//
//  EMLeftBarBtn.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMLeftBarBtn.h"

@implementation EMLeftBarBtn

-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title withImage:(NSString *)imageImage withBgimage:(NSString *)bgImageName withAction:(SEL)action {
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:imageImage] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
        [self addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}


@end
