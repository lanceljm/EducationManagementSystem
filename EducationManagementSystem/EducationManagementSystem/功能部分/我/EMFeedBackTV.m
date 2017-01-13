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
        [self addSubview:self.placeholdLabel];
        
        self.textColor = textColor;
        self.font = [UIFont systemFontOfSize:fontSize];
        self.backgroundColor = bgColor;
        self.layer.cornerRadius = corner;
        self.layer.masksToBounds = YES;
        self.delegate = self;
    }
    return self;
}
    
    
    
    #pragma mark -- getter
    -(UILabel *)placeholdLabel {
        if (!_placeholdLabel) {
            _placeholdLabel = [[UILabel alloc]initWithFrame:AAdaptionRect(20, 30, 100 - 20 - 20, 40)];
            _placeholdLabel.text = @"您的建议是我们做的更好的动力!";
            _placeholdLabel.textColor = [UIColor blackColor];
            _placeholdLabel.font = [UIFont systemFontOfSize:25];
            _placeholdLabel.alpha = 0.6;
        }
        return _placeholdLabel;
    }
    
    //点击textView隐藏提示文字
    -(void)setEditable:(BOOL)editable {
        self.placeholdLabel.hidden = YES;
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
    -(void)textViewDidBeginEditing:(UITextView *)textView {
        
    }
    -(void)textViewDidEndEditing:(UITextView *)textView {
        
    }
    

@end
