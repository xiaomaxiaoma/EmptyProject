//
//  ComoneObject.m
//  MaCh
//
//  Created by Yan Han on 12-5-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ComoneObject.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation ComoneObject

+ (id)EmptyCheckobj:(id)obj
{
    if ([obj isEqual:[NSNull null]]) {
        return @"";
    }
    else {
        return obj;
    }
}

+ (id)EmptyCheckobjnil:(id)obj
{
    if ([obj isEqual:[NSNull null]]) {
        return @"";
    }
    else if (obj==nil)
    {
        return @"";
    }
    else {
        return obj;
    }
}

+ (BOOL)isPhone:(NSString*)emailString
{ //验证邮箱
    NSString* emailRegEx =
        @" /^([0-9]{11})?$/";
    NSPredicate* regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    return [regExPredicate evaluateWithObject:emailString];
}

+ (BOOL)iszhengwen:(NSString*)emailString
{ //验证是否含有非法字符
    NSString* emailRegEx =
        @"^[0-9a-zA-Z_\u3E00-\u9FA5]+$";

    NSPredicate* regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    return [regExPredicate evaluateWithObject:emailString];
}

//判断字符串长度
+ (NSUInteger)unicodeLengthOfString:(NSString*)text
{
    NSUInteger asciiLength = 0;

    for (NSUInteger i = 0; i < text.length; i++) {

        unichar uc = [text characterAtIndex:i];

        asciiLength += isascii(uc) ? 1 : 2;
    }

    NSUInteger unicodeLength = asciiLength / 2;

    if (asciiLength % 2) {
        unicodeLength++;
    }

    return unicodeLength;
}
+ (NSString*)datetostring:(NSDate*)datetime //获取当前时间
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate* date1 = datetime;
    NSString* str = [[formatter stringFromDate:date1] substringToIndex:10];

    return str;
}



+ (NSDate*)stringtodate:(NSString*)datetime
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate* str = [formatter dateFromString:datetime];

    return str;
}

+ (NSString*)datetostringss:(NSDate*)datetime //获取当前时间
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate* date1 = datetime;
    NSString* str = [formatter stringFromDate:date1];

    return str;
}

+ (NSString*)getNowTime //获取当前时间
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate* date1 = [NSDate date];
    NSString* str = [formatter stringFromDate:date1];

    return str;
}
+ (NSString*)getNowTimeYM //获取当前时间
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate* date1 = [NSDate date];
    NSString* str = [formatter stringFromDate:date1];

    return str;
}


- (BOOL)checknum:(NSString*)str
{
    NSString* emailRegEx =
        @"^(0|[1-9][0-9]*)$";

    NSPredicate* regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    return [regExPredicate evaluateWithObject:str];
}

+ (BOOL)isAvailableEmail:(NSString*)emailString
{ //验证邮箱
    NSString* emailRegEx =
        @"(?:[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
        @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
        @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
        @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
        @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
        @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
        @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";

    NSPredicate* regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    return [regExPredicate evaluateWithObject:emailString];
}

- (NSString*)RuturnJiesanTime:(NSString*)jiesantime now:(NSString*)nowtime
{
    // NSString * birthdate=[dicuser valueForKey:@"Birthday"];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    //NSDate *loctime = [formatter dateFromString:jiesantime];

    NSDate* jietime = [formatter dateFromString:jiesantime];
    NSDate* nowtim = [formatter dateFromString:nowtime];
    NSTimeInterval jinguo = [nowtim timeIntervalSinceDate:jietime] * 1;

    NSDate* nowt = [NSDate new];
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:7 * 24 * 60 * 60];
    NSTimeInterval toal = [dat timeIntervalSinceDate:nowt] * 1;

    NSTimeInterval cha = toal - jinguo;
    NSString* timeString = @"";
    if (cha / 3600 < 1) {
        timeString = [NSString stringWithFormat:@"%f", cha / 60];
        timeString = [timeString substringToIndex:timeString.length - 7];
        timeString = [NSString stringWithFormat:@"%@分钟后", timeString];
    }
    if (cha / 3600 > 1 && cha / 86400 < 1) {
        timeString = [NSString stringWithFormat:@"%f", cha / 3600];
        timeString = [timeString substringToIndex:timeString.length - 7];
        timeString = [NSString stringWithFormat:@"%@小时后", timeString];
    }
    if (cha / 86400 > 1) {
        timeString = [NSString stringWithFormat:@"%f", cha / 86400];
        timeString = [timeString substringToIndex:timeString.length - 5];
        timeString = [NSString stringWithFormat:@"%@天后", timeString];
    }

    return timeString;
}


