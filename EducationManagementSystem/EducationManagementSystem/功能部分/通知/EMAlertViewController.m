//
//  EMAlertViewController.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/18.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMAlertViewController.h"
#import "EMTipView.h"
#import <MBProgressHUD.h>

@interface EMAlertViewController ()

@property(nonatomic,strong)EMTipView *tipView;
@property(nonatomic,strong)UIDatePicker *picker;

@end

@implementation EMAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];

}

-(void)setupUI {
    [self setNavi];
    
    self.view.backgroundColor = [UIColor cz_colorWithRed:235 green:240 blue:241];
    
    [self.view addSubview:self.tipView];
    
    
    
}



-(void)setNavi {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0,40/AAdaptionWidth(), 40/AAdaptionWidth());
    //    [leftBtn setTitle:@"" forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -40/AAdaptionWidth(), 0, 0);
    [leftBtn addTarget:self action:@selector(dismissVC) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnL = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = btnL;
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 40/AAdaptionWidth(), 40/AAdaptionWidth());
    [rightBtn setTitle:@"保存" forState:UIControlStateNormal];
    rightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20/AAdaptionWidth());
    [rightBtn addTarget:self action:@selector(saveAlert) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnR = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = btnR;
}

-(void)dismissVC {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)saveAlert {
    
    //获取时间
    NSDate *date = [NSDate date];
//    NSLog(@"%ld",(long)[self.picker.date compare:date]);
    if ([self.picker.date compare:date] > 0) {
        [self.picker removeFromSuperview];
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeDeterminate;
        hud.label.text = @"提示";
        hud.detailsLabel.text = @"闹钟设定成功";
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            hud.hidden = YES;
        });
        
        [[NSUserDefaults standardUserDefaults] setValue:self.picker.date forKey:@"setTipDate"];
        
        self.model.status = YES;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"alertTip" object:nil];
        
    }else {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = @"提示";
        hud.detailsLabel.text = @"时间不可为过去时间";
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            hud.hidden = YES;
        });
    }
    
}

-(EMTipView *)tipView {
    if (!_tipView) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:AAdaptionRect(20, 45, 50, 50)];

        _tipView = [[EMTipView alloc]initWithFrame:AAdaptionRect(0, 64/AAdaptionWidth(), kwidth/AAdaptionWidth(), 140) withTipTitle:self.titleStr withTime:self.timeStr withBlock:^(id sender) {
            if (((UIButton *)sender).selected) {
                
                imageView.image = [UIImage imageNamed:@"蓝圆圈"];
                [self.tipView addSubview:imageView];
                NSDateFormatter *formatter = [NSDateFormatter new];
                [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
                
                _picker = [[UIDatePicker alloc]initWithFrame:AAdaptionRect(20, 64/AAdaptionWidth() + 140, kBaseWidth, 400)];
                [_picker setTimeZone:[NSTimeZone localTimeZone]];//时区
                NSLocale *locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans_CN"];//中国
                [_picker setLocale:locale];
                _picker.datePickerMode = UIDatePickerModeDateAndTime;
                [_picker addTarget:self action:@selector(valueChange) forControlEvents:UIControlEventValueChanged];
                
                [self.view addSubview:_picker];
                
            }else{
                imageView.image = [UIImage imageNamed:@"圆圈"];
                [self.tipView addSubview:imageView];
                
                [_picker removeFromSuperview];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"cancelNSnotif" object:nil];
                [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"cancelAlert"];
                
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.mode = MBProgressHUDModeIndeterminate;
                hud.label.text = @"提示";
                hud.detailsLabel.text = @"取消闹钟提醒";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    hud.hidden = YES;
                });
                
            }
            
        }];
    }
    return _tipView;
}

-(void)valueChange {
    NSDate *date = self.picker.date;
    NSLog(@"获得的时间是：%@",date);
}


@end
