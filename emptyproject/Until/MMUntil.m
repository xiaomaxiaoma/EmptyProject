//
//  MMUntil.m
//  Universitystudent
//
//  Created by XuMing on 13-12-8.
//  Copyright (c) 2013年 XuMing. All rights reserved.
//

#import "MMUntil.h"
#import <QuartzCore/QuartzCore.h>
//#import "HZRecomModel.h"
#import "iToast.h"
//#import "Score.pb.h"
@implementation MMUntil

+ (void)showMessage:(NSString *)msg Type:(int)type
{
//    if (msg.length > 0) {
//        if (type == 0) {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
//                                                            message:msg
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"确定"
//                                                  otherButtonTitles:nil];
//            [alert show];
//            
//        } else if (type == 1) {
//            iToast *toast = [iToast makeToast:msg];
//            [toast setToastPosition:kToastPositionBottom];
//            [toast setToastDuration:kToastDurationNormal];
//            [toast show];
//            
//        } else if (type == 2) {
//            
//            [SVProgressHUD showErrorWithStatus:msg duration:1];
//            
//        }
//        else if (type == 3) {
//            
//            iToast *toast = [iToast makeToast:msg];
//            [toast setToastPosition:kToastPositionCenter];
//            [toast setToastDuration:kToastDurationShort];
//            [toast show];
//            
//        }
//    }
}


+ (void)showViewAnimate:(UIView*)view andSuccess:(void (^)(id responseObject))success
{
    [UIView animateWithDuration:0.1 animations:^{
        view.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.5, 0.5);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.2 animations:^{
            view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.2, 1.2);
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.1 animations:^{
                view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
            }completion:^(BOOL finished) {
                success(nil);
            }];
        }];
    }];
}

+ (BOOL)isNetworkReachable
{
    //    struct sockaddr_in zeroAddress;
    //    bzero(&zeroAddress, sizeof(zeroAddress));
    //    zeroAddress.sin_len = sizeof(zeroAddress);
    //    zeroAddress.sin_family = AF_INET;
    //    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    //    SCNetworkReachabilityFlags flags;
    //    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    //    CFRelease(defaultRouteReachability);
    //
    //    if (!didRetrieveFlags)
    //    {
    //        return NO;
    //    }
    //
    //    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    //    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    //    return (isReachable && !needsConnection) ? YES : NO;
    return YES;
}

+ (UILabel*)createLabelWithFrame:(CGRect)frame font:(UIFont*)font
{
    UILabel* lbl = [[UILabel alloc] initWithFrame:frame];
    lbl.font = font;
    lbl.backgroundColor = [UIColor clearColor];

    return lbl;
}

+ (UILabel*)createLabelWithFrame:(CGRect)frame font:(UIFont*)font withtext:(NSString*)str
{
    UILabel* lbl = [self createLabelWithFrame:frame font:font];
    lbl.text = str;

    return lbl;
}

+ (UILabel*)createLabelWithFrame:(CGRect)frame font:(UIFont*)font textColor:(UIColor*)color
{
    UILabel* lbl = [self createLabelWithFrame:frame font:font];
    lbl.textColor = color;

    return lbl;
}

+ (UILabel*)createLabelWithFrame:(CGRect)frame font:(UIFont*)font textColor:(UIColor*)color withtext:(NSString*)str

{
    UILabel* lbl = [self createLabelWithFrame:frame font:font];
    lbl.textColor = color;
    lbl.text = str;

    return lbl;
}

+ (UIImageView*)createImageViewWithFrame:(CGRect)frame image:(NSString*)str
{
    UIImageView* imgv = [[UIImageView alloc] initWithFrame:frame];
    imgv.userInteractionEnabled = YES;
    imgv.image = [UIImage imageNamed:str];
    return imgv;
}

