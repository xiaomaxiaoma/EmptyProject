//
//  HZCusTabViewController.m
//  FootballCube
//
//  Created by Alex on 14-9-1.
//  Copyright (c) 2014年 Alex. All rights reserved.
//

#import "HZCusTabViewController.h"
#import "UIButton+WebCache.h"
//#import "UIImage+WebP.h"
#import "ComoneObject.h"
#import "PublicPicProcess.h"
//#import "HZIntelligenceModel.h"
//#import "HDBlankBackView.h"
//#import "UMMobClick/MobClick.h"

@interface HZCusTabViewController ()
{
    NSMutableArray* aryMut;
    NSMutableArray* names;
    NSMutableArray* names_h;
    NSMutableArray* titles;
}

@end

@implementation HZCusTabViewController


- (void)creatItem:(int)i setImageOne:(UIImage *)img setImageTwo:(UIImage *)imgsel
{

    if (SYSTEMVERSION)
    {
        img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        imgsel = [imgsel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem* item = [[UITabBarItem alloc] initWithTitle:[titles objectAtIndex:i] image:img selectedImage:imgsel];
        item.tag = i;
        if ([item respondsToSelector:@selector(setTitlePositionAdjustment:)])
        //item.titlePositionAdjustment = UIOffsetMake(0, 0);
        item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        [aryMut addObject:item];
    }
    else
    {
        UIButton* btning = [UIButton buttonWithType:UIButtonTypeCustom];
        btning.frame = CGRectMake((DEVICE_WIDTH / names.count) * i, 0, DEVICE_WIDTH / names.count, tabheight);
        [btning setImage:img forState:UIControlStateNormal];
        [btning setImage:imgsel forState:UIControlStateSelected];
        [self.tabbar addSubview:btning];
        btning.tag = i;
        [btning addTarget:self action:@selector(ChickAll:) forControlEvents:UIControlEventTouchUpInside];

        UILabel* lab = [MMUntil createLabelWithFrame:CGRectMake((DEVICE_WIDTH / names.count) * i, tabheight - 14, (DEVICE_WIDTH / names.count), 14) font:[UIFont systemFontOfSize:12] textColor:[Tool hexStringToColor:@"#b0c0db" thisAlpha:1.0] withtext:[titles objectAtIndex:i]];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.tag = 10 + i;
        [self.tabbar addSubview:lab];
        
        if (i == 2)
        {
            btning.selected = YES;
            lab.textColor = White_Color;
            [DataManager sharedManager].cubtabselectindex=2;

        }
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Getmess) name:@"getmess" object:nil];
    aryMut = [NSMutableArray array];
    names = [NSMutableArray array];
    names_h = [NSMutableArray array];
    titles = [NSMutableArray array];
    names = [@[ @"icon_clockicon_1", @"icon_mofang_1",@"icon_qiudui_1",  @"icon_tuijian_1", @"icon_wo_1" ] mutableCopy];
    names_h = [@[@"icon_clockicon_2", @"icon_mofang_2",@"icon_qiudui_2", @"icon_tuijian_2", @"icon_wo_2" ] mutableCopy];
    titles = [@[ @"比分", @"魔方",@"首页", @"市场", @"我" ] mutableCopy];
    
    
//    if (SYSTEMVERSION > 6.0)
        self.tabbar = [[UITabBar alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT - tabheight, DEVICE_WIDTH, tabheight)];
//    else
//        self.tabbar = [[UITabBar alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT - tabheight - 20, DEVICE_WIDTH, tabheight)];
    
    self.tabbar.delegate = self;
    [self.view addSubview:self.tabbar];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    // UITabBarItem 选择高亮
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:White_Color, NSForegroundColorAttributeName, [UIFont fontWithName:@"Arial" size:12.0], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[Tool hexStringToColor:@"#7c87a6" thisAlpha:1.0], NSForegroundColorAttributeName, [UIFont fontWithName:@"Arial" size:12.0], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    UIImage* tabBarBackground = [MMUntil CreateImageByColorbg:TopBarColor withSize:CGSizeMake(DEVICE_WIDTH, tabheight)];
    [self.tabbar setBackgroundImage:tabBarBackground]; //设置背景，修改颜色是没有用的
    if (SYSTEMVERSIONUPLOAD)
    {
        
        [self.tabbar setSelectionIndicatorImage:tabBarBackground];
    }
    
    for (int i = 0; i < titles.count; i++)
    {
        
        UIImage* img = [UIImage imageNamed:[names objectAtIndex:i]];
        UIImage* imgsel = [UIImage imageNamed:[names_h objectAtIndex:i]];
        [self creatItem:i setImageOne:img setImageTwo:imgsel];
        
    }
    
    if (SYSTEMVERSION)
    {
        [self.tabbar setItems:aryMut];
        self.tabbar.selectedItem = [self.tabbar.items objectAtIndex:2];
        [DataManager sharedManager].cubtabselectindex=2;

    }
    
    //---------------添加未读数据
    labnum = [MMUntil createLabelWithFrame:CGRectMake(DEVICE_WIDTH - 25, 5, 8, 8) font:[UIFont systemFontOfSize:13] textColor:[UIColor whiteColor]];
    labnum.backgroundColor = VStandColor_RedAlert;
    labnum.textAlignment = NSTextAlignmentCenter;
    labnum.layer.masksToBounds = YES;
    labnum.layer.cornerRadius = 4;
    [self.tabbar addSubview:labnum];
    
//    if ([WCMessageObject fetchMessageListNOReadCount] > 0)
//    {
//        labnum.hidden = NO;
//    }
//    else
//    {
//        labnum.hidden = YES;
//    }
//    [DataManager sharedManager].cubindex = alter;
//    [self makeTabBarHidden:YES];
//    if (![HPUserInfo isLogin])
//    {
//        labnum.hidden = YES;
//    }
    [self Getmess];
    [self registerNotifications];
}



