//
//  EMSTCell.h
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/11.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "EMBaseCell.h"
#import "EMTeacherList.h"
#import "EMStuModel.h"
#import "EMDetailModel.h"
@interface EMSTCell : EMBaseCell

@property(nonatomic,weak) id<cellBtnClickedDelegate> delegate;
@property(nonatomic,strong) EMTeacherList *model;
@property(nonatomic,strong) EMStuModel *stuModel;
@property(nonatomic,strong) EMDetailModel *detailModel;


@end
