//
//  EMClassViewCell.m
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/9.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMClassViewCell.h"

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
        
    }
    return self;
}

+ (instancetype)loadCellWithTableView:(UITableView *)tableView {
    
    static NSString *identifier = @"classCellID";
    EMClassViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[EMClassViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

@end