- (void)ChickAll:(UIButton*)sender
{
    [self setSelectedIndex:sender.tag];
    [self SetbuttonColorByTag:sender.tag];
    [self SetViewByTag:sender.tag];
}

- (void)SetViewByTag:(NSInteger)tag
{
    [DataManager sharedManager].cubindex = tag;
    switch (tag) {
        case 0: {
//            [DataManager sharedManager].cubindex = score;
//            [[FootStats sharedFootStats] ChickEvent:score];
//            [MobClick event:@"foot_bifen"];
            [DataManager sharedManager].cubtabselectindex=0;
            
        } break;
        case 1: {
//            [DataManager sharedManager].cubindex = mofang;
//            [[FootStats sharedFootStats] ChickEvent:mofang];
//            [MobClick event:@"foot_mofang"];
//            [MobClick event:@"foot_mofangAll"];
            [DataManager sharedManager].cubtabselectindex=1;

            
        } break;
        case 2: {
//            [DataManager sharedManager].cubindex = alter;
//            [[FootStats sharedFootStats] ChickEvent:alter];
//            [MobClick event:@"foot_sucha"];
//            [MobClick event:@"foot_kuaixunAll"];
            [DataManager sharedManager].cubtabselectindex=2;
            
            
        } break;
        case 3: {
            NSString* str = [ComoneObject getUnifyKey:@"FIRSTLOGIN"];
            
            if (str == nil || [str isEqualToString:@"First"]) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"ISFIRSTLOGIN" object:nil];
            }
            
//            [DataManager sharedManager].cubindex = market;
//            [[FootStats sharedFootStats] ChickEvent:market];
//            [MobClick event:@"foot_tuijian"];
//            [MobClick event:@"foot_tuijianAll"];
            [DataManager sharedManager].cubtabselectindex=3;

        } break;
        case 4: {
            //[MobClick event:@"foot_wo"];
            
        } break;
            
        default:
            break;
    }
}

- (void)SetbuttonColorByTag:(NSInteger)tag
{
    for (UIView* v in self.tabbar.subviews) {
        if ([v isKindOfClass:[UIButton class]]) {
            UIButton* btn1 = (UIButton*)v;
            if (tag == btn1.tag) {
                btn1.selected = YES;
            }
            else {
                btn1.selected = NO;
            }
        }
        
        if ([v isKindOfClass:[UILabel class]]) {
            UILabel* lab = (UILabel*)v;
            if (lab.tag == tag + 10) {
                lab.textColor = White_Color;
            }
            else {
                lab.textColor = TextColorGaryNome;
            }
        }
    }
}

- (void)Getmess
{
    [self LoadHUDONum];
}

