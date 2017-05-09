//
//  DataManager.m
//  QQTong
//
//  Created by yywang on 11-7-6.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DataManager.h"
@implementation DataManager
@synthesize ServerTime, Gold, isBackGuessView, MyGold, myAllPoints, my_Iphones_Num, isLoginWhichView, isLoginPaihang, ishuadong, isChangeView, iszhifubaoSuccess, is_choose, setFootFrame, setFrame_1, setFrameHistory_1, my_Orders, fenxiHuadong, istongzhiCenter, issharesdk,setHtml_URL_1,setHtml_URL_2,setHtml_URL_3,setHtml_URL_4,setHtml_URL_5,setHtml_URL_6,setHtml_URL_7,setHtml_URL_8,setHtml_URL_9,setHtml_URL_10,mf_icon_url,setHtml_URL_live_icon,setHtml_URL_zqmf_icon,fatieHtml_URL,jfq_callback,alipay_callback,array_icon,oddsstar_jump,qutouzhu_jump,h5_pxb,h5_jump_url,mianze_Url,buy_agree_des,buy_faile_des,recommended_market_agreement_alert_txt,recommended_market_agreement,recommended_market_agreement_txt,isFW,isPW;
@synthesize yanzhicode, yanzhitime, cubindex, left_menu, ispay,isshowTop;
@synthesize iswx, isInMainView, mofang_show, is_showAdv, is_showIOSAdv, is_opentalkdata;
@synthesize static_url, toutiaoshouno,isiap,is_show_yk;
static DataManager* sharedDataManager = nil;
#pragma mark 单例方法

+ (DataManager*)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (sharedDataManager == nil) {
            sharedDataManager = [[DataManager alloc] init];
        }
    });
    return sharedDataManager;
}

- (NSMutableArray*)GetarryQi
{
    if (ArryDataQi == nil) {
        ArryDataQi = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return ArryDataQi;
}
- (void)setIcon:(NSArray *)array
{
    if (self.array_icon ==nil)
    {
        self.array_icon = [NSMutableArray array];
    }
    [self.array_icon removeAllObjects];
    [self.array_icon addObjectsFromArray:array];
}

- (NSMutableArray*)getArrayID
{
    if (arryDataID == nil) {
        arryDataID = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return arryDataID;
}
- (NSMutableArray*)getArrayNewDatas
{
    if (arryNewDatas == nil) {
        arryNewDatas = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return arryNewDatas;
}

+ (id)allocWithZone:(NSZone*)zone
{
    @synchronized(self)
    {
        if (sharedDataManager == nil) {
            sharedDataManager = [super allocWithZone:zone];
            return sharedDataManager;
        }
    }

    return nil;
}

- (id)copyWithZone:(NSZone*)zone
{
    return self;
}


/**
 @param type 1 竞彩  2亚盘 3 大小球  4彩票

 @return
 */
-(NSString *)getGaming_nameBytype:(NSInteger)type
{
    if ([[DataManager sharedManager].dicDataManager isKindOfClass:[NSDictionary class]])
    {
        switch (type) {
            case 1:
                return [[[DataManager sharedManager].dicDataManager valueForKey:@"gaming_name"] valueForKey:@"jc"]==nil?@"竞彩": [[[[DataManager sharedManager].dicDataManager valueForKey:@"gaming_name"] valueForKey:@"jc"] description];
                break;
            case 2:
                return [[[DataManager sharedManager].dicDataManager valueForKey:@"gaming_name"] valueForKey:@"yp"]==nil?@"竞彩亚盘":[[[[DataManager sharedManager].dicDataManager valueForKey:@"gaming_name"] valueForKey:@"yp"] description];
                break;

            case 3:
                return [[[DataManager sharedManager].dicDataManager valueForKey:@"gaming_name"] valueForKey:@"dxq"]==nil?@"大小球":[[[[DataManager sharedManager].dicDataManager valueForKey:@"gaming_name"] valueForKey:@"dxq"] description];
                break;

            case 4:
                return [[[DataManager sharedManager].dicDataManager valueForKey:@"gaming_name"] valueForKey:@"cp"]==nil?@"彩票":[[[[DataManager sharedManager].dicDataManager valueForKey:@"gaming_name"] valueForKey:@"cp"] description];
                break;
                
            case 5:
                return [[[DataManager sharedManager].dicDataManager valueForKey:@"gaming_name"] valueForKey:@"sd"]==nil?@"实单":[[[[DataManager sharedManager].dicDataManager valueForKey:@"gaming_name"] valueForKey:@"sd"] description];
                break;
            case 6:
                return [[[DataManager sharedManager].dicDataManager valueForKey:@"gaming_name"] valueForKey:@"sd"]==nil?@"让分":[[[[DataManager sharedManager].dicDataManager valueForKey:@"gaming_name"] valueForKey:@"rang_fen"] description];
                break;

            case 7:
                return [[[DataManager sharedManager].dicDataManager valueForKey:@"gaming_name"] valueForKey:@"sd"]==nil?@"大小分":[[[[DataManager sharedManager].dicDataManager valueForKey:@"gaming_name"] valueForKey:@"dx_fen"] description];
                break;


                
            default:
                break;
        }
    }
    return @"";

}

@end
