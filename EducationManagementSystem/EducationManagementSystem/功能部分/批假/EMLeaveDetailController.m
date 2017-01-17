//
//  EMLeaveDetailController.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/10.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMLeaveDetailController.h"
#import "EMSysButton.h"

@interface EMLeaveDetailController ()

@property(nonatomic,strong) UILabel *detail;
@property(nonatomic,strong) UILabel *studentName;
@property(nonatomic,strong) UILabel *startTime;
@property(nonatomic,strong) UILabel *endTime;

@end

@implementation EMLeaveDetailController

-(void)setModel:(EMleaveModel *)model {
    _model = model;
    _detail.text = model.askForLeaveContent;
    _studentName.text = model.student.studentName;
    _startTime.text = model.askForLeaveStartTime;
    _endTime.text = model.askForLeaveEndTime;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"批假";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupUI {
    
    CGFloat Y = CGRectGetMaxY(self.navigationController.navigationBar.frame)/AAdaptionWidth();
    for (int i = 0; i < 2; i++) {
        UIView *line = [[UIView alloc] initWithFrame:AAdaptionRect(40, Y + 100 * (i+1), 710, 2)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:line];
    }
    
    NSArray *text = @[@"申请人",@"请假时间",@"结束时间"];
    for (int i = 0; i < 3; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:AAdaptionRect(40, Y +i*100, 120, 100)];
        label.font = AAFont(32);
        label.textColor = [UIColor cz_colorWithHex:0x4991ff];
        label.text = text[i];
        [self.view addSubview:label];
        
        UILabel *lab = [[UILabel alloc] initWithFrame:AAdaptionRect(170, i*100, 550, 100)];
        lab.font = label.font;
        lab.textColor = label.textColor;
        switch (i) {
            case 0:
                _studentName = lab;
                break;
            case 1:
                _startTime = lab;
                break;
            default:
                _endTime = lab;
                break;
        }
        [self.view addSubview:lab];
    }
    
    _detail = [[UILabel alloc] initWithFrame:AAdaptionRect(40, 464, 670, 384)];
    _detail.numberOfLines = 0;
    _detail.layer.cornerRadius = 5;
    _detail.layer.borderWidth = 1;
    _detail.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _detail.text = @"你说你是不是傻逼是死机死就死机即死机死机及司机基金四季is就";
    [self.view addSubview:_detail];
    
    CGFloat detailY = CGRectGetMaxY(_detail.frame);
    
    __weak typeof(self)weakSelf = self;
    EMSysButton *agreeBtn = [[EMSysButton alloc] initWithFrame:CGRectMake(AAdaption(39), detailY, AAdaption(672), 90) withTag:111 withTitle:@"同意" withTitleColor:[UIColor whiteColor] withBackgrougdColor:[UIColor cz_colorWithHex:0x25cb9b] withCornerRadious:0.05 withClickedBlock:^(id sender) {
        
        [weakSelf askForLeaveWithStatus:@"同意"];
    }];
    [self.view addSubview:agreeBtn];
    
    CGFloat agreeBtnY = CGRectGetMaxY(agreeBtn.frame);
    
    EMSysButton *disAgreeBtn = [[EMSysButton alloc] initWithFrame:CGRectMake(AAdaption(39), agreeBtnY, AAdaption(672), 90) withTag:111 withTitle:@"拒绝" withTitleColor:[UIColor whiteColor] withBackgrougdColor:[UIColor cz_colorWithHex:0xf54343] withCornerRadious:0.05 withClickedBlock:^(id sender) {
        [weakSelf askForLeaveWithStatus:@"不同意"];
    }];
    [self.view addSubview:disAgreeBtn];
}

- (void)askForLeaveWithStatus:(NSString *)status {
    
    NSDictionary *para = @{@"staffId":USER_INFO[@"staffId"],@"askForLeaveId": _model.askForLeaveId,@"askForLeaveStatus":status,@"token":USER_INFO[@"token"]};
    
    [NetRequest POST:dealAskLeave parameters:para success:^(id responseObject) {
        
    } failture:^(NSError *error) {
        
    }];
}

@end
