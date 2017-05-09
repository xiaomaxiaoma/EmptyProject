//
//  AppDelegate.h
//  emptyproject
//
//  Created by 马方会 on 2017/5/9.
//  Copyright © 2017年 马方会. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "rootNavigationController.h"
#import "HZCusTabViewController.h"
#import "oneVC.h"
#import "twoVC.h"
#import "threeVC.h"
#import "fourVC.h"
#import "fiveVC.h"
#import "UINavigationController+YRBackGesture.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) rootNavigationController* menu1Nav;
@property (strong, nonatomic) rootNavigationController* menu2Nav;
@property (strong, nonatomic) rootNavigationController* menu3Nav;
@property (strong, nonatomic) rootNavigationController* menu4Nav;
@property (strong, nonatomic) rootNavigationController* menu5Nav;

@property (strong, nonatomic)oneVC *one;
@property (strong, nonatomic)twoVC *two;
@property (strong, nonatomic)threeVC *three;
@property (strong, nonatomic)fourVC *four;
@property (strong, nonatomic)fiveVC *five;


@property (strong, nonatomic) HZCusTabViewController *tabBarController;
@end

