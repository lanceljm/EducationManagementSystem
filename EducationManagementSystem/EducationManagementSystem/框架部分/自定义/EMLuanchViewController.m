//
//  EMLuanchViewController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/6.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMLuanchViewController.h"
#import "EMSysButton.h"

@interface EMLuanchViewController ()

@property(nonatomic,strong)EMSysButton *inputBtn;

@end

@implementation EMLuanchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tips.text = @"加载页面,点击消失";
    
    UIImageView *launchView = [[UIImageView alloc]initWithFrame:self.view.frame];
    [launchView setImage:[UIImage imageNamed:@"launch"]];
    [self.view addSubview:launchView];
    
    [self.view addSubview:self.inputBtn];

}

-(EMSysButton *)inputBtn {
    __weak typeof(self) weakself = self;
    if (!_inputBtn) {
        _inputBtn = [[EMSysButton alloc]initWithFrame:AAdaptionRect(200, 1050, 365, 80) withTag:1001 withTitle:@"" withTitleColor:[UIColor clearColor] withBackgrougdColor:[UIColor clearColor] withCornerRadious:0.5 withClickedBlock:^(id sender) {
            //按钮的点击事件
            [weakself.view removeFromSuperview];
            [weakself removeFromParentViewController];
        }];
    }
    return _inputBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