+ (NSString*)RuturnTimeBefore:(NSString*)jiesantime
{

    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    //NSDate *loctime = [formatter dateFromString:jiesantime];

    NSDate* jietime = [formatter dateFromString:jiesantime];
    NSDate* nowtim = [NSDate new];

    NSTimeInterval cha = [nowtim timeIntervalSinceDate:jietime] * 1;

    NSString* timeString = @"";
    if (cha/60<5)
    {
        timeString=@"刚刚";
    }
    else if (cha / 3600 < 1)
    {
        timeString = [NSString stringWithFormat:@"%f", cha / 60];
        timeString = [timeString substringToIndex:timeString.length - 7];
        timeString = [NSString stringWithFormat:@"%d分钟前", [timeString intValue]];
    }
    
   else if (cha / 3600 > 1 && cha / 86400 < 1) {
        timeString = [NSString stringWithFormat:@"%f", cha / 3600];
        timeString = [timeString substringToIndex:timeString.length - 7];
        timeString = [NSString stringWithFormat:@"%d小时前", [timeString intValue]];
    }
    else if (cha / 86400 > 1) {
        timeString = [NSString stringWithFormat:@"%f", cha / 86400];
        timeString = [timeString substringToIndex:timeString.length - 5];
        timeString = [NSString stringWithFormat:@"%d天前", [timeString intValue]];
    }
//
//    if ([timeString isEqualToString:@"0分钟前"]) {
//        timeString = @"刚刚";
//    }

    return timeString;
}


+ (NSString*)RuturnTimeSJCBefore:(NSString*)jiesantime //时间戳返回
{

    NSDate* jietime = [NSDate dateWithTimeIntervalSince1970:[jiesantime doubleValue]];
    NSDate* nowtim = [NSDate new];

    NSTimeInterval cha = [nowtim timeIntervalSinceDate:jietime] * 1;

    NSString* timeString = @"";
    if (cha/60<5)
    {
        timeString=@"刚刚";
    }
    else if (cha / 3600 < 1) {
        timeString = [NSString stringWithFormat:@"%f", cha / 60];
        timeString = [timeString substringToIndex:timeString.length - 7];
        timeString = [NSString stringWithFormat:@"%d分钟前", [timeString intValue]];
    }
    else if (cha / 3600 > 1 && cha / 86400 < 1) {
        timeString = [NSString stringWithFormat:@"%f", cha / 3600];
        timeString = [timeString substringToIndex:timeString.length - 7];
        timeString = [NSString stringWithFormat:@"%d小时前", [timeString intValue]];
    }
   else if (cha / 86400 > 1) {
        timeString = [NSString stringWithFormat:@"%f", cha / 86400];
        timeString = [timeString substringToIndex:timeString.length - 5];
        timeString = [NSString stringWithFormat:@"%d天前", [timeString intValue]];
    }

    return timeString;
}

+ (NSInteger)RuturnCaiPiaoTime:(NSString*)jiesantime //时间戳返回
{
    NSDate* jietime = [NSDate dateWithTimeIntervalSince1970:[jiesantime doubleValue]];
    NSDate* nowtim = [NSDate new];
    NSTimeInterval cha = [jietime timeIntervalSinceDate:nowtim] * 1;

    return cha;
}

+ (NSString*)RuturnCaiPiao:(NSString*)jiesantime //时间戳返回
{
  // jiesantime =  @"1482809221";
    
    NSDate* jietime = [NSDate dateWithTimeIntervalSince1970:[jiesantime doubleValue]];
    NSDate* nowtim = [NSDate new];
    
    NSTimeInterval cha = [jietime timeIntervalSinceDate:nowtim] * 1;
    
    NSString* timeString = @"";
    
    if (cha/60<=0)
    {
        timeString=@"已截止";
    }else
    if (cha/60<5)
    {
        timeString=@"1分钟后截止";
    }
    else if (cha / 3600 < 1)
    {
        timeString = [NSString stringWithFormat:@"%f", cha / 60];
        timeString = [timeString substringToIndex:timeString.length - 7];
        timeString = [NSString stringWithFormat:@"%d分钟后截止", [timeString intValue]];
    }
    else if (cha / 3600 > 1 && cha / 86400 < 1) {
        timeString = [NSString stringWithFormat:@"%f", cha / 3600];
        timeString = [timeString substringToIndex:timeString.length - 7];
        timeString = [NSString stringWithFormat:@"%d小时后截止", [timeString intValue]];
    }
    else if (cha / 86400 > 1)
    {
        timeString = [NSString stringWithFormat:@"%f", cha / 86400];
        timeString = [timeString substringToIndex:timeString.length - 5];
        timeString = [NSString stringWithFormat:@"%d天后截止", [timeString intValue]];
    }
    
    return timeString;
}




