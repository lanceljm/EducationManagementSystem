//
//  EMBaseInfoLabel.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/12.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMBaseInfoLabel.h"

@implementation EMBaseInfoLabel

-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title withContent:(NSString *)content {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor cz_colorWithRed:255 green:255 blue:255];
        
        UILabel *blueTitle = [[UILabel alloc]initWithFrame:AAdaptionRect(30, 30, 80, 40)];
        blueTitle.text = title;
        blueTitle.textColor = [UIColor cz_colorWithHex:0x2269d5];
        blueTitle.font = AAFont(30);
        
        [self addSubview:blueTitle];
        
        UILabel *contentLabel = [[UILabel alloc]initWithFrame:AAdaptionRect(CGRectGetMaxX(blueTitle.frame)/AAdaptionWidth() + 50, 30, kBaseWidth - (CGRectGetMaxX(blueTitle.frame)/AAdaptionWidth() + 50) , 40)];
        contentLabel.text = content;
        contentLabel.textColor = [UIColor cz_colorWithHex:0x4f4f4f];
        contentLabel.font = AAFont(32);
        [self addSubview:contentLabel];
        
        UILabel *lineLabel = [[UILabel alloc]initWithFrame:AAdaptionRect(0, 98, kBaseWidth, 2)];
        lineLabel.backgroundColor = [UIColor cz_colorWithHex:0xdddddd];
        [self addSubview:lineLabel];
    }
    return self;
}

@end
