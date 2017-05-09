//
//  HZCusTabViewController.h
//  FootballCube
//
//  Created by Alex on 14-9-1.
//  Copyright (c) 2014年 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "WCMessageObject.h"
//#import "HZInteractiveInfoModel.h"

@interface HZCusTabViewController : UITabBarController <UITabBarDelegate> {
    UIImageView* back_img; //背景图
    UIImageView* sekect_img; // 选中图片
    UIButton* btn;
    NSArray* arrytitie;
    NSMutableArray* tab_btn;

    UILabel* labtitle;
    UILabel* labyuan;
    UILabel* labnum;
//    HZInteractiveInfoModel * hzinteract;
}
- (void)setIndex:(NSInteger)index;
-(void)SetbuttonColorByTag:(NSInteger)tag;
@property (nonatomic, strong) UITabBar* tabbar;
@end
