//
//  EMNotificationCell.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/13.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMNotificationCell.h"

@interface EMNotificationCell()

@property(nonatomic,strong)UILabel *title_label;
@property(nonatomic,strong)UILabel *time_label;
@property(nonatomic,strong)NSString *contexts;

@end

@implementation EMNotificationCell

-(void)setModel:(EMNotificationModel *)model {
    _model = model;
    
    _contexts = model.noticeContent;//内容
    
    _title_label.text = model.noticeTitle;
    
    _time_label.text = model.noticeDate;
    
    
    _title_label = [[UILabel alloc]initWithFrame:AAdaptionRect(20, 20, kwidth*AAdaptionWidth() - 20 *2, 50)];
    _title_label.textColor = [UIColor cz_colorWithHex:0x4f4f4f];
    _title_label.textAlignment = NSTextAlignmentLeft;
    _title_label.font = AAFont(32);
    
    _time_label = [[UILabel alloc]initWithFrame:AAdaptionRect(20, 75, CGRectGetWidth(self.title_label.frame)/AAdaptionWidth(), 40)];
    _time_label.textColor = [UIColor cz_colorWithHex:0x999999];
    _time_label.textAlignment = NSTextAlignmentLeft;
    _time_label.font = AAFont(26);

    [self addSubview:_title_label];
    [self addSubview:_time_label];
    
    UIView *line = [[UIView alloc]initWithFrame:AAdaptionRect(0, 138, kwidth/AAdaptionWidth(), 2)];
    line.backgroundColor = [UIColor blackColor];
    [self addSubview:line];
}

//
//-(UILabel *)title_label {
//    if (!_title_label) {
//        _title_label = [[UILabel alloc]initWithFrame:AAdaptionRect(20, 20, kwidth*AAdaptionWidth() - 20 *2, 50)];
//        _title_label.textColor = [UIColor cz_colorWithHex:0x4f4f4f];
//        _title_label.textAlignment = NSTextAlignmentLeft;
//        _title_label.font = AAFont(32);
//    }
//    return _title_label;
//}
//
//-(UILabel *)time_label {
//    if (!_time_label) {
//        
//        _time_label = [[UILabel alloc]initWithFrame:AAdaptionRect(20, 75, CGRectGetWidth(self.title_label.frame)/AAdaptionWidth(), 40)];
//        _time_label.textColor = [UIColor cz_colorWithHex:0x999999];
//        _time_label.textAlignment = NSTextAlignmentLeft;
//        _time_label.font = AAFont(26);
//    
//    }
//    return _time_label;
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
