//
//  EMPasswordUnderLineTextF.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMPasswordUnderLineTextF.h"

@interface EMPasswordUnderLineTextF()<UITextFieldDelegate>{
    
}

@end

@implementation EMPasswordUnderLineTextF

-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title withTitleColor:(UIColor *)titleColor withTitleFontSize:(CGFloat)titleFontSize {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor cz_colorWithRed:255 green:255 blue:255];
        
        UILabel *label = [[UILabel alloc]initWithFrame:AAdaptionRect(-180, 0, 180, 100)];
        label.backgroundColor = [UIColor cz_colorWithRed:255 green:255 blue:255];
        label.text = title;
        label.textColor = titleColor;
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont systemFontOfSize:titleFontSize];
        [self addSubview:label];
        
        UILabel *lineLabel = [[UILabel alloc]initWithFrame:AAdaptionRect(0, 100, kBaseWidth, 2)];
        lineLabel.backgroundColor = [UIColor cz_colorWithHex:0xf4f4f4];
        [self addSubview:lineLabel];
        
       
    }
    return self;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField {
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason NS_AVAILABLE_IOS(1.0){
    
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return YES;
}
-(BOOL)textFieldShouldClear:(UITextField *)textField {
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self resignFirstResponder];
    return YES;
}


@end
