//
//  PublicPicProcess.h
//  FootballCube
//
//  Created by pique on 15/4/24.
//  Copyright (c) 2015年 pique. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicPicProcess : NSObject
/**
 *截图功能
 */
+ (NSString*)screenShot:(UIView*)view_bounds;

/**
 *  画虚线
 *
 *  @param image_frame    定义大小
 *
 *  @return imageView
 */
+ (UIImageView *)creatXuXian:(CGRect)image_frame;
+ (UIImageView *)creatXuXian:(CGRect)image_frame withwith:(NSInteger)with withsec:(NSInteger)sepc withColor:(UIColor*)color;

+ (CGFloat)picturePercent:(UIImage *)image;

+(void)getImageFromURL:(NSString *)fileURL getSecondURL:(NSString *)fileURL_1 getImage:(void (^)(UIImage *image,UIImage *image_1))success;
+ (NSMutableArray *) colorWithHexString: (NSString *)color;

+(NSMutableDictionary *)setTeamCountry:(id)res;

@end
