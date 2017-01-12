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
        UILabel *blueTitle = [[UILabel alloc]initWithFrame:AAdaptionRect(30, 30, 80, 40)];
        blueTitle.text = title;
        blueTitle.textColor = [UIColor cz_colorWithHex:0x2269d5];
        blueTitle.font = [UIFont systemFontOfSize:20];
        [self addSubview:blueTitle];
        
        UILabel *contentLabel = [[UILabel alloc]initWithFrame:AAdaptionRect(30 + 58 + 80, 30, kBaseWidth - (30 + 58 + 80) , 40)];
        contentLabel.text = content;
        contentLabel.textColor = [UIColor cz_colorWithHex:0x4f4f4f];
        contentLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:contentLabel];
        
        UILabel *lineLabel = [[UILabel alloc]initWithFrame:AAdaptionRect(0, 98, kBaseWidth, 2)];
        lineLabel.backgroundColor = [UIColor cz_colorWithHex:0xdddddd];
        [self addSubview:lineLabel];
    }
    return self;
}

@end
