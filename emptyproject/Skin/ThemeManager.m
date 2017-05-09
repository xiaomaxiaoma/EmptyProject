//
//  ThemeManager.m
//  SkinnedUI
//
//  Created by QFish on 12/3/12.
//  Copyright (c) 2012 QFish.Net. All rights reserved.
//

#import "ThemeManager.h"

NSString * const ThemeDidChangeNotification = @"me.ilvu.theme.change";

@implementation ThemeManager

@synthesize theme = _theme;

+ (ThemeManager *)sharedInstance
{
    static dispatch_once_t once;
    static ThemeManager *instance = nil;
    dispatch_once( &once, ^{ instance = [[ThemeManager alloc] init]; } );
    return instance;

}


-(UIColor *)ReturnColorByTheme:(UIColor *)daycolor withNightColor:(UIColor *)nightcolor
{
    if ( [[[ThemeManager sharedInstance] theme] isEqualToString: kThemeDay] )
    {
        return daycolor;
    }
    else if([[[ThemeManager sharedInstance] theme] isEqualToString:kThemeNight] )
    {
        return nightcolor;
    }
    return daycolor;

}


- (void)setTheme:(NSString *)theme
{
    _theme=theme;
    ThemeStatus status = ThemeStatusDidChange;
    [[NSNotificationCenter defaultCenter]
     postNotificationName:ThemeDidChangeNotification
     object:[NSNumber numberWithInt:status]];
}

- (UIImage *)imageWithImageName:(NSString *)imageName
{
    NSString *directory = [NSString stringWithFormat:@"%@/%@", @"ThemeResource", [self theme]];
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName
                                                          ofType:@"png"
                                                     inDirectory:directory];
    
    return [UIImage imageWithContentsOfFile:imagePath];
}

- (NSString *)theme
{
//    _theme = [[NSUserDefaults standardUserDefaults] objectForKey:@"setting.theme"];
    
    if ( _theme == nil )
    {
        return @"Day";
    }
    return _theme;
}

@end
