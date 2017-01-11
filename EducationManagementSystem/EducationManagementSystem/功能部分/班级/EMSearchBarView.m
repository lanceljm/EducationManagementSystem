//
//  EMSearchBarView.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/9.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMSearchBarView.h"

@implementation EMSearchBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:AAdaptionRectFromFrame(frame)];
    if (self) {
        self.backgroundColor = [UIColor cz_colorWithHex:0xedeff1];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:AAdaptionRect(20, 20, 710,75)];
        btn.layer.cornerRadius = AAdaption(frame.size.height/2 - 20);
        btn.backgroundColor = [UIColor whiteColor];
        btn.layer.borderColor = [UIColor cz_colorWithHex:0xb9b9b9].CGColor;
        btn.layer.borderWidth = 1;
        [self addSubview:btn];
        
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:AAdaptionRect(30,30,60,60)];
//        imageView.backgroundColor = [UIColor redColor];
        imageView.image = [UIImage imageNamed:@"search"];
        [self addSubview:imageView];
        
        UITextField *textF = [[UITextField alloc] initWithFrame:AAdaptionRect(95, 22, 710, 71)];
        textF.borderStyle = UITextBorderStyleNone;
        textF.backgroundColor = [UIColor clearColor];
        [self addSubview:textF];
        
    }
    return self;
}

@end
