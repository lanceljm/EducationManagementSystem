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
#import <AMapLocationKit/AMapLocationKit.h>
#import "EMSysButton.h"

@interface EMAttendanceController ()<AMapLocationManagerDelegate>

@property(nonatomic,strong) EMIconMarkLabel *timeL;
@property(nonatomic,strong) EMIconMarkLabel *workL;
@property(nonatomic,strong) EMIconMarkLabel *markL;
@property(nonatomic,strong) NSTimer *timer;
@property(nonatomic,strong) MAMapView *mapView;
@property(nonatomic,strong) AMapLocationManager *locationManager;


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
            
            if (btn.tag == 100) {
                 //办公
                
            }else {
                //外出
                
            }
            
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

#pragma mark - 地图定位相关

- (void)addMapView {
    
    CGFloat mapY = CGRectGetMaxY(_markL.frame) + AAdaption(20);
    
    [AMapServices sharedServices].enableHTTPS = YES;
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, mapY, kwidth, AAdaption(500))];
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    
    [self.view addSubview:_mapView];
    
    // 带逆地理（返回坐标和地址信息）。将下面代码中的 YES 改成 NO ，则不会返回地址信息。
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        
//        if (error)
//        {
//            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
//            
//            if (error.code == AMapLocationErrorLocateFailed)
//            {
//                return;
//            }
//        }
        
        NSLog(@"-----------location:-----------\n<%f,%f>", location.coordinate.latitude,location.coordinate.longitude);
        
        if (regeocode)
        {
            NSLog(@"reGeocode:%@", regeocode);
        }
    }];
    
}



//签到签退按钮
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


#pragma mark - 定时器相关

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

#pragma mark - getters
-(AMapLocationManager *)locationManager {
    
    if (!_locationManager) {
        _locationManager = [[AMapLocationManager alloc] init];
        _locationManager.delegate = self;
        // 带逆地理信息的一次定位（返回坐标和地址信息）
        [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        //   定位超时时间，最低2s，此处设置为10s
        _locationManager.locationTimeout = 10;
        //   逆地理请求超时时间，最低2s，此处设置为10s
        _locationManager.reGeocodeTimeout = 10;
        
    }
    return _locationManager;
}




@end
