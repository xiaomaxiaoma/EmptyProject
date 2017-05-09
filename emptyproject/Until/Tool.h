//
//  Tool.h
//  QX
//
//  Created by francis.yao on 14-4-22.
//  Copyright (c) 2014年 huanhuba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tool : NSObject
+ (UIColor*)rgbToUIcolor:(NSString*)rgb;

/**
 *
 *  @param stringToConvert    十进制色值  例如 ＃eeeeee
 *  @param colorAlpha      透明度
 *
 *  @return    颜色值
 */
+ (UIColor*)hexStringToColor:(NSString*)stringToConvert thisAlpha:(float)colorAlpha;

+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (NSString*)hexFromUIColor:(UIColor*)color;

@end
