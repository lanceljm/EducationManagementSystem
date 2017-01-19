//
//  EMEntificationCell.h
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/18.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMNotificationModel.h"

@interface EMEntificationCell : UITableViewCell

@property(nonatomic,strong)UILabel *title_label;
@property(nonatomic,strong)UILabel *time_label;

@property(nonatomic,strong)UIImageView *alertImage;

//显示数据
-(void)showData:(EMNotificationModel *)model;

@end
