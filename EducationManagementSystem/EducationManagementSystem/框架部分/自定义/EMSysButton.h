//
//  EMSystem.h
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/9.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMSysButton : UIButton

@property(nonatomic,strong)ButtomClickedWithSender btnClicked;

-(instancetype)initWithFrame:(CGRect)frame withTag:(NSInteger)tag withTitle:(NSString *)title withTitleColor:(UIColor *)titleColor withBackgrougdColor:(UIColor *)bgColor withCornerRadious:(CGFloat)corner withClickedBlock:(ButtomClickedWithSender)clicked;

@end
