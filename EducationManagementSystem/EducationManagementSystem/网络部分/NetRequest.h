//
//  NetRequest.h
//  三方网络请求
//
//  Created by 花花蔡 on 2016/11/11.
//  Copyright © 2016年 com.HuaHuaCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetRequest : NSObject

//GET
+ (void)GET:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(id responseObject))sucess failture:(void(^)(NSError *error))failture;

//POST
+ (void)POST:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(id responseObject))sucess failture:(void(^)(NSError *error))failture;



@end
