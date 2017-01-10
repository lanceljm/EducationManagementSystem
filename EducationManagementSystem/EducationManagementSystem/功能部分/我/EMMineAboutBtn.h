//
//  EMMineAboutBtn.h
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/10.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMMineAboutBtn : UIButton

@property(nonatomic,strong)ButtomClickedWithSender btnClicked;

-(instancetype)initWithFrame:(CGRect)frame withTag:(NSInteger)tag withLeftImageName:(NSString *)imageName withTextLabel:(NSString *)text withTextColor:(UIColor *)textColor withTextFontSize:(CGFloat)textFontSize withRightName:(NSString *)rightName withClickedBlock:(ButtomClickedWithSender)clicked;



@end
