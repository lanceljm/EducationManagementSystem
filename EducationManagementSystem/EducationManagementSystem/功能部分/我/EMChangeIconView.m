//
//  EMChangeIconView.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMChangeIconView.h"
#import "EMIconChangeInfo.h"

@interface EMChangeIconView ()

@property(nonatomic,strong)EMIconChangeInfo *changeIconImage;

@end

@implementation EMChangeIconView

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
    [self.view addSubview:self.changeIconImage];
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

-(EMIconChangeInfo *)changeIconImage {
    if (!_changeIconImage) {
        
        _changeIconImage = [[EMIconChangeInfo alloc]initWithFrame:AAdaptionRect(0, 96, kBaseWidth, 146) withImageName:@"" withBtnBlock:^(id sender) {
            //修改头像
            
        }];

    }
    return _changeIconImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
