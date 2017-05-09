//
//  DataManager.h
//  QQTong
//
//  Created by yywang on 11-7-6.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject {
    NSMutableArray* ArryDataQi;
    NSMutableArray* arryDataID;
    NSMutableArray* arryNewDatas;
}
@property(nonatomic)NSInteger jfq_callback;
@property (nonatomic, retain) NSNumber* Gold;
@property (nonatomic, retain) NSNumber* MyGold; //我的金币
@property (nonatomic, retain) NSString* ServerTime;
@property (nonatomic, retain) NSString* myAllPoints;
@property (nonatomic, retain) NSString* my_Iphones_Num;
@property (nonatomic, retain) NSString* yanzhicode;
@property (nonatomic, retain) NSString* yanzhitime;
@property (nonatomic, retain) NSString* static_url;
@property (nonatomic, strong) NSString* my_Orders;
@property (nonatomic, strong) NSString* setHtml_URL_1;
@property (nonatomic, strong) NSString* setHtml_URL_2;
@property (nonatomic, strong) NSString* setHtml_URL_3;
@property (nonatomic, strong) NSString* setHtml_URL_4;
@property (nonatomic, strong) NSString* setHtml_URL_5;
@property (nonatomic, strong) NSString* setHtml_URL_6;
@property (nonatomic, strong) NSString* setHtml_URL_7;
@property (nonatomic, strong) NSString* setHtml_URL_8;
@property (nonatomic, strong) NSString* setHtml_URL_9;
@property (nonatomic, strong) NSString* setHtml_URL_10;
@property (nonatomic, strong) NSString* setHtml_URL_live_icon;
@property (nonatomic, strong) NSString* setHtml_URL_zqmf_icon;
@property (nonatomic, strong) NSString* setHtml_URL_train_icon;
@property (nonatomic,strong)  NSString * fatieHtml_URL;
@property (nonatomic,strong)  NSString * alipay_callback;
@property (nonatomic,strong)  NSMutableArray * array_icon;
@property (nonatomic,strong)  NSString * oddsstar_text;
@property (nonatomic,strong)  NSString * oddsstar_url;
@property (nonatomic,strong)  NSString * qutouzhu_text;
@property (nonatomic,strong)  NSString * qutouzhu_url;
@property (nonatomic,strong)  NSString * qutouzhu_jump;
@property (nonatomic,strong)  NSString * oddsstar_jump;
@property (nonatomic,strong)  NSString * h5_pxb;
@property (nonatomic,strong)  NSString * h5_jump_url;
@property (nonatomic,strong)  NSString * iconunitary;
@property (nonatomic,strong)  NSString * unitary_href;
@property (nonatomic,strong)  NSString * unitary_is_show;
@property (nonatomic,strong)  NSDictionary * dicDataManager;
@property (nonatomic,strong)  NSString * mofang_fee;
@property (nonatomic,strong)  NSString * magiccube_fee_text;
@property (nonatomic,strong)  NSString * magiccube_click_open;
@property (nonatomic,strong)  NSString * zqmf_fee_icon;
@property (nonatomic,strong)  NSString * recommended_market_agreement;
@property (nonatomic,strong)  NSString * recommended_market_agreement_alert_txt;
@property (nonatomic,strong)  NSString * recommended_market_agreement_txt;
@property (nonatomic,strong)  NSDictionary * dzq;
@property (nonatomic,strong)  NSString * isFW;  //是否属于跟单的白名单   0 ： 不属于，1：属于
@property (nonatomic,strong)  NSString * isPW;  //是否属于发单的白名单    0 ： 不属于，1：属于

@property (nonatomic)NSInteger inwhichvc; //0 登录界面 1注册界面
@property (nonatomic)NSInteger paywhich;//使用哪种支付方式 1易宝  0没使用任何
@property (nonatomic,strong)  NSDictionary * dicpay_show_ios;//用于判断使用那种支付方式

@property (nonatomic,strong) NSString * buy_agree_des;//同意优先使用钱包支付
@property (nonatomic,strong) NSString * buy_faile_des;//购买失败，建议使用钱包支付

@property (nonatomic,strong) NSString * mianze_Url;//免责声明URL

@property (nonatomic, strong) NSString* mf_icon_url;
@property (nonatomic) NSInteger cubindex;
@property (nonatomic) NSInteger cubtabselectindex;

@property (nonatomic, retain) NSArray* arryAttionId;
@property (nonatomic) BOOL ispay;
@property (nonatomic) BOOL isChangeView;
@property (nonatomic) BOOL iswx;
@property (nonatomic) BOOL isInMainView;
@property (nonatomic) BOOL isBackGuessView;
@property (nonatomic) BOOL isLoginWhichView;
@property (nonatomic) BOOL isLoginPaihang;
@property (nonatomic) BOOL ishuadong;
@property (nonatomic) BOOL iszhifubaoSuccess;
@property (nonatomic) BOOL issharesdk;
@property (nonatomic) BOOL isiap;
@property (nonatomic) BOOL isshowTop;
@property (nonatomic) BOOL isfromappurl;

@property (nonatomic) BOOL fenxiHuadong;
@property (nonatomic) int left_menu;
@property (nonatomic) int mofang_show;
@property (nonatomic) int is_showAdv;
@property (nonatomic) int is_show_yk;
@property (nonatomic) int is_showIOSAdv;
@property (nonatomic) int is_opentalkdata;
@property (nonatomic) BOOL is_choose;
@property (nonatomic) BOOL setFootFrame;
@property (nonatomic) BOOL setFrame_1;
@property (nonatomic) BOOL setFrameHistory_1;
@property (nonatomic) BOOL istongzhiCenter;
@property (nonatomic) BOOL toutiaoshouno;
@property (nonatomic) BOOL isloadingLogin;

+ (DataManager*)sharedManager;
- (NSMutableArray*)GetarryQi;
- (NSMutableArray*)getArrayID;
- (NSMutableArray*)getArrayNewDatas;
- (void)setIcon:(NSArray *)array;
/**  返回后台给的文字 客户端不再写死
 @param type 1 竞彩  2亚盘 3 大小球  4彩票
 
 @return
 */
-(NSString *)getGaming_nameBytype:(NSInteger)type;
@end
