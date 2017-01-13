//
//  EMChangeAboutUs.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMChangeAboutUs.h"

@interface EMChangeAboutUs ()
    
    @property(nonatomic,strong)UILabel *aboutUsContents;

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
    
-(UILabel *)aboutUsContents {
    if (!_aboutUsContents) {
        _aboutUsContents = [[UILabel alloc]initWithFrame:AAdaptionRect(0, 64*2, kBaseWidth, kBaseHeight - 64*2)];
        [NetRequest GET:AboutUsUrl parameters:nil success:^(id responseObject) {
            NSString *contents = responseObject[@"aboutusContent"];
            if ([contents isEqualToString:@""]) {
                _aboutUsContents.text = @"这里是关于我们…………";
            }else {
                _aboutUsContents.text = responseObject[@"aboutusContent"];
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
