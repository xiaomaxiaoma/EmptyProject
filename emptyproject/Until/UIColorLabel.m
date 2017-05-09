//
//  UIColorLabel.m
//  VCChangeAnimal
//
//  Created by Piero on 15/6/4.
//  Copyright (c) 2015年 Piero. All rights reserved.
//

#import "UIColorLabel.h"

@interface UIColorLabel()
@property (nonatomic,strong) NSMutableAttributedString *attributedStr;
@end

@implementation UIColorLabel

-(instancetype)init
{
    self = [super init];
    if(self)
    {
    }
    return self;
}
-(void)setText:(NSString *)text
{
    [super setText:text];
    if (self.text && self.text.length >0)
    {
        self.attributedStr =  [[NSMutableAttributedString alloc] initWithString:text];
    }
    
}


-(void)setColorRange:(NSRange)range withColor:(UIColor *)color
{
    if(self.text && self.text.length >0)
    {
        [self.attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
        [self setAttributedText:self.attributedStr];
    }
}
-(void)setColorRanges:(NSArray *)arr withColor:(UIColor *)color
{
    if(self.text && self.text.length >0)
    {
        for (int i=0; i<arr.count; i++) {
            NSRange range = NSRangeFromString([arr objectAtIndex:i]);
            [self.attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
        [self setAttributedText:self.attributedStr];
    }
}

-(void)setColorString:(NSString *)str withColor:(UIColor *)color 
{
    if(self.text && self.text.length >0)
    {
        if (str.length>0)
        {
            NSRange r = [self.text rangeOfString:str];
            [self.attributedStr addAttribute:NSForegroundColorAttributeName value:color range:r];
            [self setAttributedText:self.attributedStr];
        }
       
    }
}
-(void)setColorStrings:(NSArray *)arr WithColor:(UIColor *)color
{
    if(self.text && self.text.length >0)
    {
        for (NSString *str in arr) {
            NSRange r = [self.text rangeOfString:str];
            [self.attributedStr addAttribute:NSForegroundColorAttributeName value:color range:r];
        }
        [self setAttributedText:self.attributedStr];
    }
}


-(void)setUnlineString:(NSString *)str
{
    if(self.text && self.text.length >0)
    {
        NSRange r = [self.text rangeOfString:str];
        [self.attributedStr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:r];
        [self setAttributedText:self.attributedStr];
    }
}


-(void)setBackColorRange:(NSRange)range withColor:(UIColor *)color
{
    if(self.text && self.text.length >0)
    {
        [self.attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:range];
        [self.attributedStr addAttribute:NSBackgroundColorAttributeName value:color range:range];
        [self setAttributedText:self.attributedStr];
    }
}

-(void)setBackColorRange:(NSRange)range withColor:(UIColor *)color withFont:(NSInteger)font
{
    if(self.text && self.text.length >0)
    {
        self.textAlignment = NSTextAlignmentCenter;
        self.layer.cornerRadius = 2.0f;
        self.layer.masksToBounds = YES;
        [self.attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:range];
        [self.attributedStr addAttribute:NSBackgroundColorAttributeName value:color range:range];
        [self setAttributedText:self.attributedStr];
    }
}

-(void)removeAllStringAttribute
{
    if(self.text && self.text.length >0)
    {
        [self.attributedStr removeAttribute:NSForegroundColorAttributeName range:NSMakeRange(0, self.text.length)];
        [self setAttributedText:self.attributedStr];
    }
}
-(void)setFontString:(NSString *)str withFont:(UIFont *)font{

    if(self.text && self.text.length >0)
    {
        if (str.length>0) {
            NSRange r = [self.text rangeOfString:str];
            [self.attributedStr addAttribute:NSFontAttributeName value:font range:r];
            [self setAttributedText:self.attributedStr];
        }
        
    }
}

+ (UIColorLabel*)createLabelWithFrame:(CGRect)frame font:(UIFont*)font textColor:(UIColor*)color withtext:(NSString*)str

{
    UIColorLabel* lbl = [self createLabelWithFrame:frame font:font];
    lbl.textColor = color;
    lbl.text = str;
    
    return lbl;
}

+ (UIColorLabel*)createLabelWithFrame:(CGRect)frame font:(UIFont*)font
{
    UILabel* lbl = [[UIColorLabel alloc] initWithFrame:frame];
    lbl.font = font;
    lbl.backgroundColor = [UIColor clearColor];
    
    return lbl;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
