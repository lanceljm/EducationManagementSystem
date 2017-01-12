//
//  EMAttendanceController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/6.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMAttendanceController.h"
#import "EMIconDirectionButton.h"
#import "EMTwoBtnView.h"
#import "EMIconMarkLabel.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import "EMSysButton.h"
@interface EMAttendanceController ()

@property(nonatomic,strong) EMIconMarkLabel *timeL;
@property(nonatomic,strong) EMIconMarkLabel *workL;
@property(nonatomic,strong) EMIconMarkLabel *markL;
@property(nonatomic,strong) NSTimer *timer;
@property(nonatomic,strong) MAMapView *mapView;

@end

@implementation EMAttendanceController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self startTimer];
    [self addBtn];
    [self addMapView];
    [self addEndBtn];
    
    
}

- (void)dealloc {
    [self stopTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (void)addBtn {
    
    EMTwoBtnView *Btnview = [[EMTwoBtnView alloc] initWithLeftDirectionFrame:CGRectMake(0, 64/AAdaptionWidth(), 750, 120) WithBKColor:[UIColor whiteColor] btnNames:@[@"办公",@"外出"] TitleCols:Color_4F4F4F
        WithImages:@[@"形状-1",@"形状-2"] WithFont:36
        WithSelectorBtnBlock:^(UIButton* btn) {
            btn.selected = YES;
        }];
    [self.view addSubview:Btnview];

    CGFloat btnViewY = CGRectGetMaxY(Btnview.frame) + AAdaption(18);
    
    NSArray *titleArr = @[@"申请时间:",@"办公地点:",@"签到地点:"];
    NSArray *imgArr = @[@"01",@"02",@"03"];
    
    for (int i = 0; i < 3; i++) {
        EMIconMarkLabel *label = [[EMIconMarkLabel alloc] initWithFrame:CGRectMake(AAdaption(244), btnViewY + AAdaption(80) * i, AAdaption(200), AAdaption(80)) withTitle:titleArr[i] TitleCol:Color_4F4F4F imageName:imgArr[i] Font:28];
        switch (i) {
            case 0:
                _timeL = label;
                break;
            case 1:
                _workL = label;
                break;
            default:
                _markL = label;
                break;
        }
        [self.view addSubview:label];
    }
    
}

- (void)addMapView {
    
    CGFloat mapY = CGRectGetMaxY(_markL.frame) + AAdaption(20);
    
    [AMapServices sharedServices].enableHTTPS = YES;
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, mapY, kwidth, AAdaption(500))];
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    
    [self.view addSubview:_mapView];
}

- (void)addEndBtn {
    
    CGFloat btnY = CGRectGetMaxY(_mapView.frame) + AAdaption(34);
    UIColor *btnCol = [UIColor colorWithRed:0 green:212/255.0 blue:159/255.0 alpha:0.9];
    
    EMSysButton *btn = [[EMSysButton alloc] initWithFrame:AAdaptionRect(20, btnY/AAdaptionWidth(), 710, 90) withTag:300 withTitle:@"签到" withTitleColor:[UIColor whiteColor] withBackgrougdColor: btnCol withCornerRadious:0.1 withClickedBlock:^(id sender) {
        
        UIButton *b = (UIButton *)sender;
        if ([b.titleLabel.text isEqualToString:@"签到"]) {
            [b setTitle:@"签退" forState:normal];
        }else
            [b setTitle:@"签到" forState:normal];
    }];;
    
    [self.view addSubview:btn];
    
}

- (void)startTimer {
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timeFunc) userInfo:nil repeats:YES];
}

- (void)stopTimer {
    [_timer invalidate];
    _timer = nil;
}

- (void)timeFunc {
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSString *locationStr = [formatter stringFromDate:date];
    _timeL.text = locationStr;
}


@end
