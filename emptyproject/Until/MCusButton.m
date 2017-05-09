//
//  MCusButton.m
//  QX
//
//  Created by Alex on 14-4-29.
//  Copyright (c) 2014年 huanhuba. All rights reserved.
//

#import "MCusButton.h"

@implementation MCusButton
@synthesize indexPh, custag, image_MyURL,stringTitle;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)AddTagget
{
    [self addTarget:self action:@selector(ChickIn) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(Chickout) forControlEvents:UIControlEventTouchUpOutside];
}

- (void)ChickIn
{
    [self setBackgroundColor:RGBACOLOR(240, 20, 37, 1)];
}

- (void)Chickout
{
    [self setBackgroundColor:[UIColor whiteColor]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
