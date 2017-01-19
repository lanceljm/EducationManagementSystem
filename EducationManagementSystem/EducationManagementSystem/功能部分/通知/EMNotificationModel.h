//
//  EMNotificationModel.h
//  EducationManagementSystem
//
//  Created by ljm on 2017/1/13.
//  Copyright © 2017年 com.HuaHuaCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMNotificationModel : NSObject

@property(nonatomic,strong)NSString *noticeTitle;
@property(nonatomic,strong)NSString *noticeContent;
//@property(nonatomic,assign)NSInteger noticeId;
//@property(nonatomic,strong)NSString *noticeObject;
@property(nonatomic,strong)NSString *noticeDate;

@property(nonatomic,assign)BOOL status;
@property(nonatomic,strong)UIImageView *alertImageView;

@end


/*
 {
 noticeTitle = "学生端通知5";
 noticeContent = "<p>通知5：仅学生端可以查看的</p>";
 noticeId = 14;
 noticeObject = "所有";
 noticeDate = "2016-08-15 14:56:14"
	},
 */
