//
//  ComoneObject.h
//  MaCh
//
//  Created by Yan Han on 12-5-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
//#import "HZSorceObj.h"
#import "sys/utsname.h"
@interface ComoneObject : NSObject
+ (NSString*)getNowTimeYM;
+ (NSString*)datetostringss:(NSDate*)datetime; //获取当前时间
+ (BOOL)nicheng:(NSString *)mynicheng;
+ (BOOL)iszhengwen:(NSString*)emailString;
+ (NSDate*)stringtodate:(NSString*)datetime;
+ (NSString*)RuturnCaiPiao:(NSString*)jiesantime;//时间戳返回
//判断截止日期
+ (NSInteger)RuturnCaiPiaoTime:(NSString*)jiesantime; //时间戳返回
+ (BOOL)isPhone:(NSString*)emailString;

+ (id)EmptyCheckobj:(id)obj;
+ (id)EmptyCheckobjnil:(id)obj;

+ (BOOL)isAvailableEmail:(NSString*)emailString; //验证邮箱

- (NSString*)RuturnJiesanTime:(NSString*)jiesantime now:(NSString*)nowtime;

+ (NSString*)getNowTime;
+ (NSString*)datetostring:(NSDate*)datetime;


+ (NSString*)DataTimeToJintian:(NSString*)time; // 处理今天的时间
//和当前时间做比较 返回时间差
+(int)compareTimeSinceNow:(NSString *)comparetime;
+ (NSUInteger)unicodeLengthOfString:(NSString*)text;
- (BOOL)checknum:(NSString*)str;

+ (NSString*)getWeekByNumDate:(NSString*)timeString;
+ (NSString*)DataTimeToDateMd:(NSString*)time;
+ (NSString*)DataTimeToDate:(NSString*)timeString;
+ (NSString*)DataTimeToDateGuess:(NSString*)time;
+ (BOOL)DataTimeCompareTime:(NSString*)timeOne SecondTime:(NSString*)timeTwo;
+ (BOOL)DateTimeCompareTime:(NSString*)timeOne ServiceTime:(NSString*)timeTwo;
+ (NSString*)RuturnTimeBefore:(NSString*)jiesantime;
+ (NSString*)RuturnTimeSJCBefore:(NSString*)jiesantime;
+ (NSString *)times:(NSString *)time_s;//  距离
+ (BOOL)ValidateURL:(NSString *)strurl;
/**
 *  设置统一标记用来本地存储
 *
 */
+ (void)setUnifyFlag:(NSString*)unifyFlag UnifyKey:(NSString*)key;

/**
 *  得到统一标记
 *
 */
+ (NSString*)getUnifyKey:(NSString*)key;

+ (void)setZRFlag:(NSMutableArray*)array ZRKey:(NSString*)key;
+ (NSMutableArray*)getZRKey:(NSString*)key;
/**
 *  弹出框动画效果
 *
 *  @param changeOutView 要加动画的View
 *  @param dur           动画时间
 */
+ (void)exChangeOut:(UIView*)changeOutView dur:(CFTimeInterval)dur;
/**
 *  效果消失
 *
 *  @param disappearView 要加动画的View
 *  @param time          动画时间
 */
+ (void)exChangeDisappear:(UIView*)disappearView dur:(CFTimeInterval)time;
/**
 *  图片等比例缩放
 *
 *  @param image 要缩放的image
 *  @param asize 图片的大小
 *
 *  @return UIimage
 */
+ (UIImage*)createThumbImage:(UIImage *)image size:(CGSize )thumbSize percent:(float)percent toPath:(NSString *)thumbPath;
+ (UIImage*)thumbnailWithImageWithoutScale:(UIImage*)image size:(CGSize)asize;

/**
 *                   时间戳转化为时间
 *
 *  @param str       要传入的时间戳
 *  @param styleTime 类型
 *
 *  @return           时间
 */
+ (NSString*)timeConversion:(NSString*)str style:(NSString*)styleTime;

+ (NSString*)StringtimeConversion:(NSString*)str style:(NSString*)styleTime;
/**
 *  yyyy -mm-dd 转化为时间戳
 */
+ (long long)changeTimeToTimeSp:(NSString*)timeStr;

/**
 *   正则判断手机号码地址格式
 */
+ (BOOL)isMobileNumber:(NSString*)mobileNum;
+ (void)exChangeOut:(UIView*)changeOutView dur:(CFTimeInterval)dur type:(NSString*)str disappearView:(UIView*)disView;

/**
 *  时间处理  2014-08-16 19:45:00  这样的格式 得到  19:45
 *
 *  @param time 得到mm－dd
 *
 *  @return
 */
+ (NSString*)DataTime_ToWeek:(NSString*)time;
/**
 *  球员的位置
 *
 */
+ (NSString*)positionForMF:(NSString*)positions;
/**
 *  判断设备型号
 *
 */

+ (NSString*)getDeviceAndOSInfo;

+ (NSString*)timeCompare:(NSString*)str_data_1 timeCompareTwo:(NSString*)str_data_2;

+ (void)pushNextUIViewController:(UIViewController*)viewController myView:(UIView*)views;
+ (void)presentModalViewController:(UIViewController*)viewController myView:(UIView*)views;
/**
 *  正则判断身份证号码
 */
+ (BOOL)validateIdentityCard:(NSString*)identityCard;
/**
 *  正则判断邮箱
 */
+ (BOOL)validateEmail:(NSString*)email;
+ (BOOL)checkUsername:(NSString*)userName;
/**
 *  判断支付宝
 */
+ (BOOL)iszhifubao:(NSString*)str_zhifubao;
/**
 *  字符串换行计算高度
 *
 *  @param value    要传的字符串
 *  @param fontSize 字体的大小
 *  @param width    字符串的宽
 *
 *  @return 高度
 */
+ (float)heightForString:(NSString*)value fontSize:(float)fontSize andWidth:(float)width;
+ (float)heightForFontString:(NSString*)value fontSize:(UIFont *)fontSize andWidth:(float)width;
+(BOOL)CheckIsNoAudio;
+(float) getVolumeLevel;

//获取字符串的宽度
+(float) widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height;

@end
