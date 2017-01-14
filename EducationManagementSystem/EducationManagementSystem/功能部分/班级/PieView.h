//
//  PieView.h
//  PieDemo
//
//  Created by zhengbing on 10/01/2017.
//  Copyright © 2017 zhengbing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TouchBlock)(NSInteger index);

@interface PieView : UIView

@property(nonatomic, copy) TouchBlock touchBlock;
@property(nonatomic,strong)NSArray <NSNumber *> *rateArray;       //比例



-(instancetype)initWithFrame:(CGRect)frame withRadius:(CGFloat)r withColorArray:(NSArray *)colorArr withRateArray:(NSArray *)rateArr withTouchBlock:(TouchBlock)block;

@end
