//
//  BaseView.h
//  FootballCube
//
//  Created by zoff on 15/6/15.
//  Copyright (c) 2015年 zoff. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BaseView : UIView

-(void)PushToAny:(NSDictionary *)dic;
-(void)PushToAny:(NSDictionary *)dic withView:(UIView *)view;
-(void)PushByhref:(NSString *)href withtitle:(NSString *)strtitle;
//绑定欢呼吧账号
-(void)accountAlertShow:(NSDictionary *)dic;
@property (nonatomic,strong) NSMutableDictionary * accountDic;
@end
