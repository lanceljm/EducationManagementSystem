//
//  EMFeedBackTV.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/12.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMFeedBackTV.h"

@interface EMFeedBackTV()<UITextViewDelegate>{
    
}
@property(nonatomic,strong)UILabel *placeholdLabel;
@end

@implementation EMFeedBackTV

-(instancetype)initWithFrame:(CGRect)frame withTextColor:(UIColor *)textColor withFontSize:(CGFloat)fontSize withBgColor:(UIColor *)bgColor withCornerRadious:(CGFloat)corner {
    self = [super initWithFrame:frame];

    if (self) {
        
        self.backgroundColor = bgColor;
        self.layer.cornerRadius = self.frame.size.height*corner;;
        self.layer.masksToBounds = YES;
        
        self.textView = [[UITextView alloc] initWithFrame:AAdaptionRect(20, 20, frame.size.width/AAdaptionWidth() - 40, frame.size.height/AAdaptionWidth() - 60)];
        self.textView.textColor = textColor;
        self.textView.font = AAFont(32);
        self.textView.delegate = self;
    
        [self addSubview:self.textView];
        
        self.placeholdLabel = [[UILabel alloc]initWithFrame:AAdaptionRect(20 , 30, self.frame.size.width / AAdaptionWidth() - 40 , 40)];
        self.placeholdLabel.text = @"您的建议是我们做的更好的动力!";
        self.placeholdLabel.textColor = [UIColor blackColor];
        self.placeholdLabel.textAlignment = NSTextAlignmentLeft;
        self.placeholdLabel.font = AAFont(32);
        self.placeholdLabel.alpha = 0.6;

        [self addSubview:self.placeholdLabel];
        
        
        
    }
    return self;
}
    

    -(void)setEditable:(BOOL)editable {
        
    }
    -(BOOL)allowsEditingTextAttributes {
        return YES;
    }
    -(BOOL)textViewShouldBeginEditing:(UITextView *)textView {
        
        return YES;
    }
    -(BOOL)textViewShouldEndEditing:(UITextView *)textView {
        return YES;
    }
    -(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
        return YES;
    }
    -(void)textViewDidChange:(UITextView *)textView {
        
    }
//开始编辑
    -(void)textViewDidBeginEditing:(UITextView *)textView {
        self.placeholdLabel.hidden = YES;
    }
    -(void)textViewDidEndEditing:(UITextView *)textView {
        
    }


@end
