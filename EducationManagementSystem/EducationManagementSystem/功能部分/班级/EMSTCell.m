//
//  EMSTCell.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMSTCell.h"
#import "EMSysButton.h"

@interface EMSTCell ()

@property(nonatomic,strong) UILabel *teaNaame;
@property(nonatomic,strong) UIImageView *iconImgV;
@property(nonatomic,strong) UILabel *sourceOrClassName;

@end

@implementation EMSTCell

- (void)setDetailModel:(EMDetailModel *)detailModel {
    
    _teaNaame.text = detailModel.student.studentName;
    if ([detailModel.student.studentSex isEqualToString:@"男"]) {
        _iconImgV.image = [UIImage imageNamed:@"men"];
    }else
        _iconImgV.image = [UIImage imageNamed:@"women"];
    
    _sourceOrClassName.text = detailModel.rollcallStudentType;
    _sourceOrClassName.textColor = [UIColor redColor];
}

- (void)setModel:(EMTeacherList *)model {
    _teaNaame.text = model.staffName;
    if ([model.staffSex isEqualToString:@"男"]) {
        _iconImgV.image = [UIImage imageNamed:@"men"];
    }else
        _iconImgV.image = [UIImage imageNamed:@"women"];
    
    _sourceOrClassName.text = model.curriculum[@"curriculumName"];
}

- (void)setStuModel:(EMStuModel *)stuModel {
    _teaNaame.text = stuModel.studentName;
    if ([stuModel.studentSex isEqualToString:@"男"]) {
        _iconImgV.image = [UIImage imageNamed:@"men"];
    }else
        _iconImgV.image = [UIImage imageNamed:@"women"];
    
    _sourceOrClassName.text = [NSString stringWithFormat:@"%@",stuModel.scoll[@"scoll"]];

    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatCell];
        
    }
    return self;
}

- (void)creatCell {
    
    _teaNaame = [[UILabel alloc] initWithFrame:AAdaptionRect(40, 20, 130, 60)];
    _teaNaame.font = AAFont(24);
    [self.contentView addSubview:_teaNaame];
    
    _iconImgV = [[UIImageView alloc] initWithFrame:AAdaptionRect(190, 25, 40, 50)];
    [self.contentView addSubview:_iconImgV];
    
    _sourceOrClassName = [[UILabel alloc] initWithFrame:AAdaptionRect(266, 20, 180, 60)];
    _sourceOrClassName.font = _teaNaame.font;
    [self.contentView addSubview:_sourceOrClassName];
    
    //    _teaNaame.text = @"王晓晓";
    //  _iconImgV.image = [UIImage imageNamed:@"men"];
    //_sourceOrClassName.text = @"商务英语";
    
    EMSysButton *callBtn = [[EMSysButton alloc] initWithFrame:AAdaptionRect(750 - 102, 18, 64, 64) withImgName:@"tel" withClickedBlock:^(id sender) {
        
        UIButton *btn = (UIButton*)sender;
        if (self.delegate) {
            [self.delegate cellBtnClick:btn];
        }
        
    }];
    [self.contentView addSubview:callBtn];
    
}

@end
