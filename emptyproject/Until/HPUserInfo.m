//
//  HPUserInfo.m
//  FootballCube
//
//  Created by pique on 14-9-4.
//  Copyright (c) 2014年 pique. All rights reserved.
//

#import "HPUserInfo.h"

@implementation HPUserInfo

+ (BOOL)saveUserInfo:(NSDictionary*)userInfo
{
    [[NSUserDefaults standardUserDefaults] setValue:userInfo forKey:user_info];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}

+ (void)clearUserInfo
{
    [HPUserInfo clearUserInfo:0];
}

+ (void)clearUserInfo:(NSInteger)type
{

    [[NSUserDefaults standardUserDefaults] removeObjectForKey:user_info];
   // [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"USERNAME"];
    if (type==0) {
        [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"PASSWARD"];
        [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"SecretPASSWARD"];
    }
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"mf_token"];
    //提醒抽奖次数的时间
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"TimeLottory"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (NSString*)getUserId
{

    NSString* str = [[[[NSUserDefaults standardUserDefaults] objectForKey:user_info] valueForKey:UserID] description];
    if (str == nil)
        str = @"";
    return str;
}

+ (NSDictionary*)getUserInfo
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:user_info];
}

+ (BOOL)isLogin
{

    NSString* userId = [HPUserInfo getUserId];
    if (userId.length > 0) {
        return YES;
    }
    else {
        return NO;
    }
    //return CHECK_STRING(userId);
}
+ (NSString*)getUserLoginName
{
    return @"";
}

+(void)SaveUserToken:(NSString *)mf_token
{
    [[NSUserDefaults standardUserDefaults] setValue:mf_token forKey:@"mf_token"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *)getToken
{
    return [[ComoneObject EmptyCheckobjnil:[[NSUserDefaults standardUserDefaults] valueForKey:@"mf_token"]] description];
    //return [ComoneObject EmptyCheckobjnil:[[HPUserInfo getUserInfo] valueForKey:@"mf_token"]];
}

+(BOOL)isYouKe
{
    if ([[self getUserInfo] valueForKey:@"youke"]!=nil&&[[[self getUserInfo] valueForKey:@"youke"]isEqualToString:@"1"])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

@end
