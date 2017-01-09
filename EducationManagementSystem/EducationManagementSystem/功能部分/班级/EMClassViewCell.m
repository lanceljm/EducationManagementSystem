//
//  EMClassViewCell.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/9.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMClassViewCell.h"
#import "EMIconDirectionButton.h"
#import "EMStuOrTeacherViewController.h"

@interface EMClassViewCell()

@property(nonatomic,strong) UILabel *classNameL;
@property(nonatomic,strong) EMIconDirectionButton *stuNumBtn;
@property(nonatomic,strong) EMIconDirectionButton *teacherNumBtn;
//@property(nonatomic,strong) EMIconDirectionButton *signInBtn;
//@property(nonatomic,strong) EMIconDirectionButton *signOutBtn;
//@property(nonatomic,strong) EMIconDirectionButton *statisticsBtn;
@property(nonatomic,strong) UITableViewController *classTableView;


@end

@implementation EMClassViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableViewController *)TVC
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatCell];
        _classTableView = TVC;
    }
    return self;
}

+ (instancetype)loadCellWithTableView:(UITableView *)tableView Vc:(UITableViewController *)vc {
    
    static NSString *identifier = @"classCellID";
    EMClassViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[EMClassViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier tableView:vc];
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
    _classNameL.textColor = [UIColor cz_colorWithHex:0x4f4f4f];
    [self.contentView addSubview:_classNameL];
    
    CGFloat classNameX = _classNameL.frame.origin.x;
    UIView *grayLine = [[UIView alloc] initWithFrame:CGRectMake(classNameX, CGRectGetMaxY(_classNameL.frame), kwidth - classNameX, 0.6)];
    grayLine.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:grayLine];
    
    NSArray *btnImageArr = @[@"students",@"teacher",@"签到",@"签退",@"统计"];
    NSArray *btnNameArr = @[@"0",@"0",@"签到",@"签退",@"统计"];
    for (int index = 0; index < 5; index ++) {
        int tag = index + 100;
        
        __weak typeof(self)weakSelf = self;
        EMIconDirectionButton *btn = [[EMIconDirectionButton alloc] initWithFrame:AAdaptionRect(index * 150, 125, 150, 130) withTag:tag withTitle:btnNameArr[index] withTitleColor:BLUE_COLOR withImage:btnImageArr[index] withFont:28 withDirection:top withBlock:^(id sender) {
            
            EMIconDirectionButton *btn = sender;
            
            [weakSelf loadVcWithBtnTag:btn.tag];
            
        }];
        if (index == 0) {
            _stuNumBtn = btn;
        }
        if (index == 1) {
            _teacherNumBtn = btn;
        }
        [self.contentView addSubview:btn];
    }
    
}

- (void)loadVcWithBtnTag:(NSInteger)tag {
    
    switch (tag) {
        case 100:{
            //学生界面
            NSLog(@"推出学生界面");
            EMStuOrTeacherViewController *sTVc = [[EMStuOrTeacherViewController alloc] init];
            [self.classTableView.navigationController pushViewController:sTVc animated:YES];
        }
            break;
        case 101:{
            //统计界面
        }
            break;
        case 102:{
            //签到
        }
        case 103:{
            //签退
        }
        default: {
            //统计
        }
            break;
    }

}









@end
