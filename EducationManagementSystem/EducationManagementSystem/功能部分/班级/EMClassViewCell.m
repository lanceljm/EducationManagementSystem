//
//  EMClassViewCell.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/9.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMClassViewCell.h"
#import "EMIconDirectionButton.h"
@interface EMClassViewCell()

@property(nonatomic,strong) UILabel *classNameL;
@property(nonatomic,strong) EMIconDirectionButton *stuNumBtn;
@property(nonatomic,strong) EMIconDirectionButton *teacherNumBtn;
@property(nonatomic,strong) EMIconDirectionButton *signInBtn;
@property(nonatomic,strong) EMIconDirectionButton *signOutBtn;
@property(nonatomic,strong) EMIconDirectionButton *statisticsBtn;

@end

@implementation EMClassViewCell


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
    
    static NSString *identifier = @"classCellID";
    EMClassViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[EMClassViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.preservesSuperviewLayoutMargins = NO;
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;

    
    return cell;
}

- (void)creatCell {
    _classNameL = [[UILabel alloc] initWithFrame:AAdaptionRect(16, 0, kwidth - 16, 100)];
    _classNameL.text = @"2013-1-1";
    _classNameL.font = AAFont(32);
    [self.contentView addSubview:_classNameL];
    
    CGFloat classNameX = _classNameL.frame.origin.x;
    UIView *grayLine = [[UIView alloc] initWithFrame:CGRectMake(classNameX, CGRectGetMaxY(_classNameL.frame), kwidth - classNameX, 1)];
    grayLine.backgroundColor = [UIColor cz_colorWithHex:0x4f4f4f];
    [self.contentView addSubview:grayLine];
    
    //NSArray *btnArr = @[_stuNumBtn,_teacherNumBtn,_signInBtn,_signOutBtn,_statisticsBtn];
    
    for (int index = 0; index < 5; index ++) {
        int tag = index + 100;
        EMIconDirectionButton *btn = [[EMIconDirectionButton alloc] initWithFrame:AAdaptionRect(index * 150, 120, 150, 130) withTag:tag withTitle:@"tag" withTitleColor:[UIColor cz_colorWithHex:0x2269d5] withImage:@"签退" withFont:28 withDirection:top withBlock:^(id sender) {
            EMIconDirectionButton *btn = sender;
            NSLog(@"----%ld",(long)btn.tag);
            
        }];
        [self.contentView addSubview:btn];
    }
    
}

@end
