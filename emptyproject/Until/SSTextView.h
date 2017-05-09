//
//  SSTextView.h
//  MTongGao
//
//  Created by apple on 13-9-29.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSTextView : UITextView
/**
 The string that is displayed when there is no other text in the text view.
 
 The default value is `nil`.
 */
@property (nonatomic, strong) NSString* placeholder;

/**
 The color of the placeholder.
 
 The default is `[UIColor lightGrayColor]`.
 */
@property (nonatomic, strong) UIColor* placeholderTextColor;
@property (nonatomic, strong) UIFont *placeholderFont;
@property (nonatomic, assign) int stype;
@property (nonatomic, assign) int stype_1;
@end
