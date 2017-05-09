//
//  MFound.h
//  ModelPlatform
//
//  Created by XuMing on 13-5-31.
//  Copyright (c) 2013年 XuMing. All rights reserved.
//
//上线修改  公司： 9329de02e3bfb3 7c787fa3cc  Inhouse：5eeafc3dbed6ed3ddfd08435    测试 1c8b3dea4019d16892e4cf93 友盟 5434ada0fd98c5f9a203d358   TM：0c09688622383e9cc6642b8e  hhbfootballclube:1e38922c5430b3c82cd268ef com.hennin.footballclube:c8f0313f60ea05e205bf912a
//上线修改 唯一识别：  公司：com.huanhuba.footballcube  Inhouse：app.huanhuba.football com.huanhuba.zqmftm          com.hhb.footballclube   海宁账号 com.hennin.footballclube  竞彩店足球魔方com.hhb.jczqmf20160601   测试 057e981bf384d0c3eeb6106b
//http://app.huanhuba.com/iverson.txt   http://apptest.huanhuba.com/api_dunga.txt
/**
 *  小米 Debug/Online     pro 文件  Dis  hhbfootballclubedis/dev／inhouse      Bundle identifier：com.hhb.footballclube  appstore  yujingyi
 
 
                                 inhouse 证书   Mfootballdis      Bundle identifier：app.huanhuba.football
 
 *
 *  footballclube
 *  小米AppID：2882303761517299458
 *  AppKey:5101729968458
 *
 *  com.hhb.footballclube
 *  小米AppID： 2882303761517365067
 *  AppKey： 5751736575067
 *
 *   海宁账号
 *   AppID： 2882303761517377202
 *   AppKey： 5661737711202
 *  
 *   KeychainAccessGroups  com.hhb.footballclube 为F428E4W2RD.com.hhb.footballclube
                           com.hennin.footballclube 为 NL5ZA45HL7.com.hennin.footballclube
 */




//#define SERVER_URL @"http://appdev.huanhuba.com/app/" //联调接口
//#define SERVER_URL @"http://preapp.huanhuba.com/app/" //预发布版本/接口
//#define SERVER_URL   @"http://app.huanhuba.com/app/" //上线修改
#define SERVER_URL   @"https://app.huanhuba.com/app/" //上线修改  https 使用这个


#define SERVERChat_URL  @"http://115.29.164.163:8008/" //情报大厅接口地址
//#define SERVERJfq_URL   @"http://appdev.huanhuba.com/" //积分墙
#define SERVERJfq_URL   @"https://app.huanhuba.com/" //积分墙


#define UMENG_APPKEY @"5760f00ee0f55a0daa001359"
#define UMENG_channelId @"AppStore" //上线修改  渠道  In_house  QQqun weixin AppStore tieba AppStoreTM
#define kappid @"1124313468" //上线修改 910000001  910000002   910000003  1022779407- >yujingyi  1033052570->henin

#define MF_version @"3.02" //上线修改


#define iostype @"4"   //上线修改 1足球彩票魔方 0足球魔方社区 2情报市场 3我爱竞彩店 4马甲版乌学宁账号 5马甲版张亮账号 6马甲版大罗账号 7 官方版本
#define kuaixudown_version @"1.0" //下载文件包的版本号  上线看情况修改

#define HzbundleIdentifier @"com.hhb.footballclube" //唯一标识别 用于点评 点评都是跳转到IOS
//#define QX_BANBEN @"2.0"//
#define KNoWiFi     @"未获取到数据"
#define KShowNoMore @"别费力气了，暂时就这么多！"
#define Kyoukemess  @"游客模式下无法查看，请绑定账户"
//上线 app store
#define SINA_WEIBO_CALLBACK @"http://www.huanhuba.com/sina/oauth"
//com.sina.weibo.SNWeiboSDKDemo
#define kAppKey @"903194815"
#define kRedirectURI @"https://api.weibo.com/oauth2/default.html"
#define KmingCachePath @"com.hackemist.SDWebImageCache.default"
//qq互联
#define QQ_APPID @"100417750"
#define QQ_APPKEY @"b187231583d23b44af4dc79e0a75c9f8"

