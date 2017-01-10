//
//  EMMineAboutBtn.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/10.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMMineAboutBtn.h"

@implementation EMMineAboutBtn

-(instancetype)initWithFrame:(CGRect)frame withTag:(NSInteger)tag withLeftImageName:(NSString *)imageName withTextLabel:(NSString *)text withTextColor:(UIColor *)textColor withTextFontSize:(CGFloat)textFontSize withRightName:(NSString *)rightName withClickedBlock:(ButtomClickedWithSender)clicked {
    self = [super initWithFrame:frame];
    if (self) {
        self.tag = tag;
        if (clicked) {
            self.btnClicked = clicked;
            [self addTarget:self action:@selector(btnTouchUIinside:) forControlEvents:UIControlEventTouchUpInside];
        }

        //左边图片
        UIImageView *leftImage = [[UIImageView alloc]initWithFrame:AAdaptionRect(36, 25, 50, 50)];
        [leftImage setImage:[UIImage imageNamed:imageName]];
        [self addSubview:leftImage];
        
        //文字
        UILabel *label = [[UILabel alloc]initWithFrame:AAdaptionRect(116, 30, self.frame.size.width/AAdaptionWidth(), 40)];
        label.text = text;
        label.textColor = textColor;
        label.font = [UIFont systemFontOfSize:textFontSize];
        [self addSubview:label];
        
        //右边图片
        UIImageView *rightImage = [[UIImageView alloc]initWithFrame:AAdaptionRect(kBaseWidth - 40 - 54, 30, 40, 40)];
        [rightImage setImage:[UIImage imageNamed:rightName]];
        [self addSubview:rightImage];
        
        
        //分割线
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:AAdaptionRect(0, self.frame.size.height/AAdaptionWidth() - 2 , self.frame.size.width/AAdaptionWidth(), 2)];
        lineLabel.backgroundColor = [UIColor grayColor];
        [self addSubview:lineLabel];
        
        //设置背景颜色的时候可能会影响各个空间的尺寸
        self.backgroundColor = [UIColor clearColor];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.imageView.backgroundColor = [UIColor clearColor];
    
    }
    return self;
}

-(void)btnTouchUIinside:(UIButton *)sender {
    self.btnClicked(sender);
}

@end
