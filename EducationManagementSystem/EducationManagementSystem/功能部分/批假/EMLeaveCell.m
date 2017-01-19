//
//  EMLeaveCell.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/10.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMLeaveCell.h"

@interface EMLeaveCell()

@property(nonatomic,strong) UILabel *name;
@property(nonatomic,strong) UILabel *reson;
@property(nonatomic,strong) UILabel *startTime;
@property(nonatomic,strong) UILabel *endTime;
@property(nonatomic,strong) UILabel *status;


@end

@implementation EMLeaveCell

- (void)setModel:(EMleaveModel *)model {
  
    _name.text = model.student.studentName;
    _reson.text = model.askForLeaveType;
    _startTime.text = model.askForLeaveStartTime;
    _endTime.text = model.askForLeaveEndTime;
    
    if ([model.askForLeaveStatus isEqualToString:@"不同意"]) {
        _status.text = @"未同意";
        _status.backgroundColor = [UIColor cz_colorWithHex:0xf54343];
        _status.textColor = [UIColor whiteColor];
    }
    if ([model.askForLeaveStatus isEqualToString:@"同意"]) {
        _status.text = @"已同意";
        _status.backgroundColor = [UIColor cz_colorWithHex:0x25cb9b];
        _status.textColor = [UIColor whiteColor];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _name = [[UILabel alloc] initWithFrame:AAdaptionRect(20, 20, 100, 40)];
        _name.font = AAFont(32);
        _name.textColor = [UIColor cz_colorWithHex:0x4f4f4f];
        [self.contentView addSubview:_name];
        _reson = [[UILabel alloc] initWithFrame:AAdaptionRect(140, 20, 96, 40)];
        _reson.text = @"事假";
        _reson.font = AAFont(28);
        _reson.backgroundColor = [UIColor cz_colorWithHex:0x4991ff];
        _reson.textAlignment = NSTextAlignmentCenter;
        _reson.layer.cornerRadius = 8;
        _reson.layer.masksToBounds = YES;
        _reson.textColor = [UIColor cz_colorWithHex:0xffffff];
        [self.contentView addSubview:_reson];

        _startTime = [[UILabel alloc] initWithFrame:AAdaptionRect(20, 80, 200, 40)];
        _startTime.font = AAFont(24);
        _startTime.textColor = [UIColor cz_colorWithHex:0x999999];
        [self.contentView addSubview:_startTime];
        
        _endTime = [[UILabel alloc] initWithFrame:AAdaptionRect(260, 80, 200, 40)];
        _endTime.font = _startTime.font;
        _endTime.textColor = _startTime.textColor;
        [self.contentView addSubview:_endTime];
        
//        CGFloat statusX = kwidth - AAdaption(160);
        _status = [[UILabel alloc] initWithFrame:AAdaptionRect(750 - 160, 0, 160, 140)];
        _status.font = AAFont(24);
        _status.textAlignment = NSTextAlignmentCenter;
        _status.backgroundColor = [UIColor cz_colorWithHex:0xcdddf4];
        [self.contentView addSubview:_status];
        
        _name.text = @"王晓晓";
        _startTime.text = @"申请时间:10:35";
        _endTime.text = @"结束时间:11:55";
        _status.text = @"待批";

    }
    return self;
}

@end
