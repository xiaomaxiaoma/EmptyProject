//
//  MCacheManage.h
//  MaCh
//
//  Created by Han Yan on 12-11-27.
//
//

#import <Foundation/Foundation.h>

@interface MCacheManage : NSObject
{

}
+(void)MApplicatmaterCacheWrite:(NSMutableArray *)arry  withFileName:(NSString *)name; //写入数据
+(NSArray *)MApplicatmaterCacheRead:(NSString *)name; //读取数据
+ (NSString *)dataFilePath:(NSString *)name;

@end
