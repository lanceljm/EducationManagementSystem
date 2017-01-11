//
//  EMLeftBarBtn.h
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMLeftBarBtn : UIButton

-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title withImage:(NSString *)imageImage withBgimage:(NSString *)bgImageName withAction:(SEL)action;

@end
