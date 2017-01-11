//
//  EMIconViewBtn.h
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMIconViewBtn : UIButton

@property(nonatomic,strong)ButtomClickedWithSender btnClicked;

-(instancetype)initWithFrame:(CGRect)frame withTag:(NSInteger)tag withClickBlock:(ButtomClickedWithSender)btnClicked;

@end
