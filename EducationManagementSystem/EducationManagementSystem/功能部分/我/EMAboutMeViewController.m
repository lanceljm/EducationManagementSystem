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
#import "EMUserinfoLabel.h"
#import "EMIconViewBtn.h"
#import <UIImageView+AFNetworking.h>

#import "EMChangeIconView.h"
#import "EMChangePassword.h"
#import "EMChangeAboutUs.h"
#import "EMAdvicesFeedback.h"

@interface EMAboutMeViewController ()

@property(nonatomic,strong)UIImageView *bgUpImageView;
@property(nonatomic,strong)EMIconViewBtn *iconImageBtn;
@property(nonatomic,strong)EMUserinfoLabel *nameLabel;
@property(nonatomic,strong)EMUserinfoLabel *postionLabel;
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
    
    self.view.backgroundColor = [UIColor cz_colorWithRed:238 green:239 blue:241];
    
}

-(void)setupUI {
    [self.view addSubview:self.bgUpImageView];
    [self.view addSubview:self.iconImageBtn];
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
-(EMIconViewBtn *)iconImageBtn {
    if (!_iconImageBtn) {
        _iconImageBtn = [[EMIconViewBtn alloc]initWithFrame:AAdaptionRect(kwidth/AAdaptionWidth()/2 - 170/2 ,64/AAdaptionWidth() + 20, 170, 170) withTag:1010 withClickBlock:^(id sender) {
            EMChangeIconView *iconVC = [[EMChangeIconView alloc]init];
            iconVC.title = @"个人信息";
            [self.navigationController pushViewController:iconVC animated:YES];
        }];
        
//        NSDictionary *staffDic = [[NSUserDefaults standardUserDefaults] objectForKey:UserInfoKey];
        if ([USER_INFO[@"staffPicture"] isEqualToString:@""]) {
            if ([USER_INFO[@"staffSex"] isEqualToString:@"男"]) {
                [_iconImageBtn setImage:[UIImage imageNamed:@"默认头像男"] forState:UIControlStateNormal];
            }else {
                [_iconImageBtn setImage:[UIImage imageNamed:@"默认头像女"] forState:UIControlStateNormal];
            }
        }else {
            NSString *pictureUrl = [NSString stringWithFormat:@"%@%@",BASE_URL,USER_INFO[@"staffPicture"]];
            NSURL *picUrl = [NSURL URLWithString:pictureUrl];
            UIImageView *iconImage = [[UIImageView alloc]initWithFrame:AAdaptionRect(0, 0, 170, 170)];
            iconImage.layer.cornerRadius = self.iconImageBtn.frame.size.width/2;
            iconImage.layer.masksToBounds = YES;
            [iconImage setImageWithURL:picUrl];
            
            [_iconImageBtn addSubview:iconImage];
        }
    }
    return _iconImageBtn;
}


//姓名
-(EMUserinfoLabel *)nameLabel {
    if (!_nameLabel) {
//        NSString *text = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserInfo"][@"staffName"];

        _nameLabel = [[EMUserinfoLabel alloc]initWithFrame:AAdaptionRect(CGRectGetMinX(self.iconImageBtn.frame)/AAdaptionWidth(), CGRectGetMaxY(self.iconImageBtn.frame)/AAdaptionWidth() + 20, CGRectGetWidth(self.iconImageBtn.frame)/AAdaptionWidth(), 40) withText:USER_INFO[@"staffName"] withTextColor:[UIColor blackColor] withTextCenter:NSTextAlignmentCenter withTextFontSize:36];
    }
    return _nameLabel;
}

//职位
-(EMUserinfoLabel *)postionLabel {
    if (!_postionLabel) {
//        NSString *text = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserInfo"][@"staffPost"];
        _postionLabel = [[EMUserinfoLabel alloc]initWithFrame:AAdaptionRect(CGRectGetMinX(self.nameLabel.frame)/AAdaptionWidth(), CGRectGetMaxY(self.nameLabel.frame)/AAdaptionWidth() + 20, CGRectGetWidth(self.nameLabel.frame)/AAdaptionWidth(), 40) withText:USER_INFO[@"staffPost"] withTextColor:[UIColor blackColor] withTextCenter:NSTextAlignmentCenter withTextFontSize:28];
    }
    return _postionLabel;
}

//修改密码
-(EMMineAboutBtn *)changePassword {
    if (!_changePassword) {
        _changePassword = [[EMMineAboutBtn alloc]initWithFrame:AAdaptionRect(0, CGRectGetMaxY(self.bgUpImageView.frame)/AAdaptionWidth(), kBaseWidth, 100) withTag:1011 withLeftImageName:@"Locked" withTextLabel:@"修改密码" withTextColor:[UIColor cz_colorWithHex:0x4f4f4f] withTextFontSize:32 withRightName:@"向右箭头" withClickedBlock:^(id sender) {
            EMChangePassword *chpVC = [[EMChangePassword alloc]init];
            chpVC.title = @"修改密码";
            [self.navigationController pushViewController:chpVC animated:YES];
        }];
    }
    return _changePassword;
}

//关于我们
-(EMMineAboutBtn *)aboutUs {
    if (!_aboutUs) {
        _aboutUs = [[EMMineAboutBtn alloc]initWithFrame:AAdaptionRect(0, CGRectGetMaxY(self.changePassword.frame)/AAdaptionWidth(), kBaseWidth, 100) withTag:1012 withLeftImageName:@"about" withTextLabel:@"关于我们" withTextColor:[UIColor cz_colorWithHex:0x4f4f4f] withTextFontSize:32 withRightName:@"向右箭头" withClickedBlock:^(id sender) {
            EMChangeAboutUs *chaVC = [[EMChangeAboutUs alloc]init];
            chaVC.title = @"关于我们";
            [self.navigationController pushViewController:chaVC animated:YES];
        }];
    }
    return _aboutUs;
}

//意见反馈
-(EMMineAboutBtn *)adviceFeedback {
    if (!_adviceFeedback) {
        _adviceFeedback = [[EMMineAboutBtn alloc]initWithFrame:AAdaptionRect(0, CGRectGetMaxY(self.aboutUs.frame)/AAdaptionWidth(), kBaseWidth, 100) withTag:1013 withLeftImageName:@"feedBack" withTextLabel:@"意见反馈" withTextColor:[UIColor cz_colorWithHex:0x4f4f4f] withTextFontSize:32 withRightName:@"向右箭头" withClickedBlock:^(id sender) {
            EMAdvicesFeedback *adfeedVC = [[EMAdvicesFeedback alloc]init];
            adfeedVC.title = @"意见反馈";
            [self.navigationController pushViewController:adfeedVC animated:YES];
        }];
    }
    return _adviceFeedback;
}

//退出登录
-(EMSysButton *)logoutBtn {
    if (!_logoutBtn) {
        _logoutBtn = [[EMSysButton alloc]initWithFrame:AAdaptionRect(40, 990, 672, 90) withTag:1014 withTitle:@"退出登录" withTitleColor:[UIColor whiteColor] withBackgrougdColor:MainBgColor withCornerRadious:0.1 withClickedBlock:^(id sender) {
           //
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"退出登录" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //确定退出
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

@end
