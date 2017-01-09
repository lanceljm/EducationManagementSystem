//
//  EMIconDirectionButton.h
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/9.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum :NSUInteger {
    top,
    bottom,
    right,
    left,
} IconDirection;

//typedef void(^btnClicked)(id sender);

@interface EMIconDirectionButton : UIButton

@property(nonatomic,copy) ButtomClicked block;

- (instancetype)initWithFrame:(CGRect)frame withTag:(NSInteger)BtnTag withTitle:(NSString *)title withTitleColor:(UIColor *)col withImage:(NSString *)image withFont:(CGFloat)font withDirection:(IconDirection)dir withBlock:(ButtomClicked)block;

@end
