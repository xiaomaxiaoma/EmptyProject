//
//  HPCustomViewControl.h
//  FootballCube
//
//  Created by duanzhaoyang on 14-9-1.
//  Copyright (c) 2014年 duanzhaoyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPCustomViewControl : NSObject
/**
 *  自定义的NavTittleView
 *
 *  @param title 标题名字
 *
 *  @return UIlabel
 */
+ (UILabel*)createNavTitleView:(NSString*)title wordsFont:(float)fontNum;
/**
 *  统一设置返回按钮
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem*)createNavigationBackButtionAction:(SEL)action target:(id)target;
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

/**
 *                   时间戳转化为时间
 *
 *  @param str       要传入的时间戳
 *  @param styleTime 类型
 *
 *  @return           时间
 */
+ (NSString*)timeConversion:(NSString*)str style:(NSString*)styleTime;

/**
 *  判断邮箱是否正确
 */
+ (BOOL)validateEmail:(NSString*)candidate;

@end
