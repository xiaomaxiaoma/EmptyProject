//
//  PublicPicProcess.m
//  FootballCube
//
//  Created by pique on 15/4/24.
//  Copyright (c) 2015年 pique. All rights reserved.
//

#import "PublicPicProcess.h"

@implementation PublicPicProcess

/**
 *截图功能
 */
+ (NSString*)screenShot:(UIView*)view_bounds
{
    //    UIGraphicsBeginImageContextWithOptions(CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, [UIScreen mainScreen].bounds.size.height * 2), YES, 0);
    //
    //    //设置截屏大小
    //
    //    [[view_bounds layer] renderInContext:UIGraphicsGetCurrentContext()];
    //
    //    UIImage* viewImage = UIGraphicsGetImageFromCurrentImageContext();
    //
    //    UIGraphicsEndImageContext();
    //
    //    CGImageRef imageRef = viewImage.CGImage;
    //    CGRect rect = CGRectMake(0, TopDistin(44) * 2, DEVICE_WIDTH * 2, DEVICE_HEIGHT * 2 - TopDistin(44) * 2); //这里可以设置想要截图的区域
    //
    //    CGImageRef imageRefRect = CGImageCreateWithImageInRect(imageRef, rect);
    //    UIImage* sendImage = [[UIImage alloc] initWithCGImage:imageRefRect];

    CGSize mSize = view_bounds.frame.size;

    //这个size定义图片的大小

    UIGraphicsBeginImageContext(mSize);

    //读取当前画布的内容
    [view_bounds.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage* sendImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    //以下为图片保存代码

    //UIImageWriteToSavedPhotosAlbum(sendImage, nil, nil, nil);//保存图片到照片库

    NSData* imageViewData = UIImagePNGRepresentation(sendImage);
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);

    NSString* documentsDirectory = [paths objectAtIndex:0];
    NSString* pictureName = @"screenShow.png";
    NSString* savedImagePath = [documentsDirectory stringByAppendingPathComponent:pictureName];
    [imageViewData writeToFile:savedImagePath atomically:YES]; //保存照片到沙盒目录

    //    CGImageRelease(imageRefRect);

    return savedImagePath;

    //从手机本地加载图片

    //UIImage *bgImage2 = [[UIImage alloc]initWithContentsOfFile:savedImagePath];
}

