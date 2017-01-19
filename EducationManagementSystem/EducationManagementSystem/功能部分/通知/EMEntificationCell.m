//
//  EMEntificationCell.m
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/18.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMEntificationCell.h"

@implementation EMEntificationCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _title_label = [[UILabel alloc]initWithFrame:AAdaptionRect(20, 20 - 1, self.frame.size.width/AAdaptionWidth() - 20*2, 50)];
        _title_label.font = AAFont(32);
        _title_label.textColor = [UIColor cz_colorWithHex:0x4f4f4f];
        [self.contentView addSubview:_title_label];
        
        _time_label = [[UILabel alloc]initWithFrame:AAdaptionRect(20, 80 - 1, self.frame.size.width/AAdaptionWidth() - 20*2, 40)];
        _time_label.font = AAFont(26);
        _time_label.textColor = [UIColor cz_colorWithHex:0x999999];
        [self.contentView addSubview:_time_label];

        
        UIView *lineView = [[UIView alloc]initWithFrame:AAdaptionRect(0, 138, kwidth/AAdaptionWidth(), 2)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:lineView];
        
         _alertImage = [[UIImageView alloc]initWithFrame:AAdaptionRect(kBaseWidth - 20 - 30, 60, 30, 30)];
        _alertImage.image = [UIImage imageNamed:@"蓝闹钟"];

        
//        NSDate *date = [[NSUserDefaults standardUserDefaults] objectForKey:@"setTipDate"];
//        
//        NSLog(@"设置闹钟成功后的时间%@",date);
//        if (date != nil) {
//            alertImage.hidden = NO;
//        }else {
//            alertImage.hidden = YES;
//        }
        [self.contentView addSubview:_alertImage];
        

    }
    return self;
}

-(void)showData:(EMNotificationModel *)model {
    self.title_label.text = model.noticeTitle;
    self.time_label.text = model.noticeDate;
    
    if (!model.status) {
        _alertImage.hidden = YES;
    }else {
        _alertImage.hidden = NO;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
