//
//  UIColorLabel.h
//  VCChangeAnimal
//
//  Created by Piero on 15/6/4.
//  Copyright (c) 2015年 Piero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColorLabel : UILabel

-(void)setColorRange:(NSRange )range withColor:(UIColor *)color;
/**
 *
 *  @param arr   NSArray *arr = [NSArray arrayWithObjects:@"{1,3}",@"{0,1}", nil];
 *
 */
-(void)setColorRanges:(NSArray *)arr withColor:(UIColor *)color;

-(void)setColorString:(NSString *)str withColor:(UIColor *)color;
-(void)setColorStrings:(NSArray *)arr WithColor:(UIColor *)color;
-(void)setFontString:(NSString *)str withFont:(UIFont *)font;
-(void)removeAllStringAttribute;
-(void)setBackColorRange:(NSRange)range withColor:(UIColor *)color;
-(void)setBackColorRange:(NSRange)range withColor:(UIColor *)color withFont:(NSInteger)font;
-(void)setUnlineString:(NSString *)str;

+ (UIColorLabel*)createLabelWithFrame:(CGRect)frame font:(UIFont*)font;
+ (UIColorLabel*)createLabelWithFrame:(CGRect)frame font:(UIFont*)font textColor:(UIColor*)color withtext:(NSString*)str;
@end
