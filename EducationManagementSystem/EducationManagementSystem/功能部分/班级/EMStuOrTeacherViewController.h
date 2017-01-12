//
//  EMStuOrTeacherViewController.h
//  EducationManagementSystem
//
//  Created by 花花蔡 on 2017/1/9.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import "BaseViewController.h"
#import "EMTeacherList.h"
#import "EMStuModel.h"
@interface EMStuOrTeacherViewController : BaseViewController

@property(nonatomic,strong) NSArray<EMTeacherList*> *staffList;
@property(nonatomic,assign) NSInteger btnTag;
@property(nonatomic,strong) NSMutableArray<EMStuModel*> *stuModelArr;
@property(nonatomic,strong) NSDictionary *param;


@end
