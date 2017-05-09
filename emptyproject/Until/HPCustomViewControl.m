//
//  HPCustomViewControl.m
//  FootballCube
//
//  Created by duanzhaoyang on 14-9-1.
//  Copyright (c) 2014年 duanzhaoyang. All rights reserved.
//

#import "HPCustomViewControl.h"

@implementation HPCustomViewControl
+ (UILabel*)createNavTitleView:(NSString*)title wordsFont:(float)fontNum
{

    UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.text = title;
    label.font = [UIFont systemFontOfSize:fontNum];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    [label sizeToFit];
    return label;
}

+ (UIBarButtonItem*)createNavigationBackButtionAction:(SEL)action target:(id)target
{

    UIButton* customButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 12, 20)];
    [customButton setBackgroundImage:[UIImage imageNamed:@"btnback"] forState:UIControlStateNormal];
    //[customButton setBackgroundImage:[UIImage imageNamed:@"Back_s"] forState:UIControlStateHighlighted];
    customButton.backgroundColor = [UIColor yellowColor];
    UIBarButtonItem* barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customButton];
    [customButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    return barButtonItem;
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
    NSString* dateStr1 = [formatter stringFromDate:date];

    return dateStr1;
}

//判断邮箱
+ (BOOL)validateEmail:(NSString*)candidate
{

    // NSString* regex = @"^[A-Za-z0-9._%+-]+@[A-Za-z0-9._%+-]+\\.[A-Za-z0-9._%+-]+$";
    NSString* emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:candidate];
}

@end
