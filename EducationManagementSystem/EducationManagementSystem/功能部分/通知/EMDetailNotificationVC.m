//
//  EMDetailNotificationVC.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/14.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMDetailNotificationVC.h"
#import "EMAlertViewController.h"
#import <UIWebView+BFKit.h>

@interface EMDetailNotificationVC ()

@property(nonatomic,strong)UIWebView *notificationView;

@end

@implementation EMDetailNotificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
    
}

-(void)setupUI {
    [self setNavi];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.notificationView];
    

}



-(void)setNavi {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 40/AAdaptionWidth(), 40/AAdaptionWidth());
//    [leftBtn setTitle:@"" forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -40/AAdaptionWidth(), 0, 0);
    [leftBtn addTarget:self action:@selector(dismissVC) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnL = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = btnL;
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 40/AAdaptionWidth(), 40/AAdaptionWidth());
    [rightBtn setImage:[UIImage imageNamed:@"闹钟"] forState:UIControlStateNormal];
    rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20/AAdaptionWidth());
    [rightBtn addTarget:self action:@selector(sendMessage) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnR = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = btnR;
}

-(void)dismissVC {
    [self.navigationController popViewControllerAnimated:YES];
}

//发送通知
-(void)sendMessage {
    EMAlertViewController *alertVC = [[EMAlertViewController alloc]init];
    alertVC.title = @"闹钟提醒";
    
    alertVC.titleStr = self.titleString;
    alertVC.timeStr = self.timeString;

    alertVC.model = self.model;
    
    [self.navigationController pushViewController:alertVC animated:YES];
}

-(UIWebView *)notificationView {
    if (!_notificationView) {
        _notificationView = [[UIWebView alloc]initWithFrame:self.view.bounds];
        NSString *webContents = self.contents;
        [_notificationView loadHTMLString:webContents baseURL:nil];
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
