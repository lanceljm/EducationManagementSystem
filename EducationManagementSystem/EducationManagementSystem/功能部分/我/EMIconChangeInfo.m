//
//  EMIconChangeInfo.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMIconChangeInfo.h"

@implementation EMIconChangeInfo

-(instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName withBtnBlock:(ButtomClickedWithSender)btnClicked {
    self = [super initWithFrame:frame];
    if (self) {
        if (btnClicked) {
            self.btnClicked = btnClicked;
            [self addTarget:self action:@selector(changeImage:) forControlEvents:UIControlEventTouchUpInside];
        }
        UIImageView *iconImage = [[UIImageView alloc]initWithFrame:AAdaptionRect(20, 17, 112, 112)];
        iconImage.image = [UIImage imageNamed:imageName];
        iconImage.layer.cornerRadius = 56;
        iconImage.layer.masksToBounds = YES;
        [self addSubview:iconImage];
        
        UILabel *changeLabel = [[UILabel alloc]initWithFrame:AAdaptionRect(kBaseWidth - 140 - 30, 50, 140, 46)];
        changeLabel.text = @"修改头像";
        changeLabel.textColor = [UIColor cz_colorWithHex:0xb7b7b7];
        changeLabel.textAlignment = NSTextAlignmentCenter;
        changeLabel.font = [UIFont systemFontOfSize:23];
        [self addSubview:changeLabel];
        
    }
    return self;
}

-(void)changeImage:(UIButton *)sender {
    self.btnClicked(sender);
}

@end