+ (NSString*)DataTimeToJintian:(NSString*)time // 处理今天的时间
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate* created_date = [formatter dateFromString:time];

    //NSDate *created_date = [formatter dateFromString:time];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    [formatter setDateFormat:@"MM-dd HH:mm"];
    NSString* strDate = [formatter stringFromDate:created_date];
    [formatter setDateFormat:@"MM-dd"];
    NSString* date1 = [formatter stringFromDate:created_date];
    NSString* date2 = [formatter stringFromDate:[NSDate date]];
    if ([date1 isEqualToString:date2]) {
        [formatter setDateFormat:@"HH:mm"];
        strDate = [formatter stringFromDate:created_date];
        strDate = [NSString stringWithFormat:@"%@ %@", @"今天", strDate];
    }

    return strDate;
}



+ (NSString*)DataTime_ToWeek:(NSString*)time //yyyy - mm -dd 时间处理
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:time];

    NSDateFormatter* matchTimeFormatter = [[NSDateFormatter alloc] init];
    [matchTimeFormatter setDateFormat:@"HH:mm"];
    NSString* str1 = [matchTimeFormatter stringFromDate:date];

    return str1;
}
+ (NSString*)DataTimeToDate:(NSString*)timeString
{
    NSDateFormatter* matchTimeFormatter = [[NSDateFormatter alloc] init];
    [matchTimeFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* matchTimeString = [matchTimeFormatter stringFromDate:date];

    return matchTimeString;
}

+ (NSString*)DataTimeToDateMd:(NSString*)timeString
{
    NSDate* date = [self stringtodate:timeString]; //[NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];

    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* comps;
    comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)

                        fromDate:date];

    NSInteger month = [comps month];

    NSInteger day = [comps day];

    //    NSLog(@"year:%d month: %d, day: %d", year, month, day);

    return [NSString stringWithFormat:@"%li月%li日", (long)month, (long)day];
}

+ (NSString *)times:(NSString *)time_s{
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *  senddate=[NSDate date];
    //结束时间
    NSDate *endDate = [dateFormatter dateFromString:time_s];
    //当前时间
    NSDate *senderDate = [dateFormatter dateFromString:[dateFormatter stringFromDate:senddate]];
    //得到相差秒数
    NSTimeInterval time=[endDate timeIntervalSinceDate:senderDate];
    
    int days=((int)time)/(3600*24);
    int hours=((int)time)%(3600*24)/3600;
    int minute=(((int)time)%(3600*24)/60)%60;
    
    NSString *str_time = nil;
    
    if (days <= 0&&hours <= 0&&minute <= 0)
        str_time=@"0天0小时0分钟";
    else{
        str_time=[[NSString alloc] initWithFormat:@"%i天%i小时%i分钟",days,hours,minute];
    }
    return str_time;
}

//和当前时间做比较 返回时间差
+(int)compareTimeSinceNow:(NSString *)comparetime
{
    NSDate * date=[NSDate dateWithTimeIntervalSince1970:[comparetime doubleValue]];
    return [date timeIntervalSinceNow];
    
}

+ (NSString*)timeConversion:(NSString*)str style:(NSString*)styleTime
{
    long long time = [str longLongValue];
    NSDate* date = nil;
    //    if (str.length > 10)
    //    {
    //        date = [NSDate dateWithTimeIntervalSince1970: time/1000];
    //    }else
    //    {
    date = [NSDate dateWithTimeIntervalSince1970:time];
    // }

    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];

    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];

    /**
     * yyyy 代表的是年 MM 月 dd日
     */
    //[formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss EEEE"];

    if ([styleTime isEqualToString:@"1"]) {
        [formatter setDateFormat:@"MM/dd HH:mm"];
    }
    else if ([styleTime isEqualToString:@"2"]) {
        [formatter setDateFormat:@"MM月dd日 EE"];
    }
    else if ([styleTime isEqualToString:@"3"]) {
        [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    }
    else if ([styleTime isEqualToString:@"4"]) {
        [formatter setDateFormat:@"d"];
    }
    else if ([styleTime isEqualToString:@"5"]) {
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    }
    else if ([styleTime isEqualToString:@"6"]) {
        [formatter setDateFormat:@"赛前 HH-mm"];
    }
    else if ([styleTime isEqualToString:@"7"]) {
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }else if ([styleTime isEqualToString:@"8"]){
    [formatter setDateFormat:@"yyyy-MM-dd"];
        
    }else if ([styleTime isEqualToString:@"9"]) {
        
        [formatter setDateFormat:@"HH:mm"];
    }else if ([styleTime isEqualToString:@"10"]) {
        
        [formatter setDateFormat:@"yy-MM-dd"];
    }else if ([styleTime isEqualToString:@"11"]){
    
        [formatter setDateFormat:@"MM-dd HH:mm"];
    }else if ([styleTime isEqualToString:@"12"]){
        
        [formatter setDateFormat:@"yyyy年MM月dd日"];
    }

    NSString* dateStr1 = [formatter stringFromDate:date];

    return dateStr1;
}