+ (UIImageView*)creatXuXian:(CGRect)image_frame
{
    UIImageView* imageView1 = [[UIImageView alloc] initWithFrame:image_frame];
    UIGraphicsBeginImageContext(imageView1.frame.size); //开始画线
    [imageView1.image drawInRect:CGRectMake(0, 0, imageView1.frame.size.width, imageView1.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound); //设置线条终点形状
    CGFloat lengths[] = { 5, 2 }; // 长,间隔
    CGContextRef line = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(line, [Tool hexStringToColor:@"e3e3e3" thisAlpha:1.0].CGColor);
    CGContextSetLineDash(line, 0, lengths, 2); //画虚线
    CGContextMoveToPoint(line, 0.0, 1.0); //开始画线
    CGContextAddLineToPoint(line, DEVICE_WIDTH - 2 * image_frame.origin.x, 1.0);
    CGContextStrokePath(line);
    imageView1.image = UIGraphicsGetImageFromCurrentImageContext();
    return imageView1;
}

+ (UIImageView*)creatXuXian:(CGRect)image_frame withwith:(NSInteger)with withsec:(NSInteger)sepc withColor:(UIColor*)color
{
    UIImageView* imageView1 = [[UIImageView alloc] initWithFrame:image_frame];
    UIGraphicsBeginImageContext(imageView1.frame.size); //开始画线
    [imageView1.image drawInRect:CGRectMake(0, 0, imageView1.frame.size.width, imageView1.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound); //设置线条终点形状
    CGFloat lengths[] = { with, sepc }; // 长,间隔
    CGContextRef line = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(line, color.CGColor);
    CGContextSetLineDash(line, 0, lengths, 2); //画虚线
    CGContextMoveToPoint(line, 0.0, 1.0); //开始画线
    CGContextAddLineToPoint(line, imageView1.frame.size.width, 1.0);
    CGContextStrokePath(line);
    imageView1.image = UIGraphicsGetImageFromCurrentImageContext();
    return imageView1;
}

+ (CGFloat)picturePercent:(UIImage*)image
{

    float imgPercent = 1;
    NSData* Photo = UIImageJPEGRepresentation(image, imgPercent);
    if (Photo.length > 800 * 1024)
    {
        imgPercent = 0.1;
    }
    else if (Photo.length > 400 * 1024 && Photo.length < 800 * 1024)
    {
        imgPercent = 0.5;
    }
    else if (Photo.length > 300 * 1024 && Photo.length < 400 * 1024)
    {
        imgPercent = 0.75;
    }
    else if (Photo.length < 300 * 1024)
    {
        imgPercent = 0.8;
    }

    return imgPercent;
}

//从网络下载图片
+(void)getImageFromURL:(NSString *)fileURL getSecondURL:(NSString *)fileURL_1 getImage:(void (^)(UIImage *image,UIImage *image_1))success
{
    NSArray* ary = [fileURL componentsSeparatedByString:@"/"];
    NSMutableString* fileName = [NSMutableString string];

    for (int i = 0; i < [ary count]; i++)
        [fileName appendString:[ary objectAtIndex:i]];
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString* path = [[paths objectAtIndex:0] stringByAppendingPathComponent:fileName];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    
    NSArray* ary_1 = [fileURL_1 componentsSeparatedByString:@"/"];
    NSMutableString* fileName_1 = [NSMutableString string];
    for (int i = 0; i < [ary_1 count]; i++)
        [fileName_1 appendString:[ary_1 objectAtIndex:i]];
    NSArray* paths_1 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString* path_1 = [[paths_1 objectAtIndex:0] stringByAppendingPathComponent:fileName_1];
    NSFileManager* fileManager_1 = [NSFileManager defaultManager];
    
    
    
    if ([fileManager fileExistsAtPath:path]&&[fileManager_1 fileExistsAtPath:path_1])
    {
        //return [UIImage imageWithContentsOfFile:path];
        success([UIImage imageWithContentsOfFile:path],[UIImage imageWithContentsOfFile:path_1]);
    }
    else
    {
        NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
        [data writeToFile:path atomically:NO];
        
        NSData* data_1 = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL_1]];
        [data_1 writeToFile:path_1 atomically:NO];
        //return [UIImage imageWithContentsOfFile:path];
        success([UIImage imageWithContentsOfFile:path],[UIImage imageWithContentsOfFile:path_1]);
//        dispatch_queue_t queue = dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//        dispatch_async(queue, ^{
//          
//        
//        });
        
    }
    
}
// 16进制转RGB
+ (NSMutableArray *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];

    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    NSMutableArray *arrays1 = [[NSMutableArray alloc]init];
    [arrays1 addObject:[NSNumber numberWithFloat:(float) r / 255.0f]];
    [arrays1 addObject:[NSNumber numberWithFloat:(float) g / 255.0f]];
    [arrays1 addObject:[NSNumber numberWithFloat:(float) b / 255.0f]];
    
    return arrays1;
}
+(NSMutableDictionary *)setTeamCountry:(id)res
{
    

    NSArray *array_zimu = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    NSMutableDictionary *dic_all = [NSMutableDictionary dictionary];
    for (int m = 0; m<array_zimu.count; m++)
    {
        NSMutableArray *array_1 = [NSMutableArray array];
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        
        for (int j = 0; j<[res count]; j++)
        {
            if ([[res[j]objectForKey:@"f_char"]isEqualToString:array_zimu[m]])
            {
                [array_1 addObject:res[j]];
            }
            
            if (array_1.count>0)
            {
                [dic setObject:array_1 forKey:array_zimu[m]];
                [dic_all addEntriesFromDictionary:dic];
            }
        }
    }
    return dic_all;
}


@end