+ (UITextView*)createTextViewWithFrame:(CGRect)frame
{
    UITextView* imgv = [[UITextView alloc] initWithFrame:frame];
    imgv.userInteractionEnabled = YES;
    imgv.layer.borderWidth = 1;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace, (CGFloat[]){ 1, 1, 1, 1 });
    imgv.layer.borderColor = colorref;
    
    CGColorRelease(colorref);
    CGColorSpaceRelease(colorSpace);
    return imgv;
}

+ (UITextView*)createTextViewWithFrame:(CGRect)frame withFont:(UIFont*)font
{
    UITextView* tx = [self createTextViewWithFrame:frame];
    tx.font = font;
    return tx;
}

+ (UITextField*)createTextFieldWithFrame:(CGRect)frame
{

    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 5)];
    UITextField* imgv = [[UITextField alloc] initWithFrame:frame];
    imgv.userInteractionEnabled = YES;
    //    imgv.layer.borderWidth=1;
    //    imgv.layer.borderColor=RGBACOLOR(216, 216, 216, 1.0).CGColor;
    imgv.leftView = view;
    imgv.leftViewMode = UITextFieldViewModeAlways;
    imgv.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    imgv.backgroundColor = [UIColor whiteColor];
    return imgv;
}

+ (UITextField*)createTextFieldWithFrame:(CGRect)frame withTag:(NSInteger)tag
{

    UITextField* tx = [self createTextFieldWithFrame:frame];
    tx.tag = tag;
    return tx;
}

+ (UITextField*)createTextFieldWithFrame:(CGRect)frame withFont:(UIFont*)font
{
    UITextField* tx = [self createTextFieldWithFrame:frame];
    tx.font = font;
    return tx;
}

+ (UIButton*)createButtonWithFrame:(CGRect)frame whitbackimg:(NSString*)str withbackimgh:(NSString*)strh wihtTitle:(NSString*)title
{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setBackgroundImage:[UIImage imageNamed:str] forState:UIControlStateNormal];
    if (strh != nil) {
        [btn setBackgroundImage:[UIImage imageNamed:strh] forState:UIControlStateHighlighted];
    }
    [btn setTitle:title forState:UIControlStateNormal];

    return btn;
}

+ (UIButton*)createImgButtonWithFrame:(CGRect)frame whitbackimg:(NSString*)str withbackimgh:(NSString*)strh wihtTitle:(NSString*)title
{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setImage:[UIImage imageNamed:str] forState:UIControlStateNormal];
    if (strh != nil) {
        [btn setImage:[UIImage imageNamed:strh] forState:UIControlStateHighlighted];
    }
    [btn setTitle:title forState:UIControlStateNormal];

    return btn;
}

+ (UILabel*)theAdaptiveLable:(NSString*)str3 spacingCounts:(NSInteger)m spacingCounts:(NSInteger)lenh
{
    UILabel* lable = [[UILabel alloc] init];
    lable.numberOfLines = 0;
    lable.textAlignment = NSTextAlignmentLeft;
    lable.lineBreakMode = NSLineBreakByWordWrapping;
    NSMutableAttributedString* str = [[NSMutableAttributedString alloc] initWithString:str3];
    NSMutableParagraphStyle* paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:m]; //调整行间距
    //设置字的颜色
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:40.0 / 255.0 green:153.0 / 255.0 blue:1.0 / 255.0 alpha:1.0] range:NSMakeRange(0, lenh)];
    [str addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    lable.attributedText = str;
    [lable sizeToFit];
    lable.backgroundColor = [UIColor clearColor];
    return lable;
}
/**
 *   对UILable 显示不同颜色和行高的封装
 *
 *  @param counts     uilable的内容
 *  @param m          行高
 *  @param lineHeight 要显示颜色字体的个数
 *  @param color      要显示的颜色
 *
 *  @return 返回UILable
 */
