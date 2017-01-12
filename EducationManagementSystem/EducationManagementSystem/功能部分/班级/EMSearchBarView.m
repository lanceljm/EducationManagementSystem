//
//  EMSearchBarView.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/9.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMSearchBarView.h"

@interface EMSearchBarView ()<UITextFieldDelegate>

@property(nonatomic,strong) UITextField *textF;

@end

@implementation EMSearchBarView

- (instancetype)initWithFrame:(CGRect)frame WithTextChangeBlock:(textChangeBlock)block
{
    self = [super initWithFrame:AAdaptionRectFromFrame(frame)];
    if (self) {
        
        self.textBlock = block;
        self.backgroundColor = [UIColor cz_colorWithHex:0xedeff1];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:AAdaptionRect(20, 20, 710,75)];
        btn.layer.cornerRadius = AAdaption(frame.size.height/2 - 20);
        btn.backgroundColor = [UIColor whiteColor];
        btn.layer.borderColor = [UIColor cz_colorWithHex:0xb9b9b9].CGColor;
        btn.layer.borderWidth = 1;
        [self addSubview:btn];
        
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:AAdaptionRect(30,30,60,60)];
//        imageView.backgroundColor = [UIColor redColor];
        imageView.image = [UIImage imageNamed:@"search"];
        [self addSubview:imageView];
        
        _textF = [[UITextField alloc] initWithFrame:AAdaptionRect(95, 22, 710, 71)];
        _textF.borderStyle = UITextBorderStyleNone;
        _textF.backgroundColor = [UIColor clearColor];
        _textF.delegate = self;
        _textF.clearButtonMode = UITextBorderStyleNone;
        [self addSubview:_textF];
        
    }
    return self;
}

#pragma mark - textF 代理
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (self.textBlock) {
        NSString *str = [NSString stringWithFormat:@"%@%@",_textF.text,string];
        self.textBlock(str);
    }
    
    return YES;
}


@end
