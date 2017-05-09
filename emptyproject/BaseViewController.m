
//  BaseViewController.m
//  FootballCube
//   1111-------
//  Created by Alex on 14-9-1.
//  Copyright (c) 2014年 Alex. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"
//#import "UIButton+WebCache.h"
//#import "UIImage+UIImageExt.h"
//#import "ShowIOSAdvViewController.h"
//#import "HPVIPInfoVC.h"
//#import "HZRecomSMGViewController.h"
//#import "HXActiveVC.h"
//#import "HXHYDetileVC.h"
//#import "HPBaiJiaVC.h"
//#import "HXQBQSViewController.h"
//#import "IQKeyboardManager.h"
//#import "HXMainPayVC.h"
//#import "HDLotteryVC.h"
//#import "HXYQYLViewController.h"
//#import <ShareSDKUI/ShareSDK+SSUI.h>
//#import "HDCreateOrderWebViewVC.h"
//#import "HZTeamDetailViewController.h"
//#import "HPRealOrderInfoVC.h"
//#import "HDNewUserGuideVC.h"

// 上线修改   如果 xcode7 里运行崩溃  把plistinfo 的东西删掉    talkingdata  解注释
@interface BaseViewController ()

@end

@implementation BaseViewController

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

//- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
//{
//    // 强制竖屏
//    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
//        SEL selector = NSSelectorFromString(@"setOrientation:");
//        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
//        [invocation setSelector:selector];
//        [invocation setTarget:[UIDevice currentDevice]];
//        int val = UIInterfaceOrientationPortrait;
//        [invocation setArgument:&val atIndex:2];
//        [invocation invoke];
//    }
//}




- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc
{
    [self unregisterAsObserver];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];

    
//    UIApplication* application = [UIApplication sharedApplication];
//    AppDelegate* app = (AppDelegate*)application.delegate;
//    if (SYSTEMVERSION) {
//        
//        app.tabBarController.tabbar.frame = CGRectMake(0, DEVICE_HEIGHT - tabheight, DEVICE_WIDTH, tabheight); //需要改
//    }
//    else {
//        app.tabBarController.tabbar.frame = CGRectMake(0, DEVICE_HEIGHT - tabheight + 20, DEVICE_WIDTH, tabheight); //需要改
//        
//    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    if (SYSTEMVERSION) {
        //barView.frame = CGRectMake(0, 20, DEVICE_WIDTH, 44);
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        viewState = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 20)];
        viewState.backgroundColor = TopBarColor;
        [self.view addSubview:viewState];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    }
    [self regitserAsObserver];
    

    // 强制竖屏
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = UIInterfaceOrientationPortrait;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }

    
}

-(void)setTitle:(NSString *)title
{
    [self initTopBar:title];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    if ([DataManager sharedManager].is_opentalkdata == 1) {
//        [TalkingData trackPageBegin:self.labBasetitle.text];
//    }
//    [MobClick beginLogPageView:self.labBasetitle.text];
}


- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
//    [MobClick endLogPageView:self.labBasetitle.text];
//    if ([DataManager sharedManager].is_opentalkdata == 1) {
//        [TalkingData trackPageEnd:self.labBasetitle.text];
//    }
}

- (void)initTopBar:(NSString*)str
{
    //self.navigationController.navigationBarHidden = YES;
    if (topBarView==nil)
    {
        topBarView = [[UIView alloc] initWithFrame:CGRectMake(0, TopDistin(0), DEVICE_WIDTH, 44)];
        topBarView.backgroundColor = TopBarColor;
        [self.view addSubview:topBarView];
        
        self.labBasetitle = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, DEVICE_WIDTH-80, 44)];
        self.labBasetitle.font = [UIFont systemFontOfSize:20];
        self.labBasetitle.textColor = TxtStandColor1_y;
        self.labBasetitle.backgroundColor = [UIColor clearColor];
        self.labBasetitle.textAlignment = NSTextAlignmentCenter;
        [topBarView addSubview:self.labBasetitle];
    }
   
    self.labBasetitle.text = str;
    if (str.length < 1) {
        self.labBasetitle.text = self.title;
    }
    [self configureViews];

}

