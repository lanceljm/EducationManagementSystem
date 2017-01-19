//
//  EMTipView.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/18.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMTipView.h"

@implementation EMTipView

-(instancetype)initWithFrame:(CGRect)frame withTipTitle:(NSString *)title withTime:(NSString *)time withBlock:(ButtomClickedWithSender)clicked {
    self = [super initWithFrame:frame];
    if (self) {
        if (clicked) {
            self.btnClicked = clicked;
            [self addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        self.backgroundColor = [UIColor cz_colorWithRed:255 green:255 blue:255];
        
//        UIImageView *imageView = [[UIImageView alloc]initWithFrame:AAdaptionRect(20, 45, 50, 50)];
//        imageView.image = [UIImage imageNamed:@"圆圈"];
//        [self addSubview:imageView];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:AAdaptionRect(90, 20, kwidth/AAdaptionWidth() - 90 -30, 50)];
        titleLabel.text = title;
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.font = AAFont(32);
        [self addSubview:titleLabel];
        
        UILabel *timeLabel = [[UILabel alloc]initWithFrame:AAdaptionRect(90, 80, kwidth/AAdaptionWidth() - 90 -30, 40)];
        timeLabel.text = time;
        timeLabel.textColor = [UIColor redColor];
        timeLabel.font = AAFont(26);
        [self addSubview:timeLabel];
    }
    return self;
}

-(void)changeColor:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.btnClicked(sender);
}

@end