+ (UILabel*)theAdaptiveLable:(NSString*)counts spacingCounts:(NSInteger)m spacingCounts:(NSInteger)lineHeight colorWords:(UIColor*)color
{
    UILabel* lable = [[UILabel alloc] init];
    lable.numberOfLines = 0;
    lable.textAlignment = NSTextAlignmentLeft;
    lable.lineBreakMode = NSLineBreakByWordWrapping;
    NSMutableAttributedString* str = [[NSMutableAttributedString alloc] initWithString:counts];
    NSMutableParagraphStyle* paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //调整行间距
    [paragraphStyle setLineSpacing:m];
    //设置字的颜色
    [str addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, lineHeight)];
    [str addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    lable.attributedText = str;
    [lable sizeToFit];
    lable.backgroundColor = [UIColor clearColor];
    return lable;
}
/**
 * 自适应lable的高度
 *
 *  @param text    传过来的内容
 *  @param labFont 这个font 要和lable的font 是一致的；
 *  @param wide    这个宽度最好和你定义的lable的宽度一致
 *
 *  @return 高度
 */
+ (CGFloat)contentCellHeightWithText:(NSString*)text lableFont:(UIFont*)labFont
                             labWide:(NSInteger)wide
{
    NSInteger ch;
    UIFont* font = labFont; //11 一定要跟label的显示字体大小一致
    //设置字体
    CGSize size = CGSizeMake(wide, MAXFLOAT); //注：这个宽：300 是你要显示的宽度既固定的宽度，高度可以依照自己的需求而定
    if (SYSTEMVERSION) //IOS 7.0 以上
    {
        NSDictionary* tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
        size = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    }
    else {
        size = [text sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping]; //ios7以上已经摒弃的这个方法
    }
    ch = size.height + 20;
    return ch;
}

/**
 *  画一个button
 *
 *  @param butFrame   button 的大小
 *  @param colorbg    背景颜色
 *  @param colorTouch 按下去的颜色
 *
 *  @return   button
 */

+ (UIButton*)createbuttonWithFrame:(CGRect)frameBtn buttonColorbg:(UIColor*)colorbg buttonColorTouch:(UIColor*)colorTouch WihtSlected:(BOOL)Senected
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frameBtn;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace, (CGFloat[]){ 1, 1, 1, 1 });
    [button.layer setBorderColor:colorref]; //边框颜色
    [button.layer setBorderColor:colorref]; //边框颜色
    CGSize imageSize = CGSizeMake(button.frame.size.width, button.frame.size.height);
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [colorTouch set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage* pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [colorbg set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage* pressedColorImg1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [button setBackgroundImage:pressedColorImg1 forState:UIControlStateNormal];
    if (Senected) {
        [button setBackgroundImage:pressedColorImg forState:UIControlStateSelected];
        //[button setBackgroundImage:pressedColorImg forState:UIControlStateHighlighted];
    }
    else {
        [button setBackgroundImage:pressedColorImg forState:UIControlStateHighlighted];
    }
  
    CGColorRelease(colorref);
    CGColorSpaceRelease(colorSpace);
    
    return button;
}
/**
 *
 *
 *  @param frameBtn
 *  @param colorbg
 *  @param colorTouch
 *  @param Senected
 *
 *  @return
 */
+ (UIButton*)createbuttonWithFrame:(CGRect)frameBtn buttonColorbg:(UIColor*)colorbg buttonColorTouch:(UIColor*)colorTouch
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frameBtn;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace, (CGFloat[]){ 1, 1, 1, 1 });
    [button.layer setBorderColor:colorref]; //边框颜色
    [button.layer setBorderColor:colorref]; //边框颜色
    CGSize imageSize = CGSizeMake(button.frame.size.width, button.frame.size.height);
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [colorTouch set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    //    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
    //    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    //    [colorbg set];
    //    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage* pressedColorImg1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [button setBackgroundImage:pressedColorImg1 forState:UIControlStateNormal];

    //[button setBackgroundImage:pressedColorImg forState:UIControlStateHighlighted];

    CGColorRelease(colorref);
    CGColorSpaceRelease(colorSpace);
    return button;
}

