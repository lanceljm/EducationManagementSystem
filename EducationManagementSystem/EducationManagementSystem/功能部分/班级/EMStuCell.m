//
//  EMStuCell.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/10.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMStuCell.h"

@interface EMStuCell()

@property(nonatomic,strong) UILabel *nameLabel;
@property(nonatomic,strong) UIImageView *sexImgV;
@property(nonatomic,strong) UILabel *class;


@end

@implementation EMStuCell

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
        [self creatCell];
    }
    return self;
}


+ (instancetype)loadCellWithTableView:(UITableView *)tableView {

    static NSString *identifier = @"stuOrTeacher_ID";
    EMStuCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (!cell) {
        cell = [[EMStuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}



- (void)creatCell {
    _nameLabel = [[UILabel alloc] initWithFrame:AAdaptionRect(20, 10, 200, 80)];
    _nameLabel.text = @"王晓晓";
    [self.contentView addSubview:_nameLabel];
    _sexImgV = [[UIImageView alloc] initWithFrame:AAdaptionRect(240, 20, 60, 60)];
    _sexImgV.image = [UIImage imageNamed:@"men"];
    [self.contentView addSubview:_sexImgV];
    
    _class = [[UILabel alloc] initWithFrame:AAdaptionRect(320, 10, 200, 80)];
    _class.text = @"商务英语";
    [self.contentView addSubview:_class];
}


@end
