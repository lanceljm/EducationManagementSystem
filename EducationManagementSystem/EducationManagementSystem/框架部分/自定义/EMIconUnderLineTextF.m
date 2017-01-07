//
//  EMIconUnderLineTextF.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/7.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMIconUnderLineTextF.h"

@interface EMIconUnderLineTextF()<UITextFieldDelegate> {
    
}

@end


@implementation EMIconUnderLineTextF

- (instancetype)initWithFrame:(CGRect)frame andImageName:(NSString *)imageName withPlaceholder:(NSString *)placeholder
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:AAdaptionRect(-(26+62), 0, 62, 62)];
        imageView.image = [UIImage imageNamed:imageName];
        [self addSubview:imageView];
        
        UIView *underLineView = [[UIView alloc] initWithFrame:AAdaptionRect(0, CGRectGetMaxY(imageView.frame)/AAdaptionWidth() - 2, self.frame.size.width/AAdaptionWidth(), 2)];
        underLineView.backgroundColor = TextF_UNDERLINE;
        [self addSubview:underLineView];
        self.placeholder = placeholder;
        self.delegate = self;
        
    }
    return self;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}        // return NO to disallow editing.
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}           // became first responder
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason NS_AVAILABLE_IOS(10_0){
    
} // if implemented, called in place of textFieldDidEndEditing:

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return YES;
}   // return NO to not change text

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}               // called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self resignFirstResponder];
    return YES;
}              // called when 'return' key pressed. return NO to ignore.



@end
