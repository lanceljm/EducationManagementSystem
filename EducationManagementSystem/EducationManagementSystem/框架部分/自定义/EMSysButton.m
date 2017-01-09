//
//  EMSystem.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/9.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMSysButton.h"

@implementation EMSysButton

-(instancetype)initWithFrame:(CGRect)frame withTag:(NSInteger)tag withTitle:(NSString *)title withTitleColor:(UIColor *)titleColor withBackgrougdColor:(UIColor *)bgColor withCornerRadious:(CGFloat)corner withClickedBlock:(ButtomClickedWithSender)clicked {
    //corner：0 -- 0.5
    self = [super initWithFrame:frame];
    if (self) {
        if (clicked) {
            self.btnClicked = clicked;
            [self addTarget:self action:@selector(btnTouchupInside:) forControlEvents:UIControlEventTouchUpInside];
        }
        self.tag = tag;
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        [self setBackgroundColor:bgColor];
        self.layer.cornerRadius = self.frame.size.height*corner;
    }
    return self;
}

-(void)btnTouchupInside:(UIButton *)sender {
    self.btnClicked(sender);
}

@end
