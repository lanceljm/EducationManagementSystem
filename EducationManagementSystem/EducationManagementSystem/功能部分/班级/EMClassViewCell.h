//
//  EMClassViewCell.h
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/9.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol cellBtnClickedDelegate <NSObject>

- (void)cellBtnClick:(UIButton *)btn;

@end

@interface EMClassViewCell : UITableViewCell

@property(nonatomic,weak) id<cellBtnClickedDelegate>delegate;


+ (instancetype)loadCellWithTableView:(UITableView *)tableView Vc:(UITableViewController *)vc;

@end