+ (NSString*)timeCompare:(NSString*)str_data_1 timeCompareTwo:(NSString*)str_data_2
{

    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //创建了两个日期对象
    NSDate* date1 = [dateFormatter dateFromString:str_data_1];
    NSDate* date2 = [dateFormatter dateFromString:str_data_2];
    //NSDate *date=[NSDate date];
    //NSString *curdate=[dateFormatter stringFromDate:date];
    //取两个日期对象的时间间隔：
    //这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:typedef double NSTimeInterval;
    NSTimeInterval time = [date2 timeIntervalSinceDate:date1];
    int hour = ((int)time) / (3600);
    int minutes = (((int)time) - hour * 3600) / 60;
    // int abs(int i);

    //int seconds = ((int)time) - hour*3600-minutes*60;
    NSString* dateContent = [[NSString alloc] initWithFormat:@"赛前 %dh %dm", abs(hour), abs(minutes)];

    return dateContent;
}

+ (NSString*)StringtimeConversion:(NSString*)str style:(NSString*)styleTime
{
    if (str.length==0)
    {
        return @"";
    }

    NSDate* date = nil;
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    date = [formatter dateFromString:str];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    NSDateFormatter* matchTimeFormatter = [[NSDateFormatter alloc] init];
    /**
     * yyyy 代表的是年 MM 月 dd日
     */
    //[formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss EEEE"];

    if ([styleTime isEqualToString:@"1"]) {
        [matchTimeFormatter setDateFormat:@"MM/dd HH:mm"];
    }
    else if ([styleTime isEqualToString:@"2"]) {
        [matchTimeFormatter setDateFormat:@"MM月dd日 EE"];
    }
    else if ([styleTime isEqualToString:@"3"]) {
        [matchTimeFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    }
    else if ([styleTime isEqualToString:@"4"]) {
        [matchTimeFormatter setDateFormat:@"dd"];
    }
    else if ([styleTime isEqualToString:@"5"]) {
        [matchTimeFormatter setDateFormat:@"MM-dd HH:mm"];
    }
    else if ([styleTime isEqualToString:@"6"])
    {
        [matchTimeFormatter setDateFormat:@"HH:mm"];
    }
    else if ([styleTime isEqualToString:@"7"]) {
        [matchTimeFormatter setDateFormat:@"MM-dd"];
    }else if ([styleTime isEqualToString:@"8"]) {
        [matchTimeFormatter setDateFormat:@"yyyy-MM-dd"];
    }else if ([styleTime isEqualToString:@"9"]) {
    
        [matchTimeFormatter setDateFormat:@"MM月yyyy年"];
    }
    else if ([styleTime isEqualToString:@"10"]) {
        
        [matchTimeFormatter setDateFormat:@"yy-MM-dd"];
    } if ([styleTime isEqualToString:@"11"]) {
        
        [matchTimeFormatter setDateFormat:@"yy/MM/dd"];
    }
    NSString* dateStr1 = [matchTimeFormatter stringFromDate:date];

    return dateStr1;
}

+ (NSString*)getWeekByNumDate:(NSString*)timeString
{
    NSDate* date = [self stringtodate:timeString]; //[NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
 
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* comps;
    comps = [calendar components:(NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit)
                        fromDate:date];
    //NSInteger week = [comps week]; // 今年的第几周
    NSInteger weekday = [comps weekday]; // 星期几（注意，周日是“1”，周一是“2”。。。。）
    //NSInteger weekdayOrdinal = [comps weekdayOrdinal]; // 这个月的第几周

    NSString* weekStr;
    if (weekday == 1) {
        weekStr = @"周日";
    }
    else if (weekday == 2) {
        weekStr = @"周一";
    }
    else if (weekday == 3) {
        weekStr = @"周二";
    }
    else if (weekday == 4) {
        weekStr = @"周三";
    }
    else if (weekday == 5) {
        weekStr = @"周四";
    }
    else if (weekday == 6) {
        weekStr = @"周五";
    }
    else if (weekday == 7) {
        weekStr = @"周六";
    }

    return weekStr;
}

+ (NSString*)DataTimeToDateGuess:(NSString*)time // 处理今天的时间
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate* created_date = [formatter dateFromString:time];

    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* comps;
    //    comps =[calendar components:(NSWeekCalendarUnit | NSWeekdayCalendarUnit |NSWeekdayOrdinalCalendarUnit)
    //                       fromDate:created_date];
    //    comps =[calendar components:(NSWeekCalendarUnit | NSWeekdayCalendarUnit |NSWeekdayOrdinalCalendarUnit)
    //                       fromDate:date];
    comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit)

                        fromDate:created_date];

    NSInteger month = [comps month];

    NSInteger day = [comps day];

    NSInteger week = [comps week];

    NSString* weekStr;
    if (week == 1) {
        weekStr = @"周日";
    }
    else if (week == 2) {
        weekStr = @"周一";
    }
    else if (week == 3) {
        weekStr = @"周二";
    }
    else if (week == 4) {
        weekStr = @"周三";
    }
    else if (week == 5) {
        weekStr = @"周四";
    }
    else if (week == 6) {
        weekStr = @"周五";
    }
    else {
        weekStr = @"周六";
    }

    return [NSString stringWithFormat:@"%li 月%li 日  %@", (long)month, (long)day, weekStr];
}
/**
 *  时间比较大小
 *
 *  @param timeOne 较早时间 比如2014-02-02  // 关盘时间
 *  @param timeTwo 较晚时间 比如2015-05-05  // 当前时间
 *
 *  @return 如果是较早时间的话返回的是yes
 */
