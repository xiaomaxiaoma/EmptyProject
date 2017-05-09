//
//  LocalData.h
//  QQTong
//
//  Created by yywang on 11-7-14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LocalData :NSObject
{
    
}
- (void)writeCommonePlist:(NSArray *)ary withStr:(NSString *)str;//通用存储plist文件
- (NSMutableArray *)getCommonePlist:(NSString *)str;
-(void)RemovePlist:(NSString *)str;
@end
