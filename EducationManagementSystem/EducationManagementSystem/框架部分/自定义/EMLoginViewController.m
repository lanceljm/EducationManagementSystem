//
//  EMLoginViewController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/6.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMLoginViewController.h"
#import "EMIconUnderLineTextF.h"
#import "EMSysButton.h"
#import "EMIconDirectionButton.h"
#import <MBProgressHUD.h>

@interface EMLoginViewController ()

@property(nonatomic,strong)UIImageView *bgImageView;//背景
@property(nonatomic,strong)UIImageView *logoImageView;//logon
@property(nonatomic,strong)EMIconUnderLineTextF *accountTF;//账号
@property(nonatomic,strong)EMIconUnderLineTextF *passwordTF;//密码
@property(nonatomic,strong)EMSysButton *loginBtn;//登录
@property(nonatomic,strong)EMIconDirectionButton *forgetBtn;//忘记密码

@end

@implementation EMLoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tips.text = @"登录见面，点击消失";
//    self.view.backgroundColor = [UIColor whiteColor];

    /*
     *  注释部分为测试代码 可删除
     *
    EMIconUnderLineTextF *count = [[EMIconUnderLineTextF alloc] initWithFrame:AAdaptionRect(120, 120, 300, 44) andImageName:@"User" withPlaceholder:@"请输入账号"];
    [self.view addSubview:count];
    */
    
    
    [self setupUI];
    
}

-(void)setupUI{
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.logoImageView];
    [self.view addSubview:self.accountTF];
    [self.view addSubview:self.passwordTF];
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.forgetBtn];
    
    [self setTipLabel];
}

-(void)setTipLabel {
    UILabel *tip = [[UILabel alloc]initWithFrame:AAdaptionRect(CGRectGetMinX(self.loginBtn.frame)/AAdaptionWidth(), kheight/AAdaptionWidth() - 120, CGRectGetWidth(self.loginBtn.frame)/AAdaptionWidth(), 45)];
    tip.text = @"五芯教育科技和绵阳师范信息学院共同开发";
    tip.textColor = [UIColor cz_colorWithRed:0 green:0 blue:0];
    tip.textAlignment = NSTextAlignmentCenter;
    tip.font = AAFont(28);
    [self.view addSubview:tip];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self hideKeyboard];
}

//隐藏键盘
-(void)hideKeyboard{
    [self.accountTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
}

//背景
-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]initWithFrame:self.view.frame];
        [_bgImageView setImage:[UIImage imageNamed:@"bg"]];
    }
    return _bgImageView;
}

//logo
-(UIImageView *)logoImageView{
    if (!_logoImageView) {
        _logoImageView = [[UIImageView alloc]initWithFrame:AAdaptionRect(232, 120, 280, 310)];
        [_logoImageView setImage:[UIImage imageNamed:@"logo"]];
    }
    return _logoImageView;
}

//账号
-(EMIconUnderLineTextF *)accountTF{
    if (!_accountTF) {
        _accountTF = [[EMIconUnderLineTextF alloc]initWithFrame:AAdaptionRect(188, 540, 454, 60) andImageName:@"User" withPlaceholder:@"请输入工号"];
        NSString *isLogin = [[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"];
        if (isLogin) {
            _accountTF.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"saveAccount"];
        }
    }
    return _accountTF;
}

//密码
-(EMIconUnderLineTextF *)passwordTF{
    if (!_passwordTF) {
        _passwordTF = [[EMIconUnderLineTextF alloc]initWithFrame:AAdaptionRect(188, 664, 454, 60) andImageName:@"Locked" withPlaceholder:@"请输入密码"];
        NSString *isLogin = [[NSUserDefaults standardUserDefaults]objectForKey:@"isLogin"];
        if (isLogin) {
            _passwordTF.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"savePassword"];
        }
        _passwordTF.secureTextEntry = YES;
    }
    return _passwordTF;
}

//登录
-(EMSysButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[EMSysButton alloc]initWithFrame:AAdaptionRect(90, 810, 576, 80) withTag:1002 withTitle:@"登录" withTitleColor:[UIColor whiteColor] withBackgrougdColor:MainBgColor withCornerRadious:0.1 withClickedBlock:^(id sender) {
            //
            if ([_accountTF.text  isEqualToString: @""]) {
                NSLog(@"账号不能为空");
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.mode = MBProgressHUDModeAnnularDeterminate;
                hud.label.text = @"账号不能为空";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    hud.hidden = YES;
                });
            }else if ([_passwordTF.text isEqualToString:@""]) {
                NSLog(@"密码不能为空");
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.mode = MBProgressHUDModeAnnularDeterminate;
                hud.label.text = @"密码不能为空";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    hud.hidden = YES;
                });
            }else{
            //网络请求
            NSDictionary *parm = @{@"account":_accountTF.text,@"password":_passwordTF.text};
                NSLog(@"parm:%@",parm);
            [NetRequest POST:getLoginUrl parameters:parm success:^(id responseObject) {
                NSDictionary *userInfo = responseObject[@"result"];
                NSLog(@"用户信息：%@",userInfo);
                //保存用户登录字典
                [[NSUserDefaults standardUserDefaults]setValue:userInfo forKey:UserInfoKey];
                
                //保存登录状态
                [[NSUserDefaults standardUserDefaults]setBool:true forKey:@"isLogin"];
                
                if ([responseObject[@"message"] isEqualToString:@"Success"]) {
                    [self.view removeFromSuperview];
                    [self removeFromParentViewController];
                    NSLog(@"登录成功");
//                    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//                    hud.mode = MBProgressHUDModeAnnularDeterminate;
//                    hud.label.text = @"登录成功";
//                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                        hud.hidden = YES;
//                    });
                    
                    //保存账号
                    [[NSUserDefaults standardUserDefaults]setValue:_accountTF.text forKey:@"saveAccount"];
                    //保存密码
                    [[NSUserDefaults standardUserDefaults]setValue:_passwordTF.text forKey:@"savePassword"];
                    
                    [[NSNotificationCenter defaultCenter]postNotificationName:@"networking" object:nil];
                    
                }else {
                    NSLog(@"账号或密码错误");
                    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                    hud.mode = MBProgressHUDModeAnnularDeterminate;
                    hud.label.text = @"账号或密码错误";
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        hud.hidden = YES;
                    });
                }
            } failture:^(NSError *error) {
                NSLog(@"error:%@,登录失败",error);
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.mode = MBProgressHUDModeAnnularDeterminate;
                hud.label.text = @"登录失败，网络错误";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    hud.hidden = YES;
                });
            }];
            }
        }];
    }
    return _loginBtn;
}

//忘记密码
-(EMIconDirectionButton *)forgetBtn{
    if (!_forgetBtn) {
        _forgetBtn = [[EMIconDirectionButton alloc]initWithFrame:AAdaptionRect(296, 926, 160, 40) withTag:1003 withTitle:@"忘记密码" withTitleColor:MainThemeColor withImage:@"ic" withFont:28 withDirection:right withBlock:^(id sender) {
            //
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请联系管理员重置密码" preferredStyle:UIAlertControllerStyleAlert];
            [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //
            }]];
            [self presentViewController:alertVC animated:YES completion:nil];
            
        }];
    }
    return _forgetBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