+ (BOOL)DataTimeCompareTime:(NSString*)timeOne SecondTime:(NSString*)timeTwo
{
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeOne doubleValue]];
    NSDate* date1 = [NSDate dateWithTimeIntervalSince1970:[timeTwo doubleValue]];
    if ([[date earlierDate:date1] isEqualToDate:date]) {
        return YES;
    }
    else {
        return NO;
    }
}

+ (BOOL)DateTimeCompareTime:(NSString*)timeOne ServiceTime:(NSString*)timeTwo
{
    NSDate* date = [self stringtodate:timeOne]; //比赛时间
    NSDate* date1 = [NSDate dateWithTimeIntervalSince1970:[timeTwo doubleValue]]; //
    if ([[date earlierDate:date1] isEqualToDate:date]) {
        return YES;
    }
    else {
        return NO;
    }
}

+ (void)setUnifyFlag:(NSString*)unifyFlag UnifyKey:(NSString*)key
{
    [[NSUserDefaults standardUserDefaults] setObject:unifyFlag forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (NSString*)getUnifyKey:(NSString*)key
{
    NSString* str = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    return str;
}

+ (void)setZRFlag:(NSMutableArray*)array ZRKey:(NSString*)key
{
    [[NSUserDefaults standardUserDefaults] setObject:array forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (NSMutableArray*)getZRKey:(NSString*)key
{
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+ (void)exChangeOut:(UIView*)changeOutView dur:(CFTimeInterval)dur
{

    CAKeyframeAnimation* animation;

    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];

    animation.duration = dur;

    //animation.delegate = self;

    animation.removedOnCompletion = NO;

    animation.fillMode = kCAFillModeForwards;

    NSMutableArray* values = [NSMutableArray array];

    for (int m = 0; m<10; m++)
    {
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale((m+1)*0.1,(m+1)*0.1,(m+1)*0.1)]];
    }
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1,1.1,1.1)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2,1.2,1.2)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.3,1.3,1.3)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2,1.2,1.2)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1,1.1,1.1)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0,1.0,1.0)]];

    animation.values = values;

    animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];

    [changeOutView.layer addAnimation:animation forKey:nil];
}
+ (void)exChangeDisappear:(UIView*)disappearView dur:(CFTimeInterval)time
{

    CAKeyframeAnimation* animation;

    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];

    animation.duration = time;

    //animation.delegate = self;

    animation.removedOnCompletion = NO;

    animation.fillMode = kCAFillModeForwards;

    NSMutableArray* values = [NSMutableArray array];

    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];

    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 0.8)]];

    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.6, 0.6, 0.6)]];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.4, 0.4, 0.4)]];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.2, 0.2, 0.2)]];

    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 0.0)]];

    animation.values = values;

    animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];

    [disappearView.layer addAnimation:animation forKey:nil];
    
}

