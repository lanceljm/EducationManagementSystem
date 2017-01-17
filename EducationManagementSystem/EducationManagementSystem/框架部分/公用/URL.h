//
//  URL.h
//  LOL视频播放
//
//  Created by 花花蔡 on 2016/12/12.
//  Copyright © 2016年 com.HuaHuaCai. All rights reserved.
//

#ifndef URL_h
#define URL_h

//获得通知信息
#define getNotificationUrl @"http://192.168.0.117/api/notice/getNoticeList.html"

//登录
#define getLoginUrl @"http://192.168.0.117/api/staff/login.html"

//根URL
#define BASE_URL @"http://192.168.0.117"

//班级列表
#define getClassList @"http://192.168.0.117/api/staff/getClassList.html"

//班级同学列表
#define getStudentList @"http://192.168.0.117/api/staff/getStudentList.html"

//学生搜索
#define getStudentByName @"http://192.168.0.117/api/staff/getStudentByName.html"

//上课考勤情况
#define getCurriculumList @"http://192.168.0.117/api/staff/getCurriculumList.html"

//学生考勤详情
#define getStuRollcallList @"http://192.168.0.117/api/staff/getStuRollcallList.html"
//上传头像
#define sendIconUrl @"http://192.168.0.117/api/staff/setStaffPicture.html"

//修改密码
#define changePasswordUrl @"http://192.168.0.117/api/staff/changePassword.html"

//关于我们
#define AboutUsUrl @"http://192.168.0.117/api/aboutus/getAboutUs.html"

//用户反馈
#define feedbackUrl @"http://192.168.0.117/api/advice/saveAdvice.html"

//用户信息UD_key
#define UserInfoKey @"UserInfo"

//用户信息
#define USER_INFO [[NSUserDefaults standardUserDefaults] objectForKey:UserInfoKey]

#endif /* URL_h */
