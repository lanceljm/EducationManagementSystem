//
//  EMDetailNotificationVC.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/14.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMDetailNotificationVC.h"

@interface EMDetailNotificationVC ()

@property(nonatomic,strong)UIView *notificationView;

@end

@implementation EMDetailNotificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
    
}

-(void)setupUI {
    [self setNavi];
    [self.view addSubview:self.notificationView];
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

-(UIView *)notificationView {
    if (!_notificationView) {
        _notificationView = [[UIView alloc]initWithFrame:AAdaptionRect(0, 64/AAdaptionWidth(), kwidth/AAdaptionWidth(), 600)];
    }
    return _notificationView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