//压缩图片
+ (UIImage*)createThumbImage:(UIImage *)image size:(CGSize )thumbSize percent:(float)percent toPath:(NSString *)thumbPath
{
    
    CGSize imageSize = image.size;
    
    CGFloat width = imageSize.width;
    
    CGFloat height = imageSize.height;
    
    CGFloat scaleFactor = 0.0;
    
    CGPoint thumbPoint = CGPointMake(0.0,0.0);
    
    CGFloat widthFactor = thumbSize.width / width;
    
    CGFloat heightFactor = thumbSize.height / height;
    
    if (widthFactor > heightFactor)  {
        
        scaleFactor = widthFactor;
    }
    
    else {
        
        scaleFactor = heightFactor;
        
    }
    
    CGFloat scaledWidth  = width * scaleFactor;
    
    CGFloat scaledHeight = height * scaleFactor;
    
    if (widthFactor > heightFactor)
        
    {
        thumbPoint.y = (thumbSize.height - scaledHeight) * 0.5;
        
        
    }
    
    else if (widthFactor < heightFactor)
        
    {
        thumbPoint.x = (thumbSize.width - scaledWidth) * 0.5;
    }
    UIGraphicsBeginImageContext(thumbSize);
    
    CGRect thumbRect = CGRectZero;
    
    thumbRect.origin = thumbPoint;
    
    thumbRect.size.width  = scaledWidth;
    
    thumbRect.size.height = scaledHeight;
    
    [image drawInRect:thumbRect];
    
    UIImage *thumbImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    NSData *thumbImageData = UIImageJPEGRepresentation(thumbImage, percent);
    
    [thumbImageData writeToFile:thumbPath atomically:NO];
    
    return thumbImage;
    
}

/**
 *  图片自动等比缩放
 */
+ (UIImage*)thumbnailWithImageWithoutScale:(UIImage*)image size:(CGSize)asize

{

    UIImage* newimage;

    if (nil == image) {

        newimage = nil;
    }

    else {

        CGSize oldsize = image.size;

        CGRect rect;

        if (asize.width / asize.height > oldsize.width / oldsize.height) {

            rect.size.width = asize.height * oldsize.width / oldsize.height;

            rect.size.height = asize.height;

            rect.origin.x = (asize.width - rect.size.width) / 2;

            rect.origin.y = 0;
        }

        else {

            rect.size.width = asize.width;

            rect.size.height = asize.width * oldsize.height / oldsize.width;

            rect.origin.x = 0;

            rect.origin.y = (asize.height - rect.size.height) / 2;
        }

        UIGraphicsBeginImageContext(asize);

        CGContextRef context = UIGraphicsGetCurrentContext();

        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);

        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));

        [image drawInRect:rect];

        newimage = UIGraphicsGetImageFromCurrentImageContext();

        UIGraphicsEndImageContext();
    }

    return newimage;
}

+ (long long)changeTimeToTimeSp:(NSString*)timeStr
{
    long long time;
    NSDateFormatter* format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* fromdate = [format dateFromString:timeStr];
    time = (long long)[fromdate timeIntervalSince1970] - 60;
    return time;
}
// 正则判断手机号码地址格式
+ (BOOL)isMobileNumber:(NSString*)mobileNum
{
    NSString* regex = @"^((13[0-9])|(14[0-9])|(17[0-9])|(15[^4,\\D])|(18[0-9]))\\d{8}$";
    NSPredicate* pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:mobileNum];
    if (isMatch == YES) {
        return YES;
    }
    else {
        return NO;
    }
}
+ (BOOL)validateEmail:(NSString*)email
{ //[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}
    //NSString* emailRegex = @"^([a-zA-Z0-9]+[-_]?[a-zA-Z0-9]+)+@([a-zA-Z0-9]+[-_]?[a-zA-Z0-9]+)+[\\.][A-Za-z]{2,3}([\\.][A-Za-z]{2})?$";
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+(BOOL)ValidateURL:(NSString *)strurl
{
    //不能使用
    NSString* emailRegex = @"^(?:(?:http|ftp|https):\\/\\/)[-\\w.]+(?:\\/[-\\w]+)*\\$";
    //NSString* emailRegex = @"//b((\\w-]+://?|www[.])[^\\s()<>]+(?:\\([\\w\\d]+\\)|([^[:punct:]\\s]|/)))";
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:strurl];
}

