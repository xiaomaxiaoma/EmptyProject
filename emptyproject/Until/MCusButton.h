//
//  MCusButton.h
//  QX
//
//  Created by Alex on 14-4-29.
//  Copyright (c) 2014年 huanhuba. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "HXEmojiModel.h"

@interface MCusButton : UIButton

@property (nonatomic) int custag;
@property (nonatomic, strong) NSIndexPath* indexPh;
@property (nonatomic, strong) NSURL* image_MyURL;
@property (nonatomic,strong) NSString * stringTitle;
@property (nonatomic,strong) NSString *  dynamic_img;
@property (nonatomic,strong) NSDictionary * dicdata;
//@property (nonatomic,strong) data_info_model * model;
- (void)AddTagget;
@end
