//
//  EMSelfNotificationView.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/14.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMSelfNotificationView.h"

@implementation EMSelfNotificationView

-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title withContents:(NSString *)contents withTime:(NSString *)time {
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *titleText = [[UILabel alloc]initWithFrame:AAdaptionRect(20, 30, kwidth/AAdaptionWidth() - 20*2, 50)];
        titleText.text = title;
        titleText.textColor = [UIColor cz_colorWithRed:0 green:0 blue:0];
        titleText.textAlignment = NSTextAlignmentCenter;
        titleText.font = AAFont(30);
        [self addSubview:titleText];
        
        UILabel *contentLabel = [[UILabel alloc]initWithFrame:AAdaptionRect(20, 110, kwidth/AAdaptionWidth() - 20*2, 200)];
        contentLabel.text = contents;
        contentLabel.textAlignment = NSTextAlignmentCenter;
        contentLabel.font = AAFont(25);
        [self addSubview:contentLabel];
        
        UILabel *timeLabel = [[UILabel alloc]initWithFrame:AAdaptionRect(500, 350, 160, 45)];
        timeLabel.text = time;
        timeLabel.textColor = [UIColor cz_colorWithRed:0 green:0 blue:0];
        timeLabel.textAlignment = NSTextAlignmentCenter;
        timeLabel.font = AAFont(25);
        [self addSubview:timeLabel];
    }
    return self;
}

@end
