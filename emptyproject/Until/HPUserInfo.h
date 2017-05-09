//
//  HPUserInfo.h
//  FootballCube
//
//  Created by pique on 14-9-4.
//  Copyright (c) 2014年 pique. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPUserInfo : NSObject

/**
 *  保存相关的用户信息
 *
 *  @param user 用户的数据结构
 *
 *  @return 返回是否保存成功
 */

+ (BOOL)saveUserInfo:(NSDictionary*)userInfo;

/**
 *  获取用户Id
 *
 *  @return 返回用户名
 */
+ (NSString*)getUserId;
/**
 *  注销时清除用户信息
 */
+ (void)clearUserInfo;
+ (void)clearUserInfo:(NSInteger)type;

+ (NSDictionary*)getUserInfo;
/**
 *  判断是否登录
 *
 *  @return yes 已登录 no没有登录
 */
+ (BOOL)isLogin;
/**
 *  判断是否为游客模式登录
 *
 *  @return yes 已登录 no没有登录
 */
+(BOOL)isYouKe;

/**
 *返回用户登陆的Token值
 *
 *
 */
+(NSString *)getToken;
+(void)SaveUserToken:(NSString *)mf_token;
@end
