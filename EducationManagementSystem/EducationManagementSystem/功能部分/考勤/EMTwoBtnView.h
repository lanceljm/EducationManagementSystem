//
//  EMTwoBtnView.h
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMTwoBtnView : UIView

- (instancetype)initWithLeftDirectionFrame:(CGRect)frame WithBKColor:(UIColor*)bgCol btnNames:(NSArray *)btnNames TitleCols:(UIColor*)TCol WithImages:(NSArray*)imgArr WithFont:(CGFloat)font WithSelectorBtnBlock:(void(^)(UIButton*))btn;

@end