#define SERVER_IP @"112.124.122.119" // socket  链接地址
#define SERVER_PORT 10086


#define kimghead @"head@2x.jpg"
#define kimgmoren @"alerts_default.png"
#define HUANHUBI @"魔币"
#define KRecomBoxIdCun @"KRecomBoxIdCun"




/**
 *  硬件宽度
 */
#define DEVICE_WIDTH   (([[UIScreen mainScreen] bounds].size.width<[[UIScreen mainScreen] bounds].size.height)?[[UIScreen mainScreen] bounds].size.width:((SYSTEMVERSION)?[[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.height - 20))
/**
 *  硬件高度
 */
#define DEVICE_HEIGHT  (([[UIScreen mainScreen] bounds].size.width<[[UIScreen mainScreen] bounds].size.height)?((SYSTEMVERSION) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.height - 20):[[UIScreen mainScreen] bounds].size.width)


//#define DEVICE_WIDTH [[UIScreen mainScreen] bounds].size.width
///**
// *  硬件高度
// */
//#define DEVICE_HEIGHT ((SYSTEMVERSION) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.height - 20)
//

/**
 *  系统版本的判断
 */
#define SYSTEMVERSION [[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0
#define SYSTEMVERSIONUPLOAD [[[UIDevice currentDevice] systemVersion] doubleValue] < 7.0

/**
 *
 */
#define BAR_HEIGHT ((SYSTEMVERSION) ? 64.0 : 44.0) //狂想高度 IOS7 高度加上了电池栏
#define VIEW_HEIGHT ((SYSTEMVERSION) ? DEVICE_HEIGHT - BAR_HEIGHT : DEVICE_HEIGHT - BAR_HEIGHT - 20) //view高度
/**
 *  判读一个字符串是否为空自 字符  为空为YES  不为空为NO
 */
#define CHECK_STRING(str) ([(str)length] ? YES : NO)
/**
 *  控件定位的时候需要用到  IOS7 高度加上了电池栏
 */
#define TopDistin(r) ((SYSTEMVERSION) ? (20 + (r)) : (r))

/**
 *  倒计时时间的设置
 */
#define DAOJISHI_time 60
/**
 *  Tab的高度
 */
#define tabheight 49

#define hzbeishu (DEVICE_WIDTH / 320)
#define hzbeishugao (DEVICE_HEIGHT/480)

#define hzbeishu_iphone6 (DEVICE_WIDTH / 375)  //667
#define hzbeishu_iphone6_H (DEVICE_HEIGHT / 667)  //667

//SqlLite
#define DATABASE_PATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingString:@"/weChat.db"]
//FMDB
#define FMDBQuickCheck(SomeBool) { if (!(SomeBool)) { NSLog(@"Failure on line %d", __LINE__); abort(); } }


#define msgcode @"msg_code"
/**
 *  用户相关信息
 */
#define MbadgeValue @"MbadgeValue"
#define UserID @"user_id"
#define user_info @"userInfo" //保存用户信息
#define KGetPush @"GetPush" //保存用户信息
#define MBackOn @"MBackOn" //进入后台
#define MBecomeActive @"BecomeActive" //进入后台
#define usersetAttion @"usersetAttion" //保存用户信息
#define hzSoreSaiSelect @"hzSoreSaiSelect_v2" //联赛选择记录数据
//推荐
#define KRecomStp @"RecomStp"
#define KRecomFree @"RecomFree"
#define KRecomLeage @"RecomLeage"
#define KRecomQBLeage @"KRecomQBLeage"
#define KRecomMainLoad @"KRecomMainLoad"
#define KRecomMarkLoad @"KRecomMarkLoad"
#define KRecomAttionLoad @"KRecomAttionLoad"
#define KRecomMainLoad2 @"KRecomMainLoad2"//推荐市场关注刷新
#define KTeamSelect @"KTeamSelect"
#define KTeamMainLoad @"KTeamMainLoad"
#define KTeamCountLoad @"KTeamCountLoad"



