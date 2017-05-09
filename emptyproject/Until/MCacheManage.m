//
//  MCacheManage.m
//  MaCh
//
//  Created by Han Yan on 12-11-27.
//
//

#import "MCacheManage.h"


#define kFilename         @"archive"
#define kDataKey          @"Data"
@implementation MCacheManage


+ (NSString *)dataFilePath:(NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(
                                                         NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@_%@",kFilename,name]];
}


#pragma mark 首页存储和读取方法
+(void)MApplicatmaterCacheWrite:(NSMutableArray *)arry  withFileName:(NSString *)name //写入数据
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]
                                 initForWritingWithMutableData:data];
    [archiver encodeObject:arry forKey:kDataKey];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath:name] atomically:YES];
    
}

+(NSArray *)MApplicatmaterCacheRead:(NSString *)name //读取数据
{
    NSString *filePath = [self dataFilePath:name];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        NSData *data = [[NSMutableData alloc]
                        initWithContentsOfFile:[self dataFilePath:name]];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]
                                         initForReadingWithData:data];
        NSArray * arry= [unarchiver decodeObjectForKey:kDataKey];
        return arry;
    }
    else
    {
        return nil;
    }
}



@end
