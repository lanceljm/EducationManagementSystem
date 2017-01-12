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
#import <MBProgressHUD.h> 

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
    }
    return _oldPD;
}

-(EMPasswordUnderLineTextF *)newPD {
    if (!_newPD) {
        _newPD = [[EMPasswordUnderLineTextF alloc]initWithFrame:AAdaptionRect(180, 62*2 + 100, kBaseWidth, 102) withTitle:@"新密码" withTitleColor:[UIColor blackColor] withTitleFontSize:20];
        _newPD.secureTextEntry = YES;

    }
    return _newPD;
}

-(EMPasswordUnderLineTextF *)surePD {
    if (!_surePD) {
        _surePD = [[EMPasswordUnderLineTextF alloc]initWithFrame:AAdaptionRect(180, 64*2 + 200, kBaseWidth, 102) withTitle:@"确认密码" withTitleColor:[UIColor blackColor] withTitleFontSize:20];
        _surePD.secureTextEntry = YES;

    }
    return _surePD;
}

-(EMSysButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [[EMSysButton alloc]initWithFrame:AAdaptionRect(20, 520, kBaseWidth - 40, 90) withTag:10001 withTitle:@"确认修改" withTitleColor:[UIColor whiteColor] withBackgrougdColor:MainBgColor withCornerRadious:0.1 withClickedBlock:^(id sender) {
            NSString *oldPDs = [[NSUserDefaults standardUserDefaults]objectForKey:@"savePassword"];
            if (![_oldPD.text isEqualToString:oldPDs]) {
                NSLog(@"旧密码错误");
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.mode = MBProgressHUDModeAnnularDeterminate;
                hud.label.text = @"旧密码错误";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    hud.hidden = YES;
                });
            }else if([_newPD.text isEqualToString:@""] ){
                NSLog(@"新密码不能为空");
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.mode = MBProgressHUDModeAnnularDeterminate;
                hud.label.text = @"新密码不能为空";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    hud.hidden = YES;
                });
            }else if ([_newPD.text isEqualToString:_oldPD.text]) {
                NSLog(@"新密码不能和旧密码相同");
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.mode = MBProgressHUDModeAnnularDeterminate;
                hud.label.text = @"新密码不能和旧密码相同";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    hud.hidden = YES;
                });
            }else if (![_surePD.text isEqualToString:_newPD.text]) {
                NSLog(@"两次输入的密码不相同");
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.mode = MBProgressHUDModeAnnularDeterminate;
                hud.label.text = @"两次输入的密码不相同";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    hud.hidden = YES;
                });
            }else {
                //上传数据
                NSString *urlStr = @"http://192.168.0.117/api/staff/changePassword.html";
                NSString *account = [[NSUserDefaults standardUserDefaults]objectForKey:@"saveAccount"];
                NSDictionary *userInfoDic = [[NSUserDefaults standardUserDefaults]objectForKey:@"UserInfo"];
                NSDictionary *parm = @{@"account":account,@"oldPassword":_oldPD.text,@"newPassword":_surePD.text,@"token":userInfoDic[@"token"]};
                [NetRequest POST:urlStr parameters:parm success:^(id responseObject) {
                    NSLog(@"修改成功%@",responseObject);
                    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                    hud.mode = MBProgressHUDModeAnnularDeterminate;
                    hud.label.text = @"修改失败";
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        hud.hidden = YES;
                        //修改成功后跳到登录界面
                        [[NSNotificationCenter defaultCenter]postNotificationName:@"setLoginVc" object:nil];
                    });
                } failture:^(NSError *error) {
                    
                    NSLog(@"修改失败");
                    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                    hud.mode = MBProgressHUDModeAnnularDeterminate;
                    hud.label.text = @"修改失败";
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        hud.hidden = YES;
                    });
                }];
            }
        }];
    }
    return _sureBtn;
}

@end
