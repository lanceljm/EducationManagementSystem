//
//  EMSearchBarView.h
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/9.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^textChangeBlock)(NSString* text);

@interface EMSearchBarView : UIView

@property(nonatomic,copy) textChangeBlock textBlock;

- (instancetype)initWithFrame:(CGRect)frame WithTextChangeBlock:(textChangeBlock)block;

@end
