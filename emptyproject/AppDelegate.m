//
//  AppDelegate.m
//  emptyproject
//
//  Created by 马方会 on 2017/5/9.
//  Copyright © 2017年 马方会. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //创建UI
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.tabBarController = [[HZCusTabViewController alloc] init];
    
    //比分首页
    _one=[[oneVC alloc]init];
    _menu1Nav= [[rootNavigationController alloc]initWithRootViewController:_one];
    _menu1Nav.navigationBar.hidden=YES;
    [_menu1Nav setEnableBackGesture:YES];
    
    //魔方首页
    _two=[[twoVC alloc]init];
    _menu2Nav= [[rootNavigationController alloc]initWithRootViewController:_two];
    _menu2Nav.navigationBar.hidden=YES;
    [_menu2Nav setEnableBackGesture:YES];
    
    // 首页
    //    _infonewshome=[[InfoNewsHomeVC alloc]init];
    //    _infonewshome.title=@"首页";
    //    _menu3Nav= [[rootNavigationController alloc]initWithRootViewController:_infonewshome];
    //    _menu3Nav.navigationBar.hidden=YES;
    //    [_menu3Nav setEnableBackGesture:YES];
    
    _three=[[threeVC alloc]init];
    _three.title=@"首页";
    _menu3Nav= [[rootNavigationController alloc]initWithRootViewController:_three];
    _menu3Nav.navigationBar.hidden=YES;
    [_menu3Nav setEnableBackGesture:YES];
    
    //市场首页
    _four=[[fourVC alloc]init];//hrecommain
    _menu4Nav= [[rootNavigationController alloc]initWithRootViewController:_four];
    _menu4Nav.navigationBar.hidden=YES;
    [_menu4Nav setEnableBackGesture:YES];
    
    //我的首页
    _five = [[fiveVC alloc] init];
    _menu5Nav= [[rootNavigationController alloc]initWithRootViewController:_five];
    _menu5Nav.navigationBar.hidden=YES;
    [_menu5Nav setEnableBackGesture:NO];
    
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:_menu1Nav,_menu2Nav,_menu3Nav,_menu4Nav,_menu5Nav,nil];
    self.tabBarController.delegate = self;
    [self.tabBarController setSelectedIndex:2];
    
    rootTabNavigationController * menutab= [[rootTabNavigationController alloc]initWithRootViewController:self.tabBarController];
    menutab.navigationBar.hidden=YES;
    [menutab setEnableBackGesture:NO];
    
    self.window.rootViewController =  menutab;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
