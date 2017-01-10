//
//  EMLeaveDetailController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/10.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMLeaveDetailController.h"

@interface EMLeaveDetailController ()

@end

@implementation EMLeaveDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"批假";
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupUI {
    
    CGFloat Y = CGRectGetMaxY(self.navigationController.navigationBar.frame)/AAdaptionWidth();
    for (int i = 0; i < 2; i++) {
        UIView *line = [[UIView alloc] initWithFrame:AAdaptionRect(40, Y + 100 * (i+1), 710, 2)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:line];
    }
    
    NSArray *text = @[@"申请人",@"请假时间",@"结束时间"];
    for (int i = 0; i < 3; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:AAdaptionRect(40, Y +i*100, 710, 100)];
        label.font = AAFont(32);
        label.textColor = [UIColor cz_colorWithHex:0x4991ff];
        label.text = text[i];
        [self.view addSubview:label];
    }
    
    UILabel *detail = [[UILabel alloc] initWithFrame:AAdaptionRect(40, 464, 670, 384)];
    detail.numberOfLines = 0;
    detail.layer.cornerRadius = 5;
    detail.layer.borderWidth = 1;
    detail.layer.borderColor = [UIColor lightGrayColor].CGColor;
    detail.text = @"你说你是不是傻逼是死机死就死机即死机死机及司机基金四季is就";
    [self.view addSubview:detail];

}

@end
