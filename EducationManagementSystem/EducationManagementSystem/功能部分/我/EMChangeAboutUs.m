//
//  EMChangeAboutUs.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMChangeAboutUs.h"

@interface EMChangeAboutUs ()<UITextViewDelegate>
    
    @property(nonatomic,strong)UITextView *aboutUsContents;

@end

@implementation EMChangeAboutUs

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    self.view.backgroundColor = [UIColor cz_colorWithRed:238 green:239 blue:241];
}
    
    -(void)setupUI {
        [self setNavi];
        [self.view addSubview:self.aboutUsContents];
        
    }

-(void)setNavi {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 40, 40);
    [leftBtn setTitle:@"" forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);
    [leftBtn addTarget:self action:@selector(dismissVC) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = btn;
}
    
-(void)dismissVC {
    [self.navigationController popViewControllerAnimated:YES];
}
    
-(UITextView *)aboutUsContents {
    if (!_aboutUsContents) {
        _aboutUsContents = [[UITextView alloc]initWithFrame:AAdaptionRect(0, 0, kBaseWidth, kBaseHeight)];
        _aboutUsContents.textColor = [UIColor blackColor];
//        _aboutUsContents.textAlignment = NSTextAlignmentLeft;
        _aboutUsContents.font = AAFont(32);
        [NetRequest GET:AboutUsUrl parameters:nil success:^(id responseObject) {
            NSString *contents = responseObject[@"result"][@"aboutusContent"];
            if (contents == nil) {
                _aboutUsContents.text = @"  这里是关于我们…………";
            }else {
                NSString *contentStr = [contents substringFromIndex:3];
                NSString *newStr = [contentStr substringToIndex:22];
                _aboutUsContents.text = [NSString stringWithFormat:@"   %@",newStr];
            }
        } failture:^(NSError *error) {
            NSLog(@"网络错误");
        }];
    }
    return _aboutUsContents;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