+(UIImage *)CreateImageByColorbg:(UIColor*)colorbg withSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, 0, [UIScreen mainScreen].scale);
    [colorbg set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage* pressedColorImg1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return pressedColorImg1;

}

/**
 *  画一个button
 *
 *  @param butFrame   button 的大小
 *  @param colorbg    背景颜色
 *  @param colorTouch 按下去的颜色
 *  @param m          画圆，圆的半径
 *
 *  @return   button
 */
+ (UIButton*)createbuttonWithFrame:(CGRect)butFrame
                        btnColorbg:(UIColor*)colorbg
                     btnColorTouch:(UIColor*)colorTouch
                          btnRound:(NSInteger)m
{
    UIButton* button = [self createbuttonWithFrame:butFrame buttonColorbg:colorbg buttonColorTouch:colorTouch];
    button.layer.cornerRadius = m;
    button.layer.masksToBounds = YES;

    return button;
}

+ (UIButton*)createbuttonWithFrame:(CGRect)butFrame
                        btnColorbg:(UIColor*)colorbg
                     btnColorTouch:(UIColor*)colorTouch
                          btnRound:(NSInteger)m withSelect:(BOOL)y
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = butFrame;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace, (CGFloat[]){ 1, 1, 1, 1 });
    [button.layer setBorderColor:colorref]; //边框颜色
    [button.layer setBorderColor:colorref]; //边框颜色
    CGSize imageSize = CGSizeMake(button.frame.size.width, button.frame.size.height);
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [colorTouch set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [colorbg set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage* pressedColorImg1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [button setBackgroundImage:pressedColorImg1 forState:UIControlStateNormal];
    
    [button setBackgroundImage:pressedColorImg forState:UIControlStateSelected];

    button.layer.cornerRadius = m;
    button.layer.masksToBounds = YES;
    
    CGColorRelease(colorref);
    CGColorSpaceRelease(colorSpace);

    return button;
}



//创建TextField
//+(UITextField *)CreateTxtFieldEx:(CGRect)rect withTag:(NSInteger)tag
//{
//    UITextFieldEx * txt=[[UITextFieldEx alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, 27)];
//    [txt setPadding:YES top:6 right:35 bottom:12 left:30];
//    txt.borderStyle=UITextBord erStyleNone;
//    txt.backgroundColor = [UIColor clearColor];//这句话生效了
//    //txt.background = [UIImage imageNamedover:@"Mhome_search.png"];
//    txt.contentVerticalAlignment=0;
//    txt.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    //txt.delegate=self;
//    txt.font=[UIFont systemFontOfSize:15.0];
//    txt.tag=tag;
//    return txt;
//}

/**
 *  倒计时
 *
 *  @param matchTimeStr 时间戳
 *
 *  @return %@天%@小时%@分钟
 */
+ (NSString*)timerCountDown:(NSObject*)matchTimeObj
{
    NSString* matchTimeStr = (NSString*)matchTimeObj;
    NSString* cdHoure;
    NSString* cdMin;
    NSCalendar* cal = [NSCalendar currentCalendar]; //定义一个NSCalendar对象
    NSDate* today = [NSDate date]; //得到当前时间
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

    NSDate* todate = [NSDate dateWithTimeIntervalSince1970:[matchTimeStr doubleValue]];

    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* comps;
    comps = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSDayCalendarUnit
                                     | NSMonthCalendarUnit | NSYearCalendarUnit)
                        fromDate:todate];

    unsigned int unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit;
    NSDateComponents* d = [cal components:unitFlags fromDate:today toDate:todate options:0];

    int day = [d day];
    long hour = [d hour];
    long minute = [d minute];

    
    NSLog(@"-----%d---%lu----%lu",day,hour,minute);
    
    
