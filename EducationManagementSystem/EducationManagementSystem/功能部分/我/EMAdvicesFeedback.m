//
//  EMAdvicesFeedback.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMAdvicesFeedback.h"
#import "EMFeedBackTV.h"
#import "EMSysButton.h"
#import <MBProgressHUD.h>

@interface EMAdvicesFeedback ()
    
    @property(nonatomic,strong)EMFeedBackTV* textContent;
    @property(nonatomic,strong)EMSysButton *submitBtn;

@end

@implementation EMAdvicesFeedback

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];

    self.view.backgroundColor = [UIColor cz_colorWithRed:238 green:239 blue:241];
}
    
    -(void)setupUI {
        [self setNavi];
        
        [self.view addSubview:self.textContent];
        [self.view addSubview:self.submitBtn];
    }
    
    -(void)setNavi {
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBtn.frame = CGRectMake(0, 0, 40/AAdaptionWidth(), 40/AAdaptionWidth());
        [leftBtn setTitle:@"" forState:UIControlStateNormal];
        [leftBtn setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -40/AAdaptionWidth(), 0, 0);
        [leftBtn addTarget:self action:@selector(dismissVC) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
        self.navigationItem.leftBarButtonItem = btn;
    }

-(void)dismissVC {
    [self.navigationController popViewControllerAnimated:YES];
}
    
    -(EMFeedBackTV *)textContent {
        if (!_textContent) {
            _textContent = [[EMFeedBackTV alloc]initWithFrame:AAdaptionRect(20, 64/AAdaptionWidth() + 30, 710, 400) withTextColor:[UIColor blackColor] withFontSize:20 withBgColor:[UIColor whiteColor] withCornerRadious:0.02];
         
        }
        return _textContent;
    }
    
    -(EMSysButton *)submitBtn {
        if (!_submitBtn) {
            _submitBtn = [[EMSysButton alloc]initWithFrame:AAdaptionRect(20, CGRectGetMaxY(self.textContent.frame)/AAdaptionWidth() + 100, 710, 90) withTag:100001 withTitle:@"提交" withTitleColor:[UIColor whiteColor] withBackgrougdColor:MainBgColor withCornerRadious:0.1 withClickedBlock:^(id sender) {
               //提交
                NSString *userType = @"";
                if ([USER_INFO[@"staffPositional"] isEqualToString:@"学生"]) {
                    userType = @"学生";
                }else {
                    userType = @"教职工";
                }
                
                if ([_textContent.textView.text isEqualToString:@""]) {
                    NSLog(@"提交内容不能为空");
                    
                    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                    hud.mode = MBProgressHUDModeAnnularDeterminate;
                    hud.label.text = @"提交内容不能为空";
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        hud.hidden = YES;
                    });
                    
                }else {
                    NSDictionary *parm = @{@"userName":USER_INFO[@"staffName"],@"userType":userType,@"adviceContent":_textContent.textView.text};
                    [NetRequest POST:feedbackUrl parameters:parm success:^(id responseObject) {
                            //提交成功
                            NSLog(@"提交成功");
                        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                        hud.mode = MBProgressHUDModeAnnularDeterminate;
                        hud.label.text = @"提交成功";
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            hud.hidden = YES;
                        });
                    } failture:^(NSError *error) {
                        //失败
                        NSLog(@"提交失败，网络错误");
                        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                        hud.mode = MBProgressHUDModeAnnularDeterminate;
                        hud.label.text = @"提交失败，网络错误";
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            hud.hidden = YES;
                        });
                    }];
                }
            }];
        }
        return _submitBtn;
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
