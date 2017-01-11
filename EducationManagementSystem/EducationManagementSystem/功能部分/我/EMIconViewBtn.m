//
//  EMIconViewBtn.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMIconViewBtn.h"

@implementation EMIconViewBtn

-(instancetype)initWithFrame:(CGRect)frame withTag:(NSInteger)tag withClickBlock:(ButtomClickedWithSender)btnClicked {
    self = [super initWithFrame:frame];
    if (self) {
        self.tag = tag;
        if (btnClicked) {
            self.btnClicked = btnClicked;
            [self addTarget:self action:@selector(btnTouchUpinside:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return self;
}

-(void)btnTouchUpinside:(UIButton *)sender {
    self.btnClicked(sender);
}

@end
