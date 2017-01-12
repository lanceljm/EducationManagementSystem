//
//  EMTwoBtnView.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMTwoBtnView.h"
#import "EMIconDirectionButton.h"
@implementation EMTwoBtnView

- (instancetype)initWithLeftDirectionFrame:(CGRect)frame WithBKColor:(UIColor*)bgCol btnNames:(NSArray *)btnNames TitleCols:(UIColor*)TCol WithImages:(NSArray*)imgArr WithFont:(CGFloat)font WithSelectorBtnBlock:(void(^)(UIButton*))btn
{
    self = [super initWithFrame:AAdaptionRectFromFrame(frame)];
    if (self) {
        self.backgroundColor = bgCol;
        
        CGFloat btnW = self.frame.size.width / 5;
        CGFloat btnH = self.frame.size.height;
        
        for (int i = 0; i < 2; i++) {
            EMIconDirectionButton *leftBtn = [[EMIconDirectionButton alloc] initWithFrame:CGRectMake(btnW + btnW*i*2, 0,btnW, btnH) withTag:100 + i withTitle:btnNames[i] withTitleColor:TCol withImage:imgArr[i] withFont:font withDirection:left withBlock:^(id sender) {
                UIButton *btnS = sender;
                if (btnS.tag == 100) {
                    UIButton *b = (UIButton*)[self viewWithTag:101];
                    b.selected = NO;
                }else {
                    UIButton *b = (UIButton*)[self viewWithTag:100];
                    b.selected = NO;
                }
                [btnS setTitleColor:[UIColor cz_colorWithHex:0x2269d5] forState:UIControlStateSelected];
                
                btn(btnS);
            }];
            
            [self addSubview:leftBtn];
        }
        
        UIView *underLine = [[UIView alloc] initWithFrame:CGRectMake(0, btnH, btnW*5, 1)];
        underLine.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:underLine];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width/2, AAdaption(20), 1, AAdaption(80))];
        line.backgroundColor = underLine.backgroundColor;
        [self addSubview:line];
        
        
    }
    return self;
}

@end
