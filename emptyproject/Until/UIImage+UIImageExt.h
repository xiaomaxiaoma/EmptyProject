//
//  UIImage+UIImageExt.h
//  MaCh
//
//  Created by Yan Han on 12-5-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIImageExt)
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;
- (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;
@end
