//
//  BaseViewController.h
//  FootballCube
//
//  Created by Alex on 14-9-1.
//  Copyright (c) 2014年 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ShareSDK/ShareSDK.h"
//#import "MShareView.h"
//#import "HZAdvManageModel.h"
//#import "HXCreathhbAlertView.h"
//#import "HXCreatNewNumVC.h"
//#import "HPLoginViewController.h"
@interface BaseViewController : UIViewController <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    UIView* topBarView;
    UIView* viewState;
    //MShareView* shareSDKView;
    UIButton* saveBtnbase;
    UIButton* btnAdv;
    UIButton* backBtnBase;
    NSString* fenxiangType;
    NSString* mfORgr;
    NSString* str_All_countShare_user_id;
    NSString* str_All_countShare_kuaixun_id;
    NSString* str_All_countShare_match_id;
    NSString* str_All_countShare_login_id;
    NSString* str_All_count_type;
}
@property (nonatomic, strong) UILabel* labBasetitle;
@property (nonatomic, strong) NSString* match_ID_1;
@property (nonatomic, strong) NSString* user_ID_1;
@property (nonatomic, strong) NSString* stradvherf;
@property (nonatomic, strong) NSString* stradvtitle;
@property (nonatomic, strong) NSString* stradvtype;


- (void)PushToAny:(NSDictionary *)dic;
- (void)addBack;
- (void)HideAdv;
- (void)ShowAdv;
- (void)btnAdvClose;
- (void)addRightBtn:(NSString*)btnTitle;
- (void)hideRightBtn;
- (void)showRightBtn;
- (void)HideTabBar;
- (void)ShowTabBar;
- (void)chickRight;
- (void)Shareover;
- (void)ShowShareView:(BOOL)ShowToolBar;
- (void)hideShareView:(BOOL)hideToolBar;
- (BOOL)IsLogin;
- (void)shareChick:(NSInteger)indextype title:(NSString*)strTitle shareContent:(NSString*)strcontent withstrurl:(NSString*)strurl withImagePath:(id)Imgpath withtype:(NSInteger)type;
- (void)chickBack;
- (void)loadscore_score_top_banner:(NSString*)type;
- (void)ChickAdv;
- (void)btnCream;
- (void)getimg:(UIImage*)img;
- (void)initTopBar:(NSString*)str;
- (void)ShareSuccessBytag:(NSInteger)tag;
- (void)SelCarmByIndex:(NSInteger)index;
- (void)btnAlertCream;
- (void)imagePickerController:(UIImagePickerController*)picker
didFinishPickingMediaWithInfo:(NSDictionary*)info;
- (void)configureViews;
- (void)dismissAcctionSheet;
- (void)PushByhref:(NSString *)href withtitle:(NSString *)strtitle;
- (void)refreshRealOrderData;
- (void)refreshFollowOrderData;
- (void)refreshLotteryOrderData;
//绑定欢呼吧账号
-(void)accountAlertShow:(NSDictionary *)dic;
- (void)ShareSuccess;
- (void)ShareCancle;
- (void)ShareFail;


@property (nonatomic,strong) NSMutableDictionary * accountDic;
@end
