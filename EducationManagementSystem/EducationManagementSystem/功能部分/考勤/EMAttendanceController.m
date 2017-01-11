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

@interface EMAttendanceController ()

@property(nonatomic,strong) EMIconMarkLabel *timeL;
@property(nonatomic,strong) EMIconMarkLabel *workL;
@property(nonatomic,strong) EMIconMarkLabel *markL;


@end

@implementation EMAttendanceController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addBtn];
    _timeL.text = @"9:23:23";
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
        EMIconMarkLabel *label = [[EMIconMarkLabel alloc] initWithFrame:CGRectMake(AAdaption(244), btnViewY + AAdaption(90) * i, AAdaption(200), AAdaption(90)) withTitle:titleArr[i] TitleCol:Color_4F4F4F imageName:imgArr[i] Font:28];
        switch (i) {
            case 0:
                _timeL = label;
                break;
            case 2:
                _workL = label;
                break;
            default:
                _markL = label;
                break;
        }
        [self.view addSubview:label];
    }
    
    
}

@end
