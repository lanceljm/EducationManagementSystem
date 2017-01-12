//
//  EMIconChangeInfo.h
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMIconChangeInfo : UIButton

@property(nonatomic,strong)ButtomClickedWithSender btnClicked;

-(instancetype)initWithFrame:(CGRect)frame withBtnBlock:(ButtomClickedWithSender)btnClicked;

@end