- (void)addBack
{
    backBtnBase = [UIButton buttonWithType:UIButtonTypeCustom]; // 创建按钮
    [backBtnBase setFrame:CGRectMake(0, 0, 50, 44)]; // 设置大小
    [backBtnBase setImage:[UIImage imageNamed:@"btnback"] forState:UIControlStateNormal];
    [backBtnBase setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backBtnBase setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backBtnBase setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [backBtnBase setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    backBtnBase.titleLabel.font = CONTENT_FONT(15);
    if (backBtnBase.titleLabel.text.length>0) {
        [backBtnBase setImageEdgeInsets:UIEdgeInsetsMake(0.0,-10.0,0.0,0.0)];
        [backBtnBase setTitleEdgeInsets:UIEdgeInsetsMake(0.0,6.0,0.0,0.0)];
    }

    [backBtnBase addTarget:self action:@selector(chickBack) forControlEvents:UIControlEventTouchUpInside];
    [topBarView addSubview:backBtnBase];
}

- (void)addRightBtn:(NSString*)btnTitle
{
    saveBtnbase = [UIButton buttonWithType:UIButtonTypeCustom]; // 创建按钮
    [saveBtnbase setFrame:CGRectMake(DEVICE_WIDTH - 44, 0, 44, 44)]; // 设置大小
    [saveBtnbase setTitle:btnTitle forState:UIControlStateNormal];
    [saveBtnbase setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [saveBtnbase setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [saveBtnbase setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    saveBtnbase.titleLabel.font = CONTENT_FONT(15);
    [saveBtnbase addTarget:self action:@selector(chickRight) forControlEvents:UIControlEventTouchUpInside];
    saveBtnbase.tag = 11880;
    [topBarView addSubview:saveBtnbase];
}

- (void)hideRightBtn{
    saveBtnbase.hidden = YES;
}

- (void)showRightBtn{
    saveBtnbase.hidden = NO;
}

// 导航右边的按钮点击事件
- (void)chickRight
{
    
}
- (void)chickBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)HideTabBar
{
    UIApplication* application = [UIApplication sharedApplication];
    AppDelegate* app = (AppDelegate*)application.delegate;
    app.tabBarController.tabbar.frame = CGRectMake(0, DEVICE_HEIGHT + 20, DEVICE_WIDTH, tabheight); //需要改
    
    UITabBar* tabBar = self.tabBarController.tabBar;
    UIView* parent = tabBar.superview; // UILayoutContainerView
    UIView* content = [parent.subviews objectAtIndex:0]; // UITransitionView
    UIView* window = parent.superview;
    [UIView animateWithDuration:0
                     animations:^{
                         CGRect tabFrame = tabBar.frame;
                         tabFrame.origin.y = CGRectGetMaxY(window.bounds);
                         tabBar.frame = tabFrame;
                         content.frame = window.bounds;
                     }];
    
}

- (void)ShowTabBar
{
    
    UIApplication* application = [UIApplication sharedApplication];
    AppDelegate* app = (AppDelegate*)application.delegate;
    if (SYSTEMVERSION) {
        app.tabBarController.tabbar.frame = CGRectMake(0, DEVICE_HEIGHT - tabheight, DEVICE_WIDTH, tabheight); //需要改
    }
    else {
        app.tabBarController.tabbar.frame = CGRectMake(0, DEVICE_HEIGHT - tabheight + 20, DEVICE_WIDTH, tabheight); //需要改
    }
    
    UITabBar* tabBar = self.tabBarController.tabBar;
    UIView* parent = tabBar.superview; // UILayoutContainerView
    UIView* content = [parent.subviews objectAtIndex:0]; // UITransitionView
    UIView* window = parent.superview;
    [UIView animateWithDuration:0
                     animations:^{
                         CGRect tabFrame = tabBar.frame;
                         tabFrame.origin.y = CGRectGetMaxY(window.bounds)-tabheight;
                         tabBar.frame = tabFrame;
                         content.frame = window.bounds;
                     }];
}

//- (void)ShowShareView:(BOOL)ShowToolBar
//{
//    
//    [self HideTabBar];
//    if (shareSDKView == nil) {
//        shareSDKView = [[MShareView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, DEVICE_WIDTH, self.view.frame.size.height)];
//        [self.view addSubview:shareSDKView];
//        shareSDKView.delegate = self;
//        __weak typeof(self) weakself=self;
//        [shareSDKView cancleShareViewOrder:^{
//            
//            [weakself ShareCancle];
//        }];
//        [UIView animateWithDuration:0.3 animations:^{
//            shareSDKView.frame=CGRectMake(0, 0, DEVICE_WIDTH, self.view.frame.size.height);
//        } completion:^(BOOL finish) {
//            [shareSDKView ShowVback];
//            
//        }];
//    }
//}
//- (void)hideShareView:(BOOL)hideToolBar
//{
//    [UIView animateWithDuration:0.3 animations:^
//    {
//        shareSDKView.frame=CGRectMake(0, self.view.frame.size.height, DEVICE_WIDTH, 210);
//    } completion:^(BOOL finished) {
//        
//        if (hideToolBar == YES)
//        {
//            [self ShowTabBar];
//        }
//        [shareSDKView removeFromSuperview];
//        shareSDKView=nil;
//    }];
//}
//
//#pragma mark MShareViewDelegate
//
//- (void)MShareViewCancleShutDownBytool:(BOOL)showtoolbar
//{
//    //[self hideShareView:YES];
//    [self ShareCancle];
//}
//- (void)MShareViewCancle
//{
//    
//   //[self ShareCancle];
//
//}
//
///**
// *  分享调用方法
// *
// *  @param indextype  分享类型
// *  @param strTitle   分享标题
// *  @param strcontent 分享内容
// *  @param strurl     分享链接地址
// *  @param Imgpath    分享图片
// *  @param type
// */
//
//- (void)shareChick:(NSInteger)indextype title:(NSString*)strTitle shareContent:(NSString*)strcontent withstrurl:(NSString*)strurl withImagePath:(id)Imgpath withtype:(NSInteger)type
//{
//    
//    [[IQKeyboardManager sharedManager] setEnable:NO];
//    [DataManager sharedManager].issharesdk = YES;
//    [DataManager sharedManager].iswx = NO;
//    NSString* shareSDKContent = strcontent;
//    SSDKPlatformType sharetype;
//    
//    if (indextype == 100) {
//        sharetype = SSDKPlatformSubTypeWechatSession;
//        fenxiangType = @"1";
//    }
//    else if (indextype == 101) {
//        sharetype = SSDKPlatformSubTypeWechatTimeline;
//        fenxiangType = @"2";
//    }
//    else if (indextype == 102) {
//        sharetype = SSDKPlatformTypeSinaWeibo;
//        fenxiangType = @"3";
//        shareSDKContent = [NSString stringWithFormat:@"%@ %@ %@", strTitle, strcontent, strurl];
//    }
//    else if (indextype == 103) {
//        sharetype = SSDKPlatformTypeTencentWeibo;
//        fenxiangType = @"4";
//        shareSDKContent = [NSString stringWithFormat:@"%@ %@ %@", strTitle, strcontent, strurl];
//    }
//    else if (indextype == 104) {
//        sharetype = SSDKPlatformSubTypeQZone;
//        fenxiangType = @"5";
//    }
//    else {
//        sharetype = SSDKPlatformTypeQQ;
//        fenxiangType = @"6";
//    }
////    id webimg;
////    if ([Imgpath isKindOfClass:[NSString class]]&&sharetype==SSDKPlatformTypeSinaWeibo)
////    {
////        UIImage * img=[[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:Imgpath]]];
////        webimg=img;
////    }
////    else if ([Imgpath isKindOfClass:[UIImage class]]&&sharetype==SSDKPlatformTypeSinaWeibo)
////    {
////        webimg=Imgpath;
////    }
////    else
////    {
////        webimg=Imgpath;
////    }
//  
//    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
//    [shareParams SSDKSetupShareParamsByText:[NSString stringWithFormat:@"%@", shareSDKContent]
//                                     images:Imgpath
//                                        url:[NSURL URLWithString:strurl]
//                                      title:strTitle
//                                       type:SSDKContentTypeAuto];
//    if ( sharetype == SSDKPlatformSubTypeWechatSession|| sharetype == SSDKPlatformSubTypeWechatTimeline|| sharetype == SSDKPlatformTypeQQ|| sharetype == SSDKPlatformSubTypeQZone) {
//        [ShareSDK share:sharetype parameters:shareParams onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error){
//            [self ShareSuccess:state withtype:type witherror:error withindextype:indextype];
//        }];
//    }
//    else
//    {
//        //分享（编辑界面）
//        [ShareSDK showShareEditor:sharetype otherPlatformTypes:nil shareParams:shareParams onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
//            [self ShareSuccess:state withtype:type witherror:error withindextype:indextype];
//        }];
//    }
//}
//
//
//-(void)ShareSuccess:(SSDKResponseState)state withtype:(NSInteger)type witherror:(NSError *)error withindextype:(NSInteger)indextype
//{
//    if (state == SSDKResponseStateSuccess)
//    {
//        [DataManager sharedManager].issharesdk=NO;
//        [SVProgressHUD showSuccessWithStatus:@"分享成功"];
//        [[IQKeyboardManager sharedManager] setEnable:YES];
//        if (type==1)//快讯分享成功
//        {
//            [MobClick event:@"foot_kuaixun_sharesuccess"];
//        }
//        [self ShareSuccess];
//        [self Shareover];
//        [self ShareSuccessBytag:indextype];
//        
//    }
//    else if (state == SSDKResponseStateFail)
//    {
//        
//        [[IQKeyboardManager sharedManager] setEnable:YES];
//        [DataManager sharedManager].issharesdk=NO;
//        if (error!=nil) {
//            //[SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"分享失败 失败原因:%d   %@",[error errorCode],[error errorDescription]] duration:2];
//        }
//        else
//        {
//            [SVProgressHUD showErrorWithStatus:@"分享失败"];
//        }
//        [self Shareover];
//        [self ShareFail];
//        
//        
//    }
//    else if (state==SSDKResponseStateCancel)
//    {
//        [self Shareover];
//        [self ShareCancle];
//        
//    }
//
//}
//
//-(void)ShareSuccessBytag:(NSInteger)tag
//{
//
//}
//
//
//-(void)Shareover{}
//-(void)ShareCancle{
//
//}
//-(void)ShareFail{};
//
//- (void)ShareSuccess
//{
//    
//    if (str_All_countShare_match_id.length <= 0) {
//        str_All_countShare_match_id = @"0";
//    }
//    if (str_All_countShare_user_id.length <= 0) {
//        str_All_countShare_user_id = @"0";
//    }
//    if (str_All_countShare_kuaixun_id.length <= 0) {
//        str_All_countShare_kuaixun_id = @"0";
//    }
//    if (str_All_count_type.length <= 0)
//    {
//        str_All_count_type = @"2";
//    }
//    NSString* str_login_id = [HPUserInfo getUserId];
//    
//    NSDictionary* dic = @{
//                          @"type" : str_All_count_type,
//                          @"share_type" : fenxiangType,
//                          @"share_user_id" : str_All_countShare_user_id,
//                          @"share_match_id" : str_All_countShare_match_id,
//                          @"share_alerts_id" : str_All_countShare_kuaixun_id,
//                          @"user_id" : str_login_id
//                          };
//    
//    [Request asiPost:dic WithUrl:@"Alerts_addShareLog" andSuccess:^(id responseObject) {
//        
//    } andfailure:^(NSString* error){
//        
//    }];
//}
//
//#pragma mark 加载网络数据
//- (void)loadscore_score_top_banner:(NSString*)type
//{
//    self.stradvtype=type;
//    HZAdvManageModel * hzadvmanage=[[HZAdvManageModel alloc]init];
//    hzadvmanage.type=type;
//    hzadvmanage.showWaiting=NO;
//    if ([hzadvmanage ReturnObj]!=nil)
//    {
//        self.stradvherf=[ComoneObject EmptyCheckobj:[[[hzadvmanage ReturnObj] valueForKey:@"data"] valueForKey:@"href"]];
//        self.stradvtitle=[ComoneObject EmptyCheckobj:[[[hzadvmanage ReturnObj] valueForKey:@"data"] valueForKey:@"title"]];
//        [btnAdv setImageWithURL:[NSURL URLWithString:[ComoneObject EmptyCheckobj:[[[hzadvmanage ReturnObj] valueForKey:@"data"] valueForKey:@"image"]]] forState:UIControlStateNormal];
//        btnAdv.imageView.contentMode=UIViewContentModeScaleAspectFill;
//        btnAdv.imageView.clipsToBounds=YES;
//    }
//    if ([DataManager sharedManager].is_showAdv==1)
//    {
//        self.stradvherf=@"http://app.huanhuba.com/app/Alerts/ContentById/id/8606/user_id/58445";
//        self.stradvtitle=@"发言须知";
//        [btnAdv setImageWithURL:[NSURL URLWithString:@"http://sapp.huanhuba.com/images/app_run/616f555d064bcdadf9faedaec26831e8.jpg"] forState:UIControlStateNormal];
//        btnAdv.imageView.contentMode=UIViewContentModeScaleAspectFill;
//        btnAdv.imageView.clipsToBounds=YES;
//    }
//    else
//    {
//        [MMRequest requestPost:hzadvmanage whenSuccess:^(HYModel *m, id res)
//         {
//             if ([DataManager sharedManager].is_showAdv==1)//审核模式
//             {
//                 self.stradvherf=@"http://app.huanhuba.com/app/Alerts/ContentById/id/8606/user_id/58445";
//                 self.stradvtitle=@"发言须知";
//                 [btnAdv setImageWithURL:[NSURL URLWithString:@"http://sapp.huanhuba.com/images/app_run/616f555d064bcdadf9faedaec26831e8.jpg"] forState:UIControlStateNormal];
//             }
//             else
//             {
//                 self.stradvherf=[ComoneObject EmptyCheckobj:[[res valueForKey:@"data"] valueForKey:@"href"]];
//                 self.stradvtitle=[ComoneObject EmptyCheckobj:[[res valueForKey:@"data"] valueForKey:@"title"]];
//                 [btnAdv setImageWithURL:[NSURL URLWithString:[ComoneObject EmptyCheckobj:[[res valueForKey:@"data"] valueForKey:@"image"]]] forState:UIControlStateNormal];
//                 
//             }
//             btnAdv.imageView.contentMode=UIViewContentModeScaleAspectFill;
//             btnAdv.imageView.clipsToBounds=YES;
//             if ([[res valueForKey:@"msg_code"] intValue]==9004)
//             {
//                 if ([[[res valueForKey:@"data"] valueForKey:@"show"] intValue]==0)
//                 {
//                     [self HideAdv];
//                     btnAdv.hidden=YES;
//                 }
//                 else
//                 {
//                     btnAdv.hidden=NO;
//                     [self ShowAdv];
//                 }
//                 NSLog(@"Aa--------%@----%@",type,res);
//             }
//             
//         } whenFailure:^(NSError *err) {
//             
//         }];
//    }
//}
//
//- (void)HideAdv
//{
//   
//}
//
//-(void)ShowAdv
//{
//}
//
//- (void)btnAdvClose
//{
//    [HZAdvManageModel SetAdvOff:self.stradvtype];
//    
//}
//
//-(void)PushByhref:(NSString *)href withtitle:(NSString *)strtitle
//{
//    if (href.length>4&&[[href substringToIndex:4] isEqualToString:@"http"]) //如果存在http:
//    {
//        ShowIOSAdvViewController* showIos = [[ShowIOSAdvViewController alloc] init];
//        showIos.shareurl = href;
//        showIos.title = strtitle;
//        [self.navigationController pushViewController:showIos animated:YES];
//    }
//    else
//    {
//        NSData * data= [[ComoneObject EmptyCheckobjnil :href] dataUsingEncoding:NSUTF8StringEncoding];
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        [self PushToAny:dict];
//    }
//    
//}
//
//- (void)ChickAdv
//{
//    [self PushByhref:self.stradvherf withtitle:self.stradvtitle];
//}
//
//#pragma mark 照相机
//#pragma mark SendMessViewDelegate
//- (void)btnCream
//{
//    
//    UIActionSheet* actiontxt = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"我要再想想" destructiveButtonTitle:nil otherButtonTitles:@"拍照上传", @"手机相册", nil];
//    actiontxt.tag = 10011;
//    [actiontxt setActionSheetStyle:UIActionSheetStyleDefault];
//    [actiontxt showInView:self.view]; //参数指显示UIActionSheet的parent。
//}
//
//-(void)btnAlertCream
//{
//    //    // 初始化
//    NSString *title = @"";
//    NSString *message = @"";
//    NSString *okButtonTitle = @"我要再想想";
//    NSString *neverButtonTitle = @"手机相册";
//    NSString *laterButtonTitle = @"拍照上传";
//    // 初始化
//    UIAlertController *alertDialog = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
//    
//    // 分别3个创建操作
//    UIAlertAction *laterAction = [UIAlertAction actionWithTitle:laterButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//        // 普通按键
//        [self SelCarmByIndex:0];
//    }];
//    UIAlertAction *neverAction = [UIAlertAction actionWithTitle:neverButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//        [self SelCarmByIndex:1];
//    }];
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:okButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//        // 取消按键
//    }];
//    
//    // 添加操作（顺序就是呈现的上下顺序）
//    [alertDialog addAction:laterAction];
//    [alertDialog addAction:neverAction];
//    [alertDialog addAction:okAction];
//    // 呈现警告视图
//    [self presentViewController:alertDialog animated:YES completion:nil];
//    
//}
//
//
//#pragma mark UIActionSheetDelegate
//- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    
//    if (actionSheet.tag == 10011) //文字
//    {
//        [self SelCarmByIndex:buttonIndex];
//    }
//    
//}
//
//- (void)SelCarmByIndex:(NSInteger)index
//{
//    switch (index) {
//        case 0:
//            
//            if ([UIImagePickerController isSourceTypeAvailable:
//                 UIImagePickerControllerSourceTypeCamera]) {
//                UIImagePickerController* picker =
//                [[UIImagePickerController alloc] init];
//                picker.delegate = self;
//                // 摄像头
//                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//                picker.allowsEditing = YES;
//                [self presentViewController:picker animated:YES completion:nil];
//            }
//            else {
//                [SVProgressHUD showErrorWithStatus:@"无摄像头"];
//            }
//            
//            break;
//            
//        case 1: {
//            if ([UIImagePickerController isSourceTypeAvailable:
//                 UIImagePickerControllerSourceTypePhotoLibrary]) {
//                UIImagePickerController* picker =
//                [[UIImagePickerController alloc] init];
//                picker.delegate = self;
//                // 图片库
//                picker.allowsEditing = YES;
//                picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//                [self presentViewController:picker animated:YES completion:nil];
//            }
//            else {
//                
//                [SVProgressHUD showErrorWithStatus:@"无法打开相册"];
//            }
//            
//        }
//            
//            break;
//        case 2:
//        {
//            [self dismissAcctionSheet];
//        }
//        break;
//    }
//}
//
//-(void)dismissAcctionSheet
//{
//    
//    
//}
//
//#pragma mark UIImagePickerControllerDelegate
//- (void)imagePickerController:(UIImagePickerController*)picker
//didFinishPickingMediaWithInfo:(NSDictionary*)info
//{
//    
//    UIImage* image = [info objectForKey:UIImagePickerControllerEditedImage];
//    
//    //[self performSelector:@selector(ProssImg:) withObject:image afterDelay:0.3];
//    [SVProgressHUD showWithStatus:@"正在处理图片"];
//    [NSThread detachNewThreadSelector:@selector(ProssImg:) toTarget:self withObject:image];
//    
//    [picker dismissViewControllerAnimated:YES completion:nil];
//    if (SYSTEMVERSION >= 7.0) {
//        [self.view bringSubviewToFront:viewState];
//    }
//}
//- (void)imagePickerControllerDidCancel:(UIImagePickerController*)picker
//{
//    [picker dismissViewControllerAnimated:YES completion:nil];
//    if (SYSTEMVERSION >= 7.0) {
//        [self.view bringSubviewToFront:viewState];
//    }
//    if (SYSTEMVERSION >= 7.0) {
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//    }
//    [self dismissAcctionSheet];
//}
//
//- (void)ProssImg:(UIImage*)images
//{
//    float imgpicwidth = images.size.width;
//    float imgpicheight = images.size.height;
//    NSData* imgdata = UIImageJPEGRepresentation(images, 1); //(images)
//    UIImage* img;
//    if (imgdata.length > 204704)
//    {
//        img = [images imageByScalingAndCroppingForSize:CGSizeMake(640, imgpicheight / (imgpicwidth / 640))];
//    }
//    else {
//        img = [images imageByScalingAndCroppingForSize:CGSizeMake(640, imgpicheight / (imgpicwidth / 640))];
//    }
//    [SVProgressHUD dismiss];
//    if (SYSTEMVERSION >= 7.0) {
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//    }
//    [self performSelectorOnMainThread:@selector(getimg:) withObject:img waitUntilDone:NO];
//
//
//}
//
//- (void)CancleCarme
//{
//}
//
//- (void)getimg:(UIImage*)img
//{
//    
//}
//
//-(void)PushToAny:(NSDictionary *)dic
//{
//    if ([[dic valueForKey:@"link_type"] intValue] == 10) //魔方
//    {
//        HZScoreCubeDetailVC* hzsocre = [[HZScoreCubeDetailVC alloc] init];
//        hzsocre.match_id = [[dic valueForKey:@"link_id"] intValue];
////        hzsocre.lottery_id = [[dic valueForKey:@"link_id2"] description];
////        hzsocre.strStypes = 1;
////        hzsocre.is_come = @"1";
//        [ComoneObject pushNextUIViewController:hzsocre myView:self.view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue] == 20) //快讯
//    {
//        if ([[dic valueForKey:@"expert_id"] intValue]>0)
//        {
//            HPVIPInfoVC *vipVC = [[HPVIPInfoVC alloc]init];
//            vipVC.expert_id=[[dic valueForKey:@"expert_id"] description];
//            vipVC.title =@"理财计划";
//            [self.navigationController pushViewController:vipVC animated:YES];
//        }
//        else
//        {
//            HZInfoHomeModel * hzinfomodel=[[HZInfoHomeModel alloc]init];
//            hzinfomodel.dyid=[[dic valueForKey:@"post_id"] intValue];
//            HZInfoSHomeDetailVC * hzinfovc=[[HZInfoSHomeDetailVC alloc]init];
//            hzinfovc.hzinfomodel=hzinfomodel;
//            hzinfovc.title=@"详情";
//            [ComoneObject pushNextUIViewController:hzinfovc myView:self.view];
//        }        
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue] == 30) //比赛
//    {
//        HZScoreCubeDetailVC* hzsocre = [[HZScoreCubeDetailVC alloc] init];
//        hzsocre.match_id = [[dic valueForKey:@"link_id"] intValue];
////        hzsocre.lottery_id = [[dic valueForKey:@"link_id2"] description];
////        hzsocre.strStypes = [dic[@"title"] intValue];
////        hzsocre.str_jc = [NSString stringWithFormat:@"%@",dic[@"expert_id"]];
//        [ComoneObject pushNextUIViewController:hzsocre myView:self.view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue] == 40) //推荐
//    {
//        HPOwnPageViewController* own = [[HPOwnPageViewController alloc] init];
//        own.userIDs = [[dic valueForKey:@"link_id"] intValue];
//        own.isshowyapan = YES;
//        own.type=@"";
//        [ComoneObject pushNextUIViewController:own myView:self.view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue] == 50) //名家
//    {
//        HZKickerViewController* hzkicker = [[HZKickerViewController alloc] init];
//        hzkicker.title = @"名家";
//        hzkicker.type = @"2";
//        hzkicker.delegate = self;
//        hzkicker.isGetTopView = YES;
//        hzkicker.lid = [ComoneObject EmptyCheckobj:[[dic objectForKey:@"link_id"] description]];
//        [ComoneObject pushNextUIViewController:hzkicker myView:self.view];
//        [hzkicker LoadData];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue] == 60) // 球队
//    {
//        HZTeamDetailViewController* hzteam = [[HZTeamDetailViewController alloc] init];
//        hzteam.title = @"球队";
//        hzteam.type = @"1";
//        hzteam.delegate = self;
//        hzteam.isGetTopView = YES;
//        hzteam.lid = [ComoneObject EmptyCheckobj:[[dic objectForKey:@"link_id"] description]];
//        [ComoneObject pushNextUIViewController:hzteam myView:self.view];
//        [hzteam LoadData];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue] == 70) // 跳转到网页
//    {
//        if ([dic valueForKey:@"partner_id"]!=nil)
//        {
//            //1、箱子 ,2、情报站 ,3、帖子  ,4、魔方,5、他的页面顶部广告,6、培训班顶部页面
//            if (![HPUserInfo isLogin])
//            {
//                [self NOLogin];
//                return;
//            }
//            [self PushInSideWeb:dic];
//            
//        }
//        else
//        {
//            NSString * strurl=[ComoneObject EmptyCheckobjnil:[dic valueForKey:@"jump_url"]];
//            if ([strurl rangeOfString:@"?"].location==NSNotFound) {
//                strurl=[NSString stringWithFormat:@"%@?login_id=%@&mf_token=%@",[ComoneObject EmptyCheckobj:[dic valueForKey:@"jump_url"]],[HPUserInfo getUserId],[HPUserInfo getToken]];
//            }
//            else
//            {
//                strurl=[NSString stringWithFormat:@"%@&login_id=%@&mf_token=%@",[ComoneObject EmptyCheckobj:[dic valueForKey:@"jump_url"]],[HPUserInfo getUserId],[HPUserInfo getToken]];
//            }
//            ShowIOSAdvViewController* showIos = [[ShowIOSAdvViewController alloc] init];
//            showIos.shareurl = strurl;
//            showIos.dicdata=dic;
//            showIos.title =[dic valueForKey:@"title"];
//            [ComoneObject pushNextUIViewController:showIos myView:self.view];
//        }
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue] == 80) //跳转到外部浏览器
//    {
//        if ([dic valueForKey:@"partner_id"]!=nil)
//        {
//            //1、箱子 ,2、情报站 ,3、帖子  ,4、魔方,5、他的页面顶部广告,6、培训班顶部页面 
//            if (![HPUserInfo isLogin])
//            {
//                [self NOLogin];
//                return;
//            }
//            [self PushOutSideWeb:dic];
//        }
//        else
//        {
//            NSString * strurl=[ComoneObject EmptyCheckobjnil:[dic valueForKey:@"jump_url"]];
//            if ([strurl rangeOfString:@"?"].location==NSNotFound) {
//                strurl=[NSString stringWithFormat:@"%@?login_id=%@&mf_token=%@",[ComoneObject EmptyCheckobj:[dic valueForKey:@"jump_url"]],[HPUserInfo getUserId],[HPUserInfo getToken]];
//            }
//            else
//            {
//                strurl=[NSString stringWithFormat:@"%@&login_id=%@&mf_token=%@",[ComoneObject EmptyCheckobj:[dic valueForKey:@"jump_url"]],[HPUserInfo getUserId],[HPUserInfo getToken]];
//            }
//            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strurl]];
//        }
//        
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue] ==90){//培训
//        
//        if([[DataManager sharedManager].h5_pxb integerValue]==1){
//            HPBaiJiaVC *vc=[[HPBaiJiaVC alloc]init];
//            vc.BJType=4;
//            vc.BJ_userId=[HPUserInfo getUserId];
////            vc.BJ_matchId=[NSString stringWithFormat:@"%d",self.match_id];
////            vc.BJ_dealerId=[NSString stringWithFormat:@"%@",dict[@"id"]];
//            [ComoneObject pushNextUIViewController:vc myView:self.view];
//        }else{
//        
//        HZScoreCubeDetailVC* hzsocre = [[HZScoreCubeDetailVC alloc] init];
//        hzsocre.match_id = [dic[@"link_id2"] intValue];
////        hzsocre.lottery_id = [NSString stringWithFormat:@"%@",dic[@"link_id"]];
////        hzsocre.strStypes = [dic[@"title"] intValue];
////        hzsocre.str_jc = @"1";
//        hzsocre.isscrolltoBottom=1;
//        [ComoneObject pushNextUIViewController:hzsocre myView:self.view];
//        }
//    }else if ([[dic valueForKey:@"link_type"] intValue]==100){//情报站首页
//        
//        HZInfoStationShowVC * hzinfo=[[HZInfoStationShowVC alloc]init];
//        hzinfo.str_stationid=[NSString stringWithFormat:@"%@",dic[@"link_id"]];
//        hzinfo.title=@" ";
//        [ComoneObject pushNextUIViewController:hzinfo myView:self.view];
//    }else if ([[dic valueForKey:@"link_type"] intValue]==110){//榜单//情报师
//        
////        HZIntelDivVC *tx=[[HZIntelDivVC alloc]init];
////        tx.title=@"情报师";
////        [ComoneObject pushNextUIViewController:tx myView:self.view];
//        if ([[dic valueForKey:@"link_id2"] intValue]==0) {
//
//            HZRecomSMGViewController * hzrecom=[[HZRecomSMGViewController alloc]init];
////            hzrecom.delegate =self;
//            hzrecom.bangDanType = BangDanTypeLatestBox;
//            hzrecom.lb_id=[[dic valueForKey:@"link_id"] intValue];
//            hzrecom.title=[NSString stringWithFormat:@"%@",[dic valueForKey:@"title"]];
//            [ComoneObject pushNextUIViewController:hzrecom myView:self.view];
//        }else if ([[dic valueForKey:@"link_id2"] intValue]==1){
//            
//            HZRecomSMGViewController * hzrem=[[HZRecomSMGViewController alloc]init];
//            hzrem.bangDanType = BangDanTypeSteady;
//            hzrem.lb_id=[[dic valueForKey:@"link_id"] intValue];
//            hzrem.template_id=[[dic valueForKey:@"link_id2"] intValue];
//            hzrem.title=[NSString stringWithFormat:@"%@",[dic valueForKey:@"title"]];
//            [ComoneObject pushNextUIViewController:hzrem myView:self.view];
//        }else if ([[dic valueForKey:@"link_id2"] intValue]==2){
//            
//            HZRecomSMGViewController * hzrem=[[HZRecomSMGViewController alloc]init];
////            hzrem.delegate =self;
//            hzrem.bangDanType = BangDanTypeYiYuan;
//            hzrem.lb_id=[[dic valueForKey:@"link_id"] intValue];
//            hzrem.template_id=[[dic valueForKey:@"link_id2"] intValue];
//            hzrem.title=[NSString stringWithFormat:@"%@",[dic valueForKey:@"title"]];
//            [ComoneObject pushNextUIViewController:hzrem myView:self.view];
//        }else if ([[dic valueForKey:@"link_id2"] intValue]==3){
//            HZRecomSMGViewController * hzrem=[[HZRecomSMGViewController alloc]init];
//            hzrem.bangDanType = BangDanTypeBright;
//            hzrem.lb_id=[[dic valueForKey:@"link_id"] intValue];
//            hzrem.template_id=[[dic valueForKey:@"link_id2"] intValue];
//            hzrem.title=[dic valueForKey:@"title"];
//            [ComoneObject pushNextUIViewController:hzrem myView:self.view];
//            
//        }else if ([[dic valueForKey:@"link_id2"] intValue]==4){
//            
//            if ([[dic valueForKey:@"link_id"] intValue]==11)
//            {
//                HZIntelDivVC *tx=[[HZIntelDivVC alloc]init];
//                tx.delegate = self;
//                tx.title=dic[@"title"];
//                [ComoneObject pushNextUIViewController:tx myView:self.view];
//            }
//            else
//            {
//            HZRecomSMGViewController * hzrem=[[HZRecomSMGViewController alloc]init];
//            hzrem.bangDanType = BangDanJCMJ;
//            hzrem.lb_id=[[dic valueForKey:@"link_id"] intValue];
//            hzrem.template_id=[[dic valueForKey:@"link_id2"] intValue];
//            hzrem.title=dic[@"title"];
//            [ComoneObject pushNextUIViewController:hzrem myView:self.view];
//            }
//        }else if ([[dic valueForKey:@"link_id2"] intValue]==5){
//        
//            HXTeXiangViewController *tx=[[HXTeXiangViewController alloc]init];
//            tx.title=[NSString stringWithFormat:@"%@",[dic valueForKey:@"title"]];
//            [ComoneObject pushNextUIViewController:tx myView:self.view];
//        }
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==120)//跳转到支付宝
//    {
//        HXMainPayVC * Intell=[[HXMainPayVC alloc]init];
//        Intell.title=@"充值";
//        [self.navigationController pushViewController:Intell animated:YES];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==130)//跳转到直播贴
//    {
//        HZSorceZhiBoViewController * hzzhibo=[[HZSorceZhiBoViewController alloc]init];
//        hzzhibo.matchId=[[dic valueForKey:@"link_id"] intValue];
//        hzzhibo.title=@"即时比分";
//        [ComoneObject pushNextUIViewController:hzzhibo myView:self.view];
//    }else if ([[dic valueForKey:@"link_type"] intValue]==140)//跳转到活动页
//    {
//    
//        HXActiveVC *lis=[[HXActiveVC alloc]init];
//        lis.title=@"发现活动";
//        [ComoneObject pushNextUIViewController:lis myView:self.view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==150)//跳转到VIP详情页
//    {
//        
//        HXHYDetileVC *hy=[[HXHYDetileVC alloc]init];
//        hy.type=[NSString stringWithFormat:@"%@",dic[@"link_id"]];
//        hy.extention=[NSString stringWithFormat:@"%@",dic[@"link_id2"]];
//        hy.title=@"详情";
//        [ComoneObject pushNextUIViewController:hy myView:self.view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==160)//跳转到百家奖堂话题列表
//    {
//        if (![HPUserInfo isLogin])
//        {
//            [self NOLogin];
//            return;
//        }
//        HPBaiJiaVC *vc=[[HPBaiJiaVC alloc]init];
//        vc.BJType=5;
//        vc.BJ_userId=[HPUserInfo getUserId];
//        [ComoneObject pushNextUIViewController:vc myView:self.view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==170)//跳转到百家奖堂耽搁话题
//    {
//        if (![HPUserInfo isLogin])
//        {
//            [self NOLogin];
//            return;
//        }
//        HPBaiJiaVC *vc=[[HPBaiJiaVC alloc]init];
//        vc.BJType=6;
//        vc.BJ_userId=[HPUserInfo getUserId];
//        vc.BJ_topicId=[[dic valueForKey:@"link_id"] description];
//        [ComoneObject pushNextUIViewController:vc myView:self.view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==180)//跳转到实时情报列表
//    {
//        HXQBQSViewController *qb=[[HXQBQSViewController alloc]init];
//        qb.isXieYi=1;
//        qb.title=@"实时情报";
//        [ComoneObject pushNextUIViewController:qb myView:self.view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==190)//跳转到游戏
//    {
//        if (![HPUserInfo isLogin])
//        {
//            HPLoginViewController* hplogin = [[HPLoginViewController alloc] init];
//            hplogin.delegate=self;
//            [ComoneObject presentModalViewController:hplogin myView:self.view];
//            return;
//        }
//        HPGamesVC * hzgame=[[HPGamesVC alloc]init];
//        hzgame.games_URL=[ComoneObject EmptyCheckobj:[dic valueForKey:@"jump_url"]];
//        hzgame.title=[ComoneObject EmptyCheckobj:[dic valueForKey:@"title"]];
//        [ComoneObject pushNextUIViewController:hzgame myView:self.view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==200)
//    {
//        if (![HPUserInfo isLogin])
//        {
//            [self NOLogin];
//            return;
//        }
//        HPBaiJiaVC *vc=[[HPBaiJiaVC alloc]init];
//        vc.BJType=7;
//        [ComoneObject pushNextUIViewController:vc myView:self.view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==210)//奖堂各种跳转
//    {
//        if (![HPUserInfo isLogin])
//        {
//            [self NOLogin];
//            return;
//        }
//        HPBaiJiaVC *vc=[[HPBaiJiaVC alloc]init];
//        vc.BJType=8;
//        if ([dic valueForKey:@"jumpInfo"]!=nil)
//        {
//            vc.Jumpurl=[dic valueForKey:@"jumpInfo"];
//        }
//        [ComoneObject pushNextUIViewController:vc myView:self.view];
//
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==220)//跳转到大转盘
//    {
//        if([[[[DataManager sharedManager].dicDataManager objectForKey:@"dzp_login"]description]integerValue]==1){
//            if (![HPUserInfo isLogin])
//            {
//                [self NOLogin];
//                return;
//            }
//        }
//        HDLotteryVC *lotteryVC = [[HDLotteryVC alloc]init];
//        lotteryVC.jump_url=[[dic valueForKey:@"jump_url"] description];
//        if ([dic valueForKey:@"jumpInfo"]!=nil)
//        {
//            lotteryVC.jumpInfo=[NSMutableDictionary dictionaryWithDictionary:[dic valueForKey:@"jumpInfo"]];
//            [lotteryVC.jumpInfo setObject:[HPUserInfo getUserId] forKey:@"user_id"];
//        }
//        [ComoneObject pushNextUIViewController:lotteryVC myView:self.view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==230)//跳转到情报师个人界面
//    {
//        HPOwnPageViewController* own = [[HPOwnPageViewController alloc] init];
//        own.userIDs =[[dic valueForKey:@"link_id"] intValue]; //情报师用户ID
//        own.isshowyapan = YES;
//        own.loadtypeui=1;
//        own.type=@"";
//        [ComoneObject pushNextUIViewController:own myView:self.view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==240)//跳转到情报贴
//    {
////        if (![HPUserInfo isLogin])
////        {
////            HPLoginViewController* hplogin = [[HPLoginViewController alloc] init];
////            hplogin.delegate=self;
////            [ComoneObject presentModalViewController:hplogin myView:self.view];
////            return;
////        }
////        HZInfoHomeModel * hzinfomodel=[[HZInfoHomeModel alloc]init];
////        hzinfomodel.dyid=[[dic valueForKey:@"link_id"] intValue]; //情报贴ID
////        hzinfomodel.loadDetailType=1;
////        hzinfomodel.price=1;
////        HXPayCubeModel *model=[[HXPayCubeModel alloc]init];
////        NSDictionary *dic=@{
////                            @"login_id":[HPUserInfo getUserId],
////                            @"oversea_info_id":[NSString stringWithFormat:@"%lu",(long)hzinfomodel.dyid]
////                            };
////        [model ShowPayInformationAlertViewWithData:dic withCellModel:hzinfomodel  withView:self.view withType:1 andSuccess:^{
////        } andFailure:^{
////        }];
////        //支付成功
////        model.sucess=^(id model){
////        };
//        HZInfoHomeModel * hzinfomodel=[[HZInfoHomeModel alloc]init];
//        hzinfomodel.dyid=[[dic valueForKey:@"link_id"] intValue]; //情报贴ID
//        hzinfomodel.loadDetailType=1;
//        hzinfomodel.price=@"1";
//
//        HZInfoSHomeDetailVC * hzinfovc=[[HZInfoSHomeDetailVC alloc]init];
//        hzinfovc.hzinfomodel=hzinfomodel;
//        hzinfovc.loadDetailType=1;
//        hzinfovc.title=@"详情";
//        [ComoneObject pushNextUIViewController:hzinfovc myView:self.view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==250)//跳转到情报箱 主要查看免费情报箱
//    {
//        IntelligenceDetailViewController* Intell = [[IntelligenceDetailViewController alloc] init];
//        Intell.ismebox = NO;
//        Intell.Myuserid = @"";
//        Intell.title = @"情报箱详情";
//        [ComoneObject pushNextUIViewController:Intell myView:self.view];
//        [Intell LoadRecom_boxDetailByRecId:[[dic valueForKey:@"link_id"] intValue] withBoxType:[[dic valueForKey:@"link_id2"] intValue] withpage:0];
//        [[NSNotificationCenter defaultCenter] postNotificationName:KRecomAttionLoad object:nil];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==260)//跳转到邀请有礼
//    {
//        if ([self IsLogin])
//        {
//            HXYQYLViewController *ya=[[HXYQYLViewController alloc]init];
//            ya.title=@"邀请有礼";
//            [ComoneObject pushNextUIViewController:ya myView:self.view];
//        }
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==270)//跳转到情报首页
//    {
//        InfoStationHomeViewController * infostaion=[[InfoStationHomeViewController alloc]init];
//        infostaion.title=@"情报站";
//        [ComoneObject pushNextUIViewController:infostaion myView:self.view];
//
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==280)//跳转到购彩蓝
//    {
//        HDCreateOrderWebViewVC * hdcate=[[HDCreateOrderWebViewVC alloc]init];
//        hdcate.shidanSuccessBlock=^(){
//            [self refreshRealOrderData];
//        };
//        hdcate.gendanSuccessBlock=^(){
//            [self refreshFollowOrderData];
//        };
//        hdcate.goucaiSuccessBlock=^(){
//            
//            [self refreshLotteryOrderData];
//        };
//        hdcate.jumpurl=[[dic valueForKey:@"jump_url"] description];
//        hdcate.followOrderDict = [NSMutableDictionary dictionaryWithDictionary:[dic valueForKey:@"followDict"]];
//        hdcate.buyLotteryDict = [dic valueForKey:@"lotteryDict"];
//        [ComoneObject pushNextUIViewController:hdcate myView:self.view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==290)//实单详情
//    {
//        HPRealOrderInfoVC *orderInfo = [[HPRealOrderInfoVC alloc]init];
//        orderInfo.str_order_id=[[dic valueForKey:@"link_id"] description];
//        [self.navigationController pushViewController:orderInfo animated:YES];
//
//    }else if ([[dic valueForKey:@"link_type"] intValue]==300)//新手引导
//    {
//        //新手引导
//        HDNewUserGuideVC *guideVC= [[HDNewUserGuideVC alloc]init];
//        [ComoneObject pushNextUIViewController:guideVC myView:self.view];
//        
//    }
////    //-------------
////    [HZAdvLogAddModel HZAdvLogAddModth:[NSString stringWithFormat:@"banner_%@",self.stradvtype]];
//
//}
//
//
//
//-(void)PushInSideWeb:(NSDictionary *)dic
//{
//    NSDictionary * dicparm=@{@"type":[dic valueForKey:@"type"]==nil?@"":[[dic valueForKey:@"type"] description],@"related_id": [dic valueForKey:@"related_id"]==nil?@"":[ComoneObject EmptyCheckobj:[dic valueForKey:@"related_id"]],@"user_id":[HPUserInfo getUserId],@"partner_id":[[dic valueForKey:@"partner_id"] description],@"bet_option":[dic valueForKey:@"bet_option"]==nil?@"":[[dic valueForKey:@"bet_option"] description],@"cai_type":[dic valueForKey:@"cai_type"]==nil?@"":[[dic valueForKey:@"cai_type"] description],@"from_type":[dic valueForKey:@"from_type"]==nil?@"":[[dic valueForKey:@"from_type"] description]};
//    NSMutableDictionary *tempparams=[NSMutableDictionary dictionaryWithDictionary:dicparm];
//    if ([HPUserInfo isLogin])
//    {
//        [tempparams setValue:[HPUserInfo getUserId] forKey:@"login_id"];
////        [tempparams setValue:[HPUserInfo getToken] forKey:@"mf_token"];
//    }
//    [tempparams setValue:MF_version forKey:@"versionNum"];
//    [tempparams setValue:@"ios" forKey:@"platform"];
//    [tempparams setValue:iostype forKey:@"iostype"];  //上线修改iostype＝1海宁账号 ＝0safina账号
//    [tempparams setValue:[SvUDIDTools UDID] forKey:@"idfa"];
//    
//    NSString* data = [Request converseToJson:tempparams];
//    NSString* signString = [NSString stringWithFormat:@"%@%@%@", [Request Returnsolcode:[DataManager sharedManager].yanzhicode withday:[[ComoneObject timeConversion:[DataManager sharedManager].yanzhitime style:@"4"] intValue]], data, [Request Returnsolcode:[DataManager sharedManager].yanzhicode withday:[[ComoneObject timeConversion:[DataManager sharedManager].yanzhitime style:@"4"] intValue]]];
//    NSString* sign = [Request getMd5_32Bit_String:signString];
//    
//    NSString * strurl=[ComoneObject EmptyCheckobjnil:[dic valueForKey:@"jump_url"]];
//    if ([strurl rangeOfString:@"?"].location==NSNotFound) {
//        strurl=[NSString stringWithFormat:@"%@?data=%@&sign=%@&platform=mofang&mf_token=%@",[ComoneObject EmptyCheckobj:[dic valueForKey:@"jump_url"]],[MMUntil URLEncodedString:data],sign,[HPUserInfo getToken]];
//    }
//    else
//    {
//        strurl=[NSString stringWithFormat:@"%@&data=%@&sign=%@&platform=mofang&mf_token=%@",[ComoneObject EmptyCheckobj:[dic valueForKey:@"jump_url"]],[MMUntil URLEncodedString:data],sign,[HPUserInfo getToken]];
//    }
//    ShowIOSAdvViewController* showIos = [[ShowIOSAdvViewController alloc] init];
//    showIos.shareurl = strurl;
//    showIos.dicdata=dic;
//    showIos.title =[dic valueForKey:@"title"];
//    [ComoneObject pushNextUIViewController:showIos myView:self.view];
//    
//}
//
//
//-(void)PushOutSideWeb:(NSDictionary *)dic
//{
//    NSDictionary * dicparm=@{@"type":[dic valueForKey:@"type"]==nil?@"":[[dic valueForKey:@"type"] description],@"related_id": [dic valueForKey:@"related_id"]==nil?@"":[ComoneObject EmptyCheckobj:[dic valueForKey:@"related_id"]],@"user_id":[HPUserInfo getUserId],@"partner_id":[[dic valueForKey:@"partner_id"] description],@"bet_option":[dic valueForKey:@"bet_option"]==nil?@"":[[dic valueForKey:@"bet_option"] description],@"cai_type":[dic valueForKey:@"cai_type"]==nil?@"":[[dic valueForKey:@"cai_type"] description],@"from_type":[dic valueForKey:@"from_type"]==nil?@"":[[dic valueForKey:@"from_type"] description]};
//    
//    NSMutableDictionary *tempparams=[NSMutableDictionary dictionaryWithDictionary:dicparm];
//    if ([HPUserInfo isLogin])
//    {
//        [tempparams setValue:[HPUserInfo getUserId] forKey:@"login_id"];
//    }
//    [tempparams setValue:MF_version forKey:@"versionNum"];
//    [tempparams setValue:@"ios" forKey:@"platform"];
//    [tempparams setValue:iostype forKey:@"iostype"];  //上线修改iostype＝1海宁账号 ＝0safina账号
//    [tempparams setValue:[SvUDIDTools UDID] forKey:@"idfa"];
//    
//    NSString* data = [Request converseToJson:tempparams];
//    NSString* signString = [NSString stringWithFormat:@"%@%@%@", [Request Returnsolcode:[DataManager sharedManager].yanzhicode withday:[[ComoneObject timeConversion:[DataManager sharedManager].yanzhitime style:@"4"] intValue]], data, [Request Returnsolcode:[DataManager sharedManager].yanzhicode withday:[[ComoneObject timeConversion:[DataManager sharedManager].yanzhitime style:@"4"] intValue]]];
//    NSString* sign = [Request getMd5_32Bit_String:signString];
//    
//    NSString * strurl=[ComoneObject EmptyCheckobjnil:[dic valueForKey:@"jump_url"]];
//    if ([strurl rangeOfString:@"?"].location==NSNotFound) {
//        strurl=[NSString stringWithFormat:@"%@?data=%@&sign=%@&platform=mofang&mf_token=%@",[ComoneObject EmptyCheckobj:[dic valueForKey:@"jump_url"]],[MMUntil URLEncodedString:data],sign,[HPUserInfo getToken]];
//    }
//    else
//    {
//        strurl=[NSString stringWithFormat:@"%@&data=%@&sign=%@&platform=mofang&mf_token=%@",[ComoneObject EmptyCheckobj:[dic valueForKey:@"jump_url"]],[MMUntil URLEncodedString:data],sign,[HPUserInfo getToken]];
//    }
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strurl]];
//
//}
//
//-(void)NOLogin
//{
//    HPLoginViewController* hplogin = [[HPLoginViewController alloc] init];
//    hplogin.delegate=self;
//    [ComoneObject presentModalViewController:hplogin myView:self.view];
//}
//
//-(BOOL)IsLogin
//{
//    if ([HPUserInfo isLogin])
//    {
//        return YES;
//    }
//    else
//    {
//        [self NOLogin];
//        return NO;
//    }
//}
//
//更换皮肤相关

