//
//  rootNavigationController.m
//  Nikestatistics
//
//  Created by zoff on 16/5/14.
//  Copyright © 2016年 zoff. All rights reserved.
//

#import "rootNavigationController.h"

@interface rootNavigationController ()

@end

@implementation rootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotate
{
    return NO;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.viewControllers.lastObject
            supportedInterfaceOrientations];
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.viewControllers.lastObject
            preferredInterfaceOrientationForPresentation];
}



@end

@implementation rootTabNavigationController

- (BOOL)shouldAutorotate //当前viewcontroller是否支持转屏
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations //；当前viewcontroller支持哪些转屏方向
{
    return UIInterfaceOrientationMaskPortrait;
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation //当前viewcontroller默认的屏幕方向
{
    return UIInterfaceOrientationPortrait;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return NO;
}


@end