//身份证号
+ (BOOL)validateIdentityCard:(NSString*)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString* regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate* identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}
//以字母开头，只能包含“字母”，“数字”，“下划线”，长度6~18
+ (BOOL)isValidatePassword:(NSString*)pwd
{
    NSString* pwdRegex = @"^[a-zA-Z][a-zA-Z0-9_]{6,18}$";
    NSPredicate* pwdTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", pwdRegex];
    return [pwdTest evaluateWithObject:pwd];
}
//[\u4e00-\u9fa5]
+ (BOOL)checkUsername:(NSString*)userName
{
    NSString* regex = @"^[\u4E00-\u9FA5]{1,13}$";
    NSPredicate* pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:userName];
    return isMatch;
}
+ (BOOL)iszhifubao:(NSString*)str_zhifubao
{

    NSString* regex = @"^[A-Za-z0-9]+$";
    NSPredicate* pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:str_zhifubao];
    if (isMatch == NO) {
        isMatch = [self validateEmail:str_zhifubao];
    }

    return isMatch;
}

+ (void)exChangeOut:(UIView*)changeOutView dur:(CFTimeInterval)dur type:(NSString*)str disappearView:(UIView*)disView
{
    CAKeyframeAnimation* animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = dur;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray* values = [NSMutableArray array];
    if ([str isEqualToString:@"1"]) {
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    }
    else {
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.6, 0.6, 0.6)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.3, 0.3, 0.3)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 0.1)]];
    }

    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    [changeOutView.layer addAnimation:animation forKey:nil];

    if ([str isEqualToString:@"2"]) {
        [self performSelector:@selector(removeThisView:) withObject:disView afterDelay:dur];
    }
}

+ (void)removeThisView:(UIView*)view
{
//    [view removeFromSuperview];
//    HZSorceObj* hzsonj = [HZSorceObj sharedManager];
//    [hzsonj End];
}

//GK：门将
//D1：后卫
//D2：后卫
//DM：中场
//AM：中场
//A：前锋
//M：中场
+ (NSString*)positionForMF:(NSString*)positions
{

    NSString* strPositions = nil;

    if ([positions isEqualToString:@"GK"]) {
        strPositions = @"门将";
    }
    else if ([positions isEqualToString:@"D1"]) {
        strPositions = @"后卫";
    }
    else if ([positions isEqualToString:@"D2"]) {
        strPositions = @"后卫";
    }
    else if ([positions isEqualToString:@"DM"]) {
        strPositions = @"后腰";
    }
    else if ([positions isEqualToString:@"AM"]) {
        strPositions = @"前腰";
    }
    else if ([positions isEqualToString:@"A"]) {
        strPositions = @"前锋";
    }
    else if ([positions isEqualToString:@"M"]) {
        strPositions = @"中场";
    }
    else
    {
      strPositions = @"";
    }

    return strPositions;
}