- (void)configureViews
{
    topBarView.backgroundColor = [[ThemeManager sharedInstance] ReturnColorByTheme:TopBarColor withNightColor:TopBarColor_1];
    viewState.backgroundColor=[[ThemeManager sharedInstance] ReturnColorByTheme:TopBarColor withNightColor:TopBarColor_1];
    self.labBasetitle.textColor=[[ThemeManager sharedInstance] ReturnColorByTheme:TxtStandColor1_y withNightColor:Text_secondary_Color];

}

- (void)regitserAsObserver
{
//    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//    [center addObserver:self
//               selector:@selector(configureViews)
//                   name:ThemeDidChangeNotification
//                 object:nil];
}

- (void)unregisterAsObserver
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
}
//#pragma mark创建欢呼吧账号
//-(void)accountAlertShow:(NSDictionary *)dic{
//    NSString *logi= [ComoneObject getUnifyKey:@"login_enter_type"];
//    if ([dic[@"is_show"] integerValue]==1) {
//
//    if ([logi integerValue]==1) {
//                 [self pushtocreathhbnum];
//    }else{
//    _accountDic=[[NSMutableDictionary alloc]initWithDictionary:dic];
//         UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
//         view.backgroundColor=[Tool hexStringToColor:@"000000" thisAlpha:0.4];
//    HXCreathhbAlertView *a1=[[HXCreathhbAlertView alloc]init];
//    [a1.creatNewButton addTarget:self action:@selector(newbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
//    [a1.oldButton addTarget:self action:@selector(oldbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
//         [view addSubview:a1];
//    [a1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(25);
//        make.right.mas_equalTo(-25);
//        make.top.mas_equalTo(([UIScreen mainScreen].bounds.size.height)/4);
//    }];
//     [self.view addSubview:view];
//
//    }
//    }
//}
//-(void)pushtocreathhbnum{
//
//    HXCreathhbViewController* vc = [[HXCreathhbViewController alloc] init];
//    if ([_accountDic[@"nick_status"] integerValue] == 0) {
//        vc.can_edit = YES;
//    }
//    else {
//        
//        vc.can_edit = NO;
//    }
//    vc.usernameStr = _accountDic[@"nick_name"];
//    [ComoneObject pushNextUIViewController:vc myView:self.view];
//}
//-(void)newbuttonClick:(UIButton *)btn{
//    UIView *alert=(UIView *)btn.superview.superview;
//    [alert removeFromSuperview];
//        HXCreathhbViewController* vc = [[HXCreathhbViewController alloc] init];
//        if ([_accountDic[@"nick_status"] integerValue] == 0) {
//            vc.can_edit = YES;
//        }
//        else {
//            
//            vc.can_edit = NO;
//        }
//        vc.usernameStr = _accountDic[@"nick_name"];
//        [ComoneObject pushNextUIViewController:vc myView:self.view];
//}
//-(void)oldbuttonClick:(UIButton *)btn{
//
//    UIView *alert=(UIView *)btn.superview.superview;
//    [alert removeFromSuperview];
//    HXCreatNewNumVC *vc=[[HXCreatNewNumVC alloc]init];
//    vc.title=@"绑定欢呼吧账号";
//    [ComoneObject pushNextUIViewController:vc myView:self.view];
//}

@end