//    if (hour < 10) {
//        if (hour < 0) {
//            hour = 0;
//        }
//        cdHoure = [NSString stringWithFormat:@"0%lu", hour];
//    }
//    else {
//        cdHoure = [NSString stringWithFormat:@"%lu", hour];
//    }
//    if (minute < 10) {
//        if (minute < 0) {
//            minute = 0;
//        }
//        cdMin = [NSString stringWithFormat:@"0%lu", minute];
//    }
//    else {
//        cdMin = [NSString stringWithFormat:@"%lu", minute];
//    }

    return [NSString stringWithFormat:@"%@/%@", cdHoure, cdMin];
}

//+ (NSMutableArray*)parseRecomData:(NSArray*)matchListArray
//{
//    NSMutableArray* myWeekMatchArray = [[NSMutableArray alloc] init];
//    long sectionNum = 0;
//    long myWeekdayOrdinal = 0;
//    for (int i = 0; i < [matchListArray count]; i++) {
//        HZRecomModel* theMatchListArray = [matchListArray objectAtIndex:i];
//        NSString* matchTimeStr = theMatchListArray.match_time;
//        NSDate* date = [ComoneObject stringtodate:matchTimeStr];
//        NSCalendar* calendar = [NSCalendar currentCalendar];
//        NSDateComponents* comps;
//        comps = [calendar components:(NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit)
//                            fromDate:date];
//        NSInteger weekday = [comps weekday]; // 星期几（注意，周日是“1”，周一是“2”。。。。）
//        NSInteger weekdayOrdinal = [comps weekdayOrdinal]; // 这个月的第几周
//        if (i == 0) {
//            myWeekdayOrdinal = weekdayOrdinal;
//            sectionNum = weekday;
//        }
//        if (weekdayOrdinal == myWeekdayOrdinal) {
//            if (weekday == sectionNum) {
//                if ([myWeekMatchArray count] < 1) {
//                    NSMutableArray* newWeeMatchArray = [[NSMutableArray alloc] init];
//                    [newWeeMatchArray addObject:theMatchListArray];
//                    [myWeekMatchArray addObject:newWeeMatchArray];
//                }
//                else {
//                    [[myWeekMatchArray objectAtIndex:[myWeekMatchArray count] - 1] addObject:theMatchListArray];
//                }
//            }
//            else {
//                sectionNum = weekday;
//                NSMutableArray* newWeeMatchArray = [[NSMutableArray alloc] init];
//                [newWeeMatchArray addObject:theMatchListArray];
//                [myWeekMatchArray addObject:newWeeMatchArray];
//            }
//        }
//        else {
//            myWeekdayOrdinal = weekdayOrdinal;
//            sectionNum = weekday;
//            NSMutableArray* newWeeMatchArray = [[NSMutableArray alloc] init];
//            [newWeeMatchArray addObject:theMatchListArray];
//            [myWeekMatchArray addObject:newWeeMatchArray];
//        }
//    }
//
//    return myWeekMatchArray;
//}
//
//
//
//+ (NSMutableArray*)parseData:(NSArray*)matchListArray withSortType:(NSInteger)type
//{
//    NSMutableArray* myWeekMatchArray = [[NSMutableArray alloc] init];
//    NSInteger sectionNum = 0;
//    NSInteger myWeekdayOrdinal = 0;
//    for (int i = 0; i < [matchListArray count]; i++) {
//        HZSorceModel* theMatchListArray = [matchListArray objectAtIndex:i];
//        NSString* matchTimeStr = theMatchListArray.match_time;
//        NSDate* date = [ComoneObject stringtodate:matchTimeStr];
//        NSCalendar* calendar = [NSCalendar currentCalendar];
//        NSDateComponents* comps;
//        comps = [calendar components:(NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit)
//                            fromDate:date];
//        NSInteger weekday = [comps weekday]; // 星期几（注意，周日是“1”，周一是“2”。。。。）
//        NSInteger weekdayOrdinal = [comps weekdayOrdinal]; // 这个月的第几周
//        if (i == 0) {
//            myWeekdayOrdinal = weekdayOrdinal;
//            sectionNum = weekday;
//        }
//        if (weekdayOrdinal == myWeekdayOrdinal) {
//            if (weekday == sectionNum) {
//                if ([myWeekMatchArray count] < 1) {
//                    NSMutableArray* newWeeMatchArray = [[NSMutableArray alloc] init];
//                    [newWeeMatchArray addObject:theMatchListArray];
//                    [myWeekMatchArray addObject:newWeeMatchArray];
//                }
//                else {
//                    [[myWeekMatchArray objectAtIndex:[myWeekMatchArray count] - 1] addObject:theMatchListArray];
//                }
//            }
//            else {
//                sectionNum = weekday;
//                NSMutableArray* newWeeMatchArray = [[NSMutableArray alloc] init];
//                [newWeeMatchArray addObject:theMatchListArray];
//                [myWeekMatchArray addObject:newWeeMatchArray];
//            }
//        }
//        else {
//            myWeekdayOrdinal = weekdayOrdinal;
//            sectionNum = weekday;
//            NSMutableArray* newWeeMatchArray = [[NSMutableArray alloc] init];
//            [newWeeMatchArray addObject:theMatchListArray];
//            [myWeekMatchArray addObject:newWeeMatchArray];
//        }
//    }
//    return myWeekMatchArray;
//}

