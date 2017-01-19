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

@property(nonatomic,assign) CGFloat rollcallStaffLongitude;
@property(nonatomic,assign) CGFloat rollcallStaffLatitude;


@end

@implementation EMAttendanceController
{
    NSString *houseLatitude;
    NSString *houseLongitude;
    NSString *POIName;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadAttendanceWithStr:attendance];
    [self startTimer];
    [self addBtn];
    [self addMapView];
    [self addEndBtn];
    
    
}

- (void)loadAttendanceWithStr:(NSString *)str {
    
    NSDictionary *parameter = @{@"staffId":USER_INFO[@"staffId"],@"token":USER_INFO[@"token"]};
    [NetRequest GET: str parameters:parameter success:^(id responseObject) {
        if ([str isEqualToString:attendance]) {
            NSDictionary *house = responseObject[@"result"][@"house"];
            NSLog(@"house ---  %@",house);
            _workL.text = house[@"houseName"];
        }else {
            NSLog(@"%@",responseObject);
            _workL.text = @"无外出任务";
        }
        
    } failture:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)dealloc {
    [self stopTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (void)addBtn {
    
    __weak typeof(self)weakSelf = self;
    EMTwoBtnView *Btnview = [[EMTwoBtnView alloc] initWithLeftDirectionFrame:CGRectMake(0, 64/AAdaptionWidth(), 750, 120) WithBKColor:[UIColor whiteColor] btnNames:@[@"办公",@"外出"] TitleCols:Color_4F4F4F
        WithImages:@[@"形状-1",@"形状-2"] WithFont:36
        WithSelectorBtnBlock:^(UIButton* btn) {
            btn.selected = YES;
            
            if (btn.tag == 100) {
                 //办公
                [weakSelf loadAttendanceWithStr:attendance];

            }else {
                //外出
                [weakSelf loadAttendanceWithStr:outAttendance];
            }
            
        }];
    [self.view addSubview:Btnview];

    CGFloat btnViewY = CGRectGetMaxY(Btnview.frame) + AAdaption(18);
    
    NSArray *titleArr = @[@"申请时间:",@"办公地点:",@"签到地点:"];
    NSArray *imgArr = @[@"01",@"02",@"03"];
    
    for (int i = 0; i < 3; i++) {
        EMIconMarkLabel *label = [[EMIconMarkLabel alloc] initWithFrame:CGRectMake(AAdaption(244), btnViewY + AAdaption(80) * i, AAdaption(400), AAdaption(80)) withTitle:titleArr[i] TitleCol:Color_4F4F4F imageName:imgArr[i] Font:24];
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
        
        _rollcallStaffLatitude = location.coordinate.latitude;
        _rollcallStaffLongitude = location.coordinate.longitude;
        
        if (regeocode)
        {
            //NSLog(@"reGeocode:%@", regeocode.POIName);
            POIName = regeocode.POIName;
        }
    }];
    
}



//签到签退按钮
- (void)addEndBtn {
    
    CGFloat btnY = CGRectGetMaxY(_mapView.frame) + AAdaption(34);
    UIColor *btnCol = [UIColor colorWithRed:0 green:212/255.0 blue:159/255.0 alpha:0.9];
    
    __weak typeof(self)weakSelf = self;
    EMSysButton *btn = [[EMSysButton alloc] initWithFrame:AAdaptionRect(20, btnY/AAdaptionWidth(), 710, 90) withTag:300 withTitle:@"签到" withTitleColor:[UIColor whiteColor] withBackgrougdColor: btnCol withCornerRadious:0.1 withClickedBlock:^(id sender) {
        
        UIButton *b = (UIButton *)sender;
        if ([b.titleLabel.text isEqualToString:@"签到"]) {
            [weakSelf saveRollcallStaffWithType:@"签到" finish:^(BOOL success) {
                if (success)
                    [b setTitle:@"签退" forState:normal];
            }];
            
        }else
            [weakSelf saveRollcallStaffWithType:@"签退" finish:^(BOOL success) {
                if(success)
                    [b setTitle:@"签到" forState:normal];
            }];
    }];;
    
    [self.view addSubview:btn];
    
}

- (void)saveRollcallStaffWithType:(NSString *)type finish:(void(^)(BOOL success))finished {
    
    NSDictionary *para = @{
                           @"staffId":                  USER_INFO[@"staffId"],
                           @"rollcallStaffTime":        _timeL.text,
                           @"rollcallStaffLongitude":   @(_rollcallStaffLongitude),
                           @"rollcallStaffLatitude":    @(_rollcallStaffLatitude),
                           @"rollcallType":             type,
                           @"rollcallStaffType":        @"办公",
                           @"rollcallStaffId":          @0,
                           @"token":                    USER_INFO[@"token"]
                           };
    
    __weak typeof(self)weakSelf = self;
    [NetRequest POST:saveRollcallStaff parameters:para success:^(id responseObject) {
        
        NSString *message = responseObject[@"message"];
        //NSLog(@"--- -----%@",message);
        if (POIName)   _markL.text = POIName;
        
        [weakSelf showAlertWithTitle:message AndMessage:nil];
        
        if ([message isEqualToString:@"已签到"] || [message isEqualToString:@"已签退"]) {
            finished(YES);
        }else
            finished(NO);
        
    } failture:^(NSError *error) {
        finished(NO);
    }];
    
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


- (void)showAlertWithTitle:(NSString *)title AndMessage:(NSString *)message {
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [self presentViewController:alertVC animated:YES completion:nil];
    
}

@end
