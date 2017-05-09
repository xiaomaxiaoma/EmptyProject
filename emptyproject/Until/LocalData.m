//
//  LocalData.m
//  QQTong
//
//  Created by yywang on 11-7-14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "LocalData.h"


@implementation LocalData


-(void)commonLocalWrite:(NSMutableArray *)arry withname:(NSString *)strname
{
    for (int i=0; i<arry.count; i++)
    {
        NSMutableDictionary *dicnew = [NSMutableDictionary dictionaryWithDictionary:[arry objectAtIndex:i]];
        NSArray * arrykeys=[dicnew allKeys];
        BOOL isChange = NO;
        for (int j=0; j<arrykeys.count; j++)
        {
            if ([[dicnew valueForKey:[arrykeys objectAtIndex:j]] isEqual:[NSNull null]])
            {
                isChange = YES;
                [dicnew setValue:@"" forKey:[arrykeys objectAtIndex:j]];
            }
        }
        if (isChange) {
            [arry replaceObjectAtIndex:i withObject:dicnew];
        }
    }
    [self writeCommonePlist:arry withStr:strname];
}


- (void)writeCommonePlist:(NSArray *)ary withStr:(NSString *)str//通用存储plist文件
{
    NSArray * array = [[NSArray alloc] initWithArray:ary];
    NSString *path= [self customDir:@"PList" WithFileName:[NSString stringWithFormat:@"%@",str]];
    [array writeToFile:path  atomically:YES];
}

-(void)RemovePlist:(NSString *)str
{
    NSString *path= [self customDir:@"PList" WithFileName:[NSString stringWithFormat:@"%@",str]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        [[NSFileManager defaultManager] removeItemAtPath:path error:nil];//删除文件
    }

}


- (NSMutableArray *)getCommonePlist:(NSString *)str
{

    NSString *path= [self customDir:@"PList" WithFileName:[NSString stringWithFormat:@"%@",str]];
    NSMutableArray * dic=[[NSMutableArray alloc] initWithContentsOfFile:path] ;
    return dic;
    
    
}
- (NSString *)customDir:(NSString *)dir WithFileName:(NSString *)fileName2{
	NSString *documentsDirectory = [[self documentsDir] stringByAppendingPathComponent:dir];
	if (![[NSFileManager defaultManager] fileExistsAtPath:documentsDirectory]) {
		[[NSFileManager defaultManager] createDirectoryAtPath:documentsDirectory withIntermediateDirectories:NO attributes:nil error:nil];
	}
	return [documentsDirectory stringByAppendingPathComponent:fileName2];
}

- (NSString *)documentsDir
{
    //内存泄漏
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
	return  [paths objectAtIndex:0];
}


@end
