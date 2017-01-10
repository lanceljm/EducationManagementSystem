//
//  EMAboutMeViewController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/6.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMAboutMeViewController.h"
#import "EMMineAboutBtn.h"
#import "EMSysButton.h"

@interface EMAboutMeViewController ()

@property(nonatomic,strong)UIImageView *bgUpImageView;
@property(nonatomic,strong)UIImageView *iconImageView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *postionLabel;
@property(nonatomic,strong)EMMineAboutBtn *changePassword;
@property(nonatomic,strong)EMMineAboutBtn *aboutUs;
@property(nonatomic,strong)EMMineAboutBtn *adviceFeedback;//意见反馈
@property(nonatomic,strong)EMSysButton *logoutBtn;

@end

@implementation EMAboutMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self  setupUI];
    
}

-(void)setupUI {
    [self.view addSubview:self.bgUpImageView];
    [self.view addSubview:self.iconImageView];
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.postionLabel];
    [self.view addSubview:self.changePassword];
    [self.view addSubview:self.aboutUs];
    [self.view addSubview:self.adviceFeedback];
    [self.view addSubview:self.logoutBtn];
}

-(UIImageView *)bgUpImageView {
    if (!_bgUpImageView) {
        _bgUpImageView = [[UIImageView alloc]initWithFrame:AAdaptionRect(0, 58*2, kBaseWidth, 380)];
        [_bgUpImageView setImage:[UIImage imageNamed:@"想象森林"]];
    }
    return _bgUpImageView;
}

//头像
-(UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]initWithFrame:AAdaptionRect(290, 174, 170, 170)];
        [_iconImageView setImage:[UIImage imageNamed:@"默认头像男"]];
        _iconImageView.layer.cornerRadius = self.iconImageView.frame.size.width/2;
        _iconImageView.layer.masksToBounds = YES;
    }
    return _iconImageView;
}

//修改密码
-(EMMineAboutBtn *)changePassword {
    if (!_changePassword) {
        _changePassword = [[EMMineAboutBtn alloc]initWithFrame:AAdaptionRect(0, 500, kBaseWidth, 100) withTag:1004 withLeftImageName:@"Locked" withTextLabel:@"修改密码" withTextColor:[UIColor cz_colorWithHex:0x4f4f4f] withTextFontSize:18 withRightName:@"向右箭头" withClickedBlock:^(id sender) {
            
        }];
    }
    return _changePassword;
}

//关于我们
-(EMMineAboutBtn *)aboutUs {
    if (!_aboutUs) {
        _aboutUs = [[EMMineAboutBtn alloc]initWithFrame:AAdaptionRect(0, 600, kBaseWidth, 100) withTag:1005 withLeftImageName:@"about" withTextLabel:@"关于我们" withTextColor:[UIColor cz_colorWithHex:0x4f4f4f] withTextFontSize:18 withRightName:@"向右箭头" withClickedBlock:^(id sender) {
            
        }];
    }
    return _aboutUs;
}

//意见反馈
-(EMMineAboutBtn *)adviceFeedback {
    if (!_adviceFeedback) {
        _adviceFeedback = [[EMMineAboutBtn alloc]initWithFrame:AAdaptionRect(0, 700, kBaseWidth, 100) withTag:1006 withLeftImageName:@"feedBack" withTextLabel:@"意见反馈" withTextColor:[UIColor cz_colorWithHex:0x4f4f4f] withTextFontSize:18 withRightName:@"向右箭头" withClickedBlock:^(id sender) {
            
        }];
    }
    return _adviceFeedback;
}

//退出登录
-(EMSysButton *)logoutBtn {
    if (!_logoutBtn) {
        _logoutBtn = [[EMSysButton alloc]initWithFrame:AAdaptionRect(40, 990, 672, 90) withTag:1004 withTitle:@"退出登录" withTitleColor:[UIColor whiteColor] withBackgrougdColor:MainBgColor withCornerRadious:0.1 withClickedBlock:^(id sender) {
           //
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"退出登录" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //确定退出
                //发送通知
                [[NSNotificationCenter defaultCenter]postNotificationName:@"setLoginVc" object:nil];
                
            }]];
            [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                //取消
            }]];
            
            [self presentViewController:alertVC animated:YES completion:nil];
            
        }];
    }
    return _logoutBtn;
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