+ (UILabel*)onLineThingsLable:(CGRect)lableFrame lableTestColor:(UIColor*)lableColor lableTest:(NSString*)str lablebushi:(NSString*)str1 stype:(int)stypelable
{

    UILabel* lable = [[UILabel alloc] initWithFrame:lableFrame];
    if (stypelable == 1) {
        lable.backgroundColor = [UIColor whiteColor];
    }
    else {
        lable.backgroundColor = [Tool hexStringToColor:@"ffcc01" thisAlpha:1.0];
    }
    lable.textColor = lableColor;
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = CONTENT_FONT(9);
    if ([str isEqualToString:@"半场"] || [str isEqualToString:@"完场"] || [str isEqualToString:@"加时"]) {
        lable.text = str;
    }
    else {
        lable.text = [NSString stringWithFormat:@"%@'", str];
    }

    if (str1.length > 0) {
        UILabel* lable1 = [[UILabel alloc] initWithFrame:CGRectMake(13, 1, 15, 7)];

        lable1.backgroundColor = [UIColor clearColor];

        lable1.textColor = lableColor;
        lable1.textAlignment = NSTextAlignmentCenter;
        lable1.font = CONTENT_FONT(6);
        //lable1.text = [NSString stringWithFormat:@"+%@",str1];
        lable1.text = @"+";
        [lable addSubview:lable1];
    }

    return lable;
}
// emoji 添加
+ (NSString*)URLEncodedString:(NSString*)str
{
    NSString* result = (__bridge_transfer NSString*)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
        (CFStringRef)str,
        NULL,
        CFSTR("!*'();:@&=+$,/?%#[]"),
        kCFStringEncodingUTF8);
    //    [result autorelease];
    return result;
}

//emoji 解压
+ (NSString*)URLDecodedString:(NSString*)str
{
    NSString* result = (__bridge_transfer NSString*)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
        (CFStringRef)str,
        CFSTR(""),
        kCFStringEncodingUTF8);
    //    [result autorelease];
    return result;
}

+(NSString*)disable_emoji:(NSString*)text
{
    NSLog(@"text:",text);
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u2026\\u2103\\u278a-\\u2793\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]" options:NSRegularExpressionCaseInsensitive error:nil];
    NSString* modifiedString = [regex stringByReplacingMatchesInString:text
                                                               options:0
                                                                 range:NSMakeRange(0, [text length])
                                                          withTemplate:@""];
    return modifiedString;
}


@end
