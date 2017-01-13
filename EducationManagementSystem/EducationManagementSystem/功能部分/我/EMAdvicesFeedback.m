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

@interface EMAdvicesFeedback ()
    
    @property(nonatomic,strong)EMFeedBackTV* textContent;
    @property(nonatomic,strong)EMSysButton *submitBtn;

@end

@implementation EMAdvicesFeedback

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
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor brownColor];

    [self setupUI];
}
    
    -(void)setupUI {
        [self setNavi];
        
        [self.view addSubview:self.textContent];
        [self.view addSubview:self.submitBtn];
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
    
    -(EMFeedBackTV *)textContent {
        if (!_textContent) {
            _textContent = [[EMFeedBackTV alloc]initWithFrame:AAdaptionRect(20, 64*2 + 30, 710, 400) withTextColor:[UIColor blackColor] withFontSize:20 withBgColor:[UIColor whiteColor] withCornerRadious:0.1];
            
        }
        return _textContent;
    }
    
    -(EMSysButton *)submitBtn {
        if (!_submitBtn) {
            _submitBtn = [[EMSysButton alloc]initWithFrame:AAdaptionRect(20, CGRectGetMaxY(self.textContent.frame) + 100, 710, 90) withTag:100001 withTitle:@"提交" withTitleColor:[UIColor whiteColor] withBackgrougdColor:MainBgColor withCornerRadious:0.1 withClickedBlock:^(id sender) {
               //提交
                NSString *userType = @"";
                if ([USER_INFO[@"staffPositional"] isEqualToString:@"学生"]) {
                    userType = @"学生";
                }else {
                    userType = @"教职工";
                }
                NSDictionary *parm = @{@"userName":USER_INFO[@"staffName"],@"userType":userType,@"adviceContent":_textContent.text};
                [NetRequest POST:feedbackUrl parameters:parm success:^(id responseObject) {
                    //提交成功
                } failture:^(NSError *error) {
                    //失败
                }];
            }];
        }
        return _submitBtn;
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
