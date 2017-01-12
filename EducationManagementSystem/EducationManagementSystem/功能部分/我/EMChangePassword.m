//
//  EMChangePassword.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMChangePassword.h"
#import "EMPasswordUnderLineTextF.h"
#import "EMSysButton.h"
#import "NetRequest.h"

@interface EMChangePassword ()

@property(nonatomic,strong)EMSysButton *sureBtn;
@property(nonatomic,strong)EMPasswordUnderLineTextF *oldPD;
@property(nonatomic,strong)EMPasswordUnderLineTextF *newPD;
@property(nonatomic,strong)EMPasswordUnderLineTextF *surePD;


@end

@implementation EMChangePassword

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
    
    self.view.backgroundColor = [UIColor cz_colorWithRed:238 green:239 blue:241];
    [self setupNavi];

    [self.view addSubview:self.oldPD];
    [self.view addSubview:self.newPD];
    [self.view addSubview:self.surePD];
    
    [self.view addSubview:self.sureBtn];
    
}

-(void)setupNavi {
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

-(EMPasswordUnderLineTextF *)oldPD {
    if (!_oldPD) {
        _oldPD = [[EMPasswordUnderLineTextF alloc]initWithFrame:AAdaptionRect(180, 60*2, kBaseWidth, 102) withTitle:@"旧密码" withTitleColor:[UIColor blackColor] withTitleFontSize:20];
        _oldPD.secureTextEntry = YES;
        NSDictionary *userInfoDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserInfo"];
        NSLog(@"用户信息%@",userInfoDic);
        _oldPD.text = userInfoDic[@"staffPassword"];
        //判断你输入的密码是否正确
        if (![_oldPD.text isEqualToString:userInfoDic[@"staffPassword"]]) {
            NSLog(@"请输入正确的密码");
        }
    }
    return _oldPD;
}

-(EMPasswordUnderLineTextF *)newPD {
    if (!_newPD) {
        _newPD = [[EMPasswordUnderLineTextF alloc]initWithFrame:AAdaptionRect(180, 62*2 + 100, kBaseWidth, 102) withTitle:@"新密码" withTitleColor:[UIColor blackColor] withTitleFontSize:20];
        _newPD.secureTextEntry = YES;
        if ([_newPD.text isEqualToString:_oldPD.text]) {
            NSLog(@"新密码不能和旧密码相同");
        }
    }
    return _newPD;
}

-(EMPasswordUnderLineTextF *)surePD {
    if (!_surePD) {
        _surePD = [[EMPasswordUnderLineTextF alloc]initWithFrame:AAdaptionRect(180, 64*2 + 200, kBaseWidth, 102) withTitle:@"确认密码" withTitleColor:[UIColor blackColor] withTitleFontSize:20];
        _surePD.secureTextEntry = YES;
        if (![_surePD.text isEqualToString:_newPD.text]) {
            NSLog(@"请输入相同的密码");
        }
    }
    return _surePD;
}

-(EMSysButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [[EMSysButton alloc]initWithFrame:AAdaptionRect(20, 520, kBaseWidth - 40, 90) withTag:10001 withTitle:@"确认修改" withTitleColor:[UIColor whiteColor] withBackgrougdColor:MainBgColor withCornerRadious:0.1 withClickedBlock:^(id sender) {
           //上传数据
            if ((![_newPD.text isEqualToString:_oldPD.text])&&[_surePD.text isEqualToString:_newPD.text]) {
                //可以修改
                NSString *urlStr = @"http://192.168.0.117/api/staff/changePassword.html";
                NSDictionary *userInfoDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserInfo"];
                NSDictionary *parm = @{@"account":userInfoDic[@"staffAccount"],@"oldPassword":_oldPD.text,@"newPassword":_surePD.text,@"token":userInfoDic[@"token"]};
                
                [NetRequest POST:urlStr parameters:parm success:^(id responseObject) {
                    //成功
                    NSLog(@"密码修改成功");
                } failture:^(NSError *error) {
                    //失败
                    NSLog(@"密码修改失败");
                }];
            }
        }];
    }
    return _sureBtn;
}

@end
