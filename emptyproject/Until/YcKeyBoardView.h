//
//  YcKeyBoardView.h
//  KeyBoardAndTextView
//
//  Created by zzy on 14-5-28.
//  Copyright (c) 2014年 zzy. All rights reserved.
//
#define kStartLocation 20
#import <UIKit/UIKit.h>
#import "BaseView.h"
@class YcKeyBoardView;
@protocol YcKeyBoardViewDelegate <NSObject>

- (void)keyBoardViewHide:(YcKeyBoardView*)keyBoardView textView:(UITextField*)contentView;
- (void)keyBoardViewEndEdit;

@end

@interface YcKeyBoardView : BaseView
@property (nonatomic, strong) UITextField* textfield_s;

@property (nonatomic, assign) id<YcKeyBoardViewDelegate> delegate;
- (void)initTextView:(UITextField*)fields kuaiXunID:(NSString*)my_id guanzhu:(NSString*)myGuanzhu;
@end
