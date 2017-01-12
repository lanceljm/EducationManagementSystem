//
//  EMIconChangeInfo.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMIconChangeInfo.h"
#import <UIImageView+AFNetworking.h>

@implementation EMIconChangeInfo

-(instancetype)initWithFrame:(CGRect)frame withBtnBlock:(ButtomClickedWithSender)btnClicked {
    self = [super initWithFrame:frame];
    if (self) {
        if (btnClicked) {
            self.btnClicked = btnClicked;
            [self addTarget:self action:@selector(changeImage:) forControlEvents:UIControlEventTouchUpInside];
        }
        self.backgroundColor = [UIColor cz_colorWithRed:255 green:255 blue:255];
        
        UILabel *changeLabel = [[UILabel alloc]initWithFrame:AAdaptionRect(kBaseWidth - 160 - 30, 50, 160, 46)];
        changeLabel.text = @"修改头像";
        changeLabel.textColor = [UIColor cz_colorWithHex:0xb7b7b7];
        changeLabel.textAlignment = NSTextAlignmentCenter;
        changeLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:changeLabel];
        
        UIImageView *iconImage = [[UIImageView alloc]initWithFrame:AAdaptionRect(20, 17, 112, 112)];
        NSDictionary *staffDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserInfo"];
        if ([staffDic[@"staffPicture"] isEqualToString:@""]) {
            if ([staffDic[@"staffSex"] isEqualToString:@"男"]) {
                iconImage.image = [UIImage imageNamed:@"默认头像男"];
            }else {
                iconImage.image = [UIImage imageNamed:@"默认头像女"];
            }
        }else {
            NSString *pictureUrl = [NSString stringWithFormat:@"http://192.168.0.117%@",staffDic[@"staffPicture"]];
            NSURL *picUrl = [NSURL URLWithString:pictureUrl];
            iconImage.layer.cornerRadius = 112/4;
            iconImage.layer.masksToBounds = YES;
            [iconImage setImageWithURL:picUrl];
        }
        [self addSubview:iconImage];
        
    }
    
    return self;
}

-(void)changeImage:(UIButton *)sender {
    self.btnClicked(sender);
}

@end
