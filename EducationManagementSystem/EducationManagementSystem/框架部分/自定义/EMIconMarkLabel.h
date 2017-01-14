//
//  EMIconMarkLabel.h
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMIconMarkLabel : UILabel

//带图片,带下划线,带标题label  新密码：XXXX
- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title TitleCol:(UIColor *)titleCol imageName:(NSString *)imgName Font:(CGFloat)font;


//不带图片
-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title;

@end