- (void)makeTabBarHidden:(BOOL)hide
{
    if ([self.view.subviews count] < 2)
        return;
    
    UIView* contentView;
    
    if ([[self.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]])
        contentView = [self.view.subviews objectAtIndex:1];
    else
        contentView = [self.view.subviews objectAtIndex:0];
    
    if (hide) {
        contentView.frame = self.view.bounds;
    }
    else {
        contentView.frame = CGRectMake(self.view.bounds.origin.x,
                                       self.view.bounds.origin.y,
                                       self.view.bounds.size.width,
                                       self.view.bounds.size.height - self.tabBar.frame.size.height);
    }
    self.tabBar.hidden = hide;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setIndex:(NSInteger)index
{
    [self setSelectedIndex:index];
    self.tabbar.selectedItem = [self.tabbar.items objectAtIndex:index];
}

- (void)tabBar:(UITabBar*)tabbar didSelectItem:(UITabBarItem*)item
{
    NSLog(@"Selected is %ld", (long)item.tag);
    [self setSelectedIndex:item.tag];
    [self SetViewByTag:item.tag];
}

//重新加载数字
- (void)LoadHUDONum
{
//    if (![HPUserInfo isLogin]) {
//        labnum.hidden = YES;
//        return;
//    }
//    if (hzinteract==nil)
//    {
//        hzinteract=[[HZInteractiveInfoModel alloc]init];
//        hzinteract.showWaiting=NO;
//    }
//    [MMRequest requestPost:hzinteract whenSuccess:^(HYModel *m, id res) {
//        [self GetAllNum];
//    } whenFailure:^(NSError *err) {
//        [self GetAllNum];
//    }];
}

- (void)GetAllNum
{
//    
//    NSInteger num = [WCMessageObject fetchMessageListNOReadCount];
//    NSInteger collect_new_num = [[[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"collect_new_num_%@", [HPUserInfo getUserId]]] intValue];
//    NSInteger cite_new_num = [[[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"cite_new_num_%@", [HPUserInfo getUserId]]] intValue];
//    NSInteger inter_new_num = [[[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"inter_new_num_%@", [HPUserInfo getUserId]]] intValue];
//    NSInteger omment_new_num = [[[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"comment_new_num_%@", [HPUserInfo getUserId]]] intValue];
//    NSInteger peixun_new_num = [[[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"peixun_new_num_%@", [HPUserInfo getUserId]]] intValue];
//    
//    if (num + collect_new_num + cite_new_num + inter_new_num + omment_new_num +peixun_new_num+[self GetUNReadNum] > 0) {
//        labnum.hidden = NO;
//    }
//    else {
//        labnum.hidden = YES;
//    }
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"SHUXINVIEW" object:nil];
}

-(NSInteger)GetUNReadNum
{
    return 0; //暂时用不到
//    NSArray *conversations = [[[EaseMob sharedInstance] chatManager] conversations];
//    NSInteger unreadCount = 0;
//    for (EMConversation *conversation in conversations)
//    {
//        unreadCount += conversation.unreadMessagesCount;
//    }
//    return unreadCount;
    
}


#pragma mark - 环信消息处理

-(void)registerNotifications
{
    //[self unregisterNotifications];
    
    //[[EaseMob sharedInstance].chatManager addDelegate:self delegateQueue:nil];
    //    [[EaseMob sharedInstance].callManager addDelegate:self delegateQueue:nil];
}

-(void)unregisterNotifications
{
//    [[EaseMob sharedInstance].chatManager removeDelegate:self];
//    [[EaseMob sharedInstance].callManager removeDelegate:self];
}

//// 收到消息回调
//-(void)didReceiveMessage:(EMMessage *)message
//{
//    [self GetAllNum];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"huanxinnot" object:nil];
//    
//    UIApplicationState state = [[UIApplication sharedApplication] applicationState];
//    switch (state) {
//        case UIApplicationStateActive:
//            break;
//        case UIApplicationStateInactive:
//            break;
//        case UIApplicationStateBackground:
//            [self showNotificationWithMessage:message];
//            break;
//        default:
//            break;
//    }
//}


//- (void)showNotificationWithMessage:(EMMessage *)message
//{
//    //发送本地推送
//    UILocalNotification *notification = [[UILocalNotification alloc] init];
//    notification.fireDate = [NSDate date]; //触发通知的时间
//    notification.alertBody = NSLocalizedString(@"receiveMessage", @"you have a new message");
//    notification.alertAction = NSLocalizedString(@"open", @"Open");
//    notification.timeZone = [NSTimeZone defaultTimeZone];
//    notification.soundName=UILocalNotificationDefaultSoundName;
//    //发送通知
//    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
//    
//}



#pragma mark - IChatManagerDelegate 登录状态变化

- (void)didLoginFromOtherDevice
{
   // [[EaseMob sharedInstance].chatManager asyncLogoffWithUnbindDeviceToken:NO completion:^(NSDictionary *info, EMError *error) {
        //        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"prompt", @"Prompt") message:NSLocalizedString(@"loginAtOtherDevice", @"your login account has been in other places") delegate:self cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
        //        alertView.tag = 100;
        //        [alertView show];
        //        [self LoginOff];
        
    //} onQueue:nil];
}

- (void)didRemovedFromServer
{
    //[[EaseMob sharedInstance].chatManager asyncLogoffWithUnbindDeviceToken:NO completion:^(NSDictionary *info, EMError *error) {
        //        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"prompt", @"Prompt") message:NSLocalizedString(@"loginUserRemoveFromServer", @"your account has been removed from the server side") delegate:self cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
        //        alertView.tag = 101;
        //        [alertView show];
        //        [self LoginOff];
        
    //} onQueue:nil];
}

-(void)LoginOff
{
    //[HPUserInfo clearUserInfo];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UserSingout" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:KRecomMainLoad object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:KRecomAttionLoad object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:KTeamMainLoad object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Jpush" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"getmess" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Signoutgo" object:nil];
}


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
