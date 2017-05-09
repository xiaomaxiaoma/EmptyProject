//
//  iToast.h
//  TakeAll
//
//  Created by Steven on 13-7-1.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    kToastPositionTop,
    kToastPositionCenter,
    kToastPositionBottom,
} ToastPosition;

typedef enum
{
    kToastDurationShort = 2000,
    kToastDurationNormal= 4000,
    kToastDurationLong  =10000,
} ToastDuration;

@interface iToast : NSObject
{
    ToastPosition   toastPosition;
    ToastDuration   toastDuration;
    NSString        *toastText;
    UIView          *view;
}

@property (assign,nonatomic)    ToastPosition toastPosition;
@property (assign,nonatomic)    ToastDuration toastDuration;
@property (retain,nonatomic)    NSString      *toastText;


- (id)initWithText: (NSString *)text;
- (void)show;

+ (iToast *)makeToast: (NSString *)text;


- (void)hideToast: (id)sender;
- (void)onHideToast: (NSTimer *)timer;
- (void)onRemoveToast: (NSTimer *)timer;
- (void)doHideToast;

@end