+ (NSString*)getDeviceAndOSInfo
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString* deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    NSArray* modelArray = @[
                            
                            @"i386",
                            @"x86_64",
                            
                            @"iPhone1,1",
                            @"iPhone1,2",
                            @"iPhone2,1",
                            @"iPhone3,1",
                            @"iPhone3,2",
                            @"iPhone3,3",
                            @"iPhone4,1",
                            @"iPhone5,1",
                            @"iPhone5,2",
                            @"iPhone5,3",
                            @"iPhone5,4",
                            @"iPhone6,1",
                            @"iPhone6,2",
                            
                            @"iPod1,1",
                            @"iPod2,1",
                            @"iPod3,1",
                            @"iPod4,1",
                            @"iPod5,1",
                            
                            @"iPad1,1",
                            @"iPad2,1",
                            @"iPad2,2",
                            @"iPad2,3",
                            @"iPad2,4",
                            @"iPad3,1",
                            @"iPad3,2",
                            @"iPad3,3",
                            @"iPad3,4",
                            @"iPad3,5",
                            @"iPad3,6",
                            
                            @"iPad2,5",
                            @"iPad2,6",
                            @"iPad2,7",
                            @"iPhone7,1",
                            @"iPhone7,2",
                            @"iPhone8,1",
                            @"iPhone8,2",
                            @"iPhone9,1",
                            @"iPhone9,2"
                            ];
    NSArray* modelNameArray = @[
                                
                                @"iPhone Simulator",
                                @"iPhone Simulator",
                                
                                @"iPhone 2G",
                                @"iPhone 3G",
                                @"iPhone 3GS",
                                @"iPhone 4(GSM)",
                                @"iPhone 4(GSM Rev A)",
                                @"iPhone 4(CDMA)",
                                @"iPhone 4S",
                                @"iPhone 5(GSM)",
                                @"iPhone 5(GSM+CDMA)",
                                @"iPhone 5c(GSM)",
                                @"iPhone 5c(Global)",
                                @"iphone 5s(GSM)",
                                @"iphone 5s(Global)",
                                
                                @"iPod Touch 1G",
                                @"iPod Touch 2G",
                                @"iPod Touch 3G",
                                @"iPod Touch 4G",
                                @"iPod Touch 5G",
                                @"iPad",
                                @"iPad 2(WiFi)",
                                @"iPad 2(GSM)",
                                @"iPad 2(CDMA)",
                                @"iPad 2(WiFi + New Chip)",
                                @"iPad 3(WiFi)",
                                @"iPad 3(GSM+CDMA)",
                                @"iPad 3(GSM)",
                                @"iPad 4(WiFi)",
                                @"iPad 4(GSM)",
                                @"iPad 4(GSM+CDMA)",
                                
                                @"iPad mini (WiFi)",
                                @"iPad mini (GSM)",
                                @"ipad mini (GSM+CDMA)",
                                @"iphone6 plus",
                                @"iphone6",
                                @"iphone6s",
                                @"iphone6s plus",
                                @"iphone7",
                                @"iphone7 plus"
                                ];
    NSInteger modelIndex = -1;
    NSString* modelNameString = @"iPhone";
    modelIndex = [modelArray indexOfObject:deviceString];
    if (modelIndex >= 0 && modelIndex < [modelNameArray count]) {
        modelNameString = [modelNameArray objectAtIndex:modelIndex];
    }
    return modelNameString;
}


// 从view 页面进入 UIViewController页面
+ (void)pushNextUIViewController:(UIViewController*)viewController myView:(UIView*)views
{

    id object = [views nextResponder];

    while (![object isKindOfClass:[UIViewController class]] &&

        object != nil) {

        object = [object nextResponder];
    }

    UIViewController* uc = (UIViewController*)object;

    [uc.navigationController pushViewController:viewController animated:YES];
    //return nil;
}

// 从view 页面进入 UIViewController页面
+ (void)presentModalViewController:(UIViewController*)viewController myView:(UIView*)views
{

    id object = [views nextResponder];

    while (![object isKindOfClass:[UIViewController class]] &&

        object != nil) {

        object = [object nextResponder];
    }

    UIViewController* uc = (UIViewController*)object;
    [uc.navigationController presentViewController:viewController animated:YES completion:nil];
    //return nil;
}

+ (float)heightForString:(NSString*)value fontSize:(float)fontSize andWidth:(float)width
{
    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping]; //此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return sizeToFit.height;
}

+ (float)heightForFontString:(NSString*)value fontSize:(UIFont *)fontSize andWidth:(float)width
{
    CGSize sizeToFit = [value sizeWithFont:fontSize constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping]; //此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return sizeToFit.height;
}
+ (BOOL)nicheng:(NSString *)mynicheng
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{2,16}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:mynicheng];
}

/**
 *  判断是否是静音
 */
+(BOOL)CheckIsNoAudio
{
    CFStringRef route;
    UInt32 routeSize = sizeof(CFStringRef);
    
//    OSStatus status = AudioSessionGetProperty(kAudioSessionProperty_AudioRoute, &routeSize, &route);
//    if (status == kAudioSessionNoError)
//    {
//        if (route == NULL || !CFStringGetLength(route))
//            return TRUE;
//    }
    
    return FALSE;
}

+(float) getVolumeLevel
{  MPVolumeView*slide =[MPVolumeView new];
    UISlider*volumeViewSlider;
    for(UIView*view in[slide subviews])
    {
      if([[[view class] description] isEqualToString:@"MPVolumeSlider"])
      {
       volumeViewSlider =(UISlider*) view;
      }
    }
    float val =[volumeViewSlider value];
    return val;
}
//获取字符串的宽度
+(float) widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height
{
    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(CGFLOAT_MAX, height) lineBreakMode:NSLineBreakByWordWrapping];//此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return sizeToFit.width;
}

@end
