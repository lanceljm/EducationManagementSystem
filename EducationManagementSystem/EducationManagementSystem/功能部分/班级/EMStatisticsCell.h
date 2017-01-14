//
//  EMStatisticsCell.h
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/13.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMBaseCell.h"
#import "EMStatisticsModel.h"
@class EMStatisticsCell;
@protocol cellDelegate <NSObject>

- (void)cellWithcell:(EMStatisticsCell*)cell;

@end

@interface EMStatisticsCell : EMBaseCell

@property(nonatomic,weak) id<cellDelegate>delegateWithCell;
@property(nonatomic,strong) EMStatisticsModel *model;


@end
