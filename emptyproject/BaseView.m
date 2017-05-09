//
//  BaseView.m
//  FootballCube
//
//  Created by zoff on 15/6/15.
//  Copyright (c) 2015年 zoff. All rights reserved.
//

#import "BaseView.h"
//#import "HPTeamXQViewController.h"
//#import "HPOwnPageViewController.h"
//#import "HZKickerViewController.h"
//#import "HZTeamDetailViewController.h"
//#import "ShowIOSAdvViewController.h"
//#import "HZInfoSHomeDetailVC.h"
//#import "HPVIPInfoVC.h"
//#import "HZInfoStationShowVC.h"
//#import "HZRecomSMGViewController.h"
//#import "HXTeXiangViewController.h"
//#import "HXActiveVC.h"
//#import "HXHYDetileVC.h"
//#import "HZScoreCubeDetailVC.h"
//#import "HPBaiJiaVC.h"
//#import "HZIntelDivVC.h"
//#import "HXQBQSViewController.h"
//#import "HXMainPayVC.h"
//#import "HDLotteryVC.h"
//#import "HXYQYLViewController.h"
//#import "InfoStationHomeViewController.h"
//#import "HDCreateOrderWebViewVC.h"
//#import "HPRealOrderInfoVC.h"
//#import "HDNewUserGuideVC.h"
@implementation BaseView


-(void)PushByhref:(NSString *)href withtitle:(NSString *)strtitle
{
//    if (href.length>4&&[[href substringToIndex:4] isEqualToString:@"http"]) //如果存在http:
//    {
//        ShowIOSAdvViewController* showIos = [[ShowIOSAdvViewController alloc] init];
//        showIos.shareurl = href;
//        showIos.title = strtitle;
//        [ComoneObject pushNextUIViewController:showIos myView:self];
//    }
//    else
//    {
//        NSData * data= [[ComoneObject EmptyCheckobjnil:href] dataUsingEncoding:NSUTF8StringEncoding];
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        [self PushToAny:dict];
//    }
    
}


-(void)PushToAny:(NSDictionary *)dic
{
    //[self PushToAny:dic withView:self];
}


//-(void)PushToAny:(NSDictionary *)dic withView:(UIView *)view
//{
//    if ([[dic valueForKey:@"link_type"] intValue] == 10) //魔方
//    {
//        HZScoreCubeDetailVC* hzsocre = [[HZScoreCubeDetailVC alloc] init];
//        hzsocre.match_id = [[dic valueForKey:@"link_id"] intValue];
////        hzsocre.lottery_id = [[dic valueForKey:@"link_id2"] description];
////        hzsocre.strStypes = 1;
////        hzsocre.is_come = @"1";
//        [ComoneObject pushNextUIViewController:hzsocre myView:view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue] == 20) //快讯
//    {
//        if ([[dic valueForKey:@"expert_id"] intValue]>0)
//        {
//            HPVIPInfoVC *vipVC = [[HPVIPInfoVC alloc]init];
//            vipVC.expert_id=[[dic valueForKey:@"expert_id"] description];
//            vipVC.title =@"理财计划";
//           [ComoneObject pushNextUIViewController:vipVC myView:view];
//        }
//        else
//        {
//            
//            HZInfoHomeModel * hzinfomodel=[[HZInfoHomeModel alloc]init];
//            hzinfomodel.dyid=[[dic valueForKey:@"post_id"] intValue];
//            HZInfoSHomeDetailVC * hzinfovc=[[HZInfoSHomeDetailVC alloc]init];
//            hzinfovc.hzinfomodel=hzinfomodel;
//            hzinfovc.title=@"详情";
//            [ComoneObject pushNextUIViewController:hzinfovc myView:view];
//        }
//
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue] == 30) //比赛
//    {
//        HZScoreCubeDetailVC* hzsocre = [[HZScoreCubeDetailVC alloc] init];
//        hzsocre.match_id = [[dic valueForKey:@"link_id"] intValue];
////        hzsocre.lottery_id = [[dic valueForKey:@"link_id2"] description];
////        hzsocre.strStypes = [dic[@"title"] intValue];
////        hzsocre.str_jc = [NSString stringWithFormat:@"%@",dic[@"expert_id"]];
//        [ComoneObject pushNextUIViewController:hzsocre myView:view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue] == 40) //推荐
//    {
//        HPOwnPageViewController* own = [[HPOwnPageViewController alloc] init];
//        own.userIDs = [[dic valueForKey:@"link_id"] intValue];
//        own.isshowyapan = YES;
//        own.type=@"";
//        [ComoneObject pushNextUIViewController:own myView:self];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue] == 50) //名家
//    {
//        HZKickerViewController* hzkicker = [[HZKickerViewController alloc] init];
//        hzkicker.title = @"名家";
//        hzkicker.type = @"2";
//        hzkicker.delegate = self;
//        hzkicker.isGetTopView = YES;
//        hzkicker.lid = [ComoneObject EmptyCheckobj:[[dic objectForKey:@"link_id"] description]];
//        [ComoneObject pushNextUIViewController:hzkicker myView:view];
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
//        [ComoneObject pushNextUIViewController:hzteam myView:view];
//        [hzteam LoadData];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue] == 70) // 跳转到网页
//    {
//        if ([dic valueForKey:@"partner_id"]!=nil)
//        {
//            //1、箱子 ,2、情报站 ,3、帖子  ,4、魔方,5、他的页面顶部广告,6、培训班顶部页面
//            if (![HPUserInfo isLogin])
//            {
//                [self NOLogin:view];
//                return;
//            }
//            [self PushInSideWeb:dic withview:view];
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
//
//            ShowIOSAdvViewController* showIos = [[ShowIOSAdvViewController alloc] init];
//            showIos.shareurl = strurl;
//            showIos.dicdata=dic;
//            showIos.title =[dic valueForKey:@"title"];
//            [ComoneObject pushNextUIViewController:showIos myView:view];
//        }
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue] == 80) //跳转到外部浏览器
//    {
//        if ([dic valueForKey:@"partner_id"]!=nil)
//        {
//            //1、箱子 ,2、情报站 ,3、帖子  ,4、魔方,5、他的页面顶部广告,6、培训班顶部页面
//            if (![HPUserInfo isLogin])
//            {
//                [self NOLogin:view];
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
//     else if ([[dic valueForKey:@"link_type"] intValue] ==90){//培训
//        
//         if([[DataManager sharedManager].h5_pxb integerValue]==1){
//             HPBaiJiaVC *vc=[[HPBaiJiaVC alloc]init];
//             vc.BJType=4;
//             vc.BJ_userId=[HPUserInfo getUserId];
//             //            vc.BJ_matchId=[NSString stringWithFormat:@"%d",self.match_id];
//             //            vc.BJ_dealerId=[NSString stringWithFormat:@"%@",dict[@"id"]];
//             [ComoneObject pushNextUIViewController:vc myView:view];
//         }else{
//         
//        HZScoreCubeDetailVC* hzsocre = [[HZScoreCubeDetailVC alloc] init];
//        hzsocre.match_id = [dic[@"link_id2"] intValue];
////        hzsocre.lottery_id = [NSString stringWithFormat:@"%@",dic[@"link_id"]];
////        hzsocre.strStypes = [dic[@"title"] intValue];
////        hzsocre.str_jc = @"1";
//        hzsocre.isscrolltoBottom=1;
//        [ComoneObject pushNextUIViewController:hzsocre myView:view];
//         }
//    }else if ([[dic valueForKey:@"link_type"] intValue]==100){//情报站首页
//        
//        HZInfoStationShowVC * hzinfo=[[HZInfoStationShowVC alloc]init];
//        hzinfo.str_stationid=[NSString stringWithFormat:@"%@",dic[@"link_id"]];
//        hzinfo.title=@" ";
//        [ComoneObject pushNextUIViewController:hzinfo myView:view];
//    }else if ([[dic valueForKey:@"link_type"] intValue]==110){//榜单//后来皮尔洛让换成情报师
//        
////        HZIntelDivVC *tx=[[HZIntelDivVC alloc]init];
////        tx.title=@"情报师";
////        [ComoneObject pushNextUIViewController:tx myView:self];
//        
//        if ([[dic valueForKey:@"link_id2"] intValue]==0) {
//            
//            HZRecomSMGViewController * hzrecom=[[HZRecomSMGViewController alloc]init];
//            hzrecom.bangDanType = BangDanTypeLatestBox;
//            hzrecom.lb_id=[[dic valueForKey:@"link_id"] intValue];
//            hzrecom.title=[NSString stringWithFormat:@"%@",[dic valueForKey:@"title"]];
//            [ComoneObject pushNextUIViewController:hzrecom myView:view];
//        }else if ([[dic valueForKey:@"link_id2"] intValue]==1){
//            
//            HZRecomSMGViewController * hzrem=[[HZRecomSMGViewController alloc]init];
//            hzrem.bangDanType = BangDanTypeSteady;
//            hzrem.lb_id=[[dic valueForKey:@"link_id"] intValue];
//            hzrem.template_id=[[dic valueForKey:@"link_id2"] intValue];
//            hzrem.title=[NSString stringWithFormat:@"%@",[dic valueForKey:@"title"]];
//            [ComoneObject pushNextUIViewController:hzrem myView:view];
//        }else if ([[dic valueForKey:@"link_id2"] intValue]==2){
//            
//            HZRecomSMGViewController * hzrem=[[HZRecomSMGViewController alloc]init];
//            hzrem.bangDanType = BangDanTypeYiYuan;
//            hzrem.lb_id=[[dic valueForKey:@"link_id"] intValue];
//            hzrem.template_id=[[dic valueForKey:@"link_id2"] intValue];
//            hzrem.title=[NSString stringWithFormat:@"%@",[dic valueForKey:@"title"]];
//            [ComoneObject pushNextUIViewController:hzrem myView:view];
//        }else if ([[dic valueForKey:@"link_id2"] intValue]==3){
//            HZRecomSMGViewController * hzrem=[[HZRecomSMGViewController alloc]init];
//            hzrem.bangDanType = BangDanTypeBright;
//            hzrem.lb_id=[[dic valueForKey:@"link_id"] intValue];
//            hzrem.template_id=[[dic valueForKey:@"link_id2"] intValue];
//            hzrem.title=[dic valueForKey:@"title"];
//            [ComoneObject pushNextUIViewController:hzrem myView:view];
//            
//        }else if ([[dic valueForKey:@"link_id2"] intValue]==4){
//            
//            if ([[dic valueForKey:@"link_id"] intValue]==11)
//            {
//                HZIntelDivVC *tx=[[HZIntelDivVC alloc]init];
//                tx.title=dic[@"title"];
//                [ComoneObject pushNextUIViewController:tx myView:view];
//            }
//            else
//            {
//                HZRecomSMGViewController * hzrem=[[HZRecomSMGViewController alloc]init];
//                hzrem.bangDanType = BangDanJCMJ;
//                hzrem.lb_id=[[dic valueForKey:@"link_id"] intValue];
//                hzrem.template_id=[[dic valueForKey:@"link_id2"] intValue];
//                hzrem.title=dic[@"title"];
//                [ComoneObject pushNextUIViewController:hzrem myView:view];
//            }
//
//        }else if ([[dic valueForKey:@"link_id2"] intValue]==5){
//            
//            HXTeXiangViewController *tx=[[HXTeXiangViewController alloc]init];
//            tx.title=[NSString stringWithFormat:@"%@",[dic valueForKey:@"title"]];
//            [ComoneObject pushNextUIViewController:tx myView:view];
//        }
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==120)//跳转到支付宝
//    {
//        HXMainPayVC * Intell=[[HXMainPayVC alloc]init];
//        Intell.title=@"充值";
//        [ComoneObject pushNextUIViewController:Intell myView:view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==130)//跳转到直播贴
//    {
//        HZSorceZhiBoViewController * hzzhibo=[[HZSorceZhiBoViewController alloc]init];
//        hzzhibo.matchId=[[dic valueForKey:@"link_id"] intValue];
//        hzzhibo.title=@"即时比分";
//        [ComoneObject pushNextUIViewController:hzzhibo myView:view];
//    }else if ([[dic valueForKey:@"link_type"] intValue]==140)//跳转到活动页
//    {
//        
//        HXActiveVC *lis=[[HXActiveVC alloc]init];
//        lis.title=@"发现活动";
//        [ComoneObject pushNextUIViewController:lis myView:view];
//    }else if ([[dic valueForKey:@"link_type"] intValue]==150)//跳转到VIP详情页
//    {
//        
//        HXHYDetileVC *hy=[[HXHYDetileVC alloc]init];
//        hy.type=[NSString stringWithFormat:@"%@",dic[@"link_id"]];
//        hy.extention=[NSString stringWithFormat:@"%@",dic[@"link_id2"]];
//        hy.title=@"详情";
//        [ComoneObject pushNextUIViewController:hy myView:view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==160)//跳转到百家奖堂话题列表
//    {
//        if (![HPUserInfo isLogin])
//        {
//            [self NOLogin:view];
//            return;
//        }
//        HPBaiJiaVC *vc=[[HPBaiJiaVC alloc]init];
//        vc.BJType=5;
//        vc.BJ_userId=[HPUserInfo getUserId];
//        [ComoneObject pushNextUIViewController:vc myView:view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==170)//跳转到百家奖堂耽搁话题
//    {
//        if (![HPUserInfo isLogin])
//        {
//            [self NOLogin:view];
//            return;
//        }
//        HPBaiJiaVC *vc=[[HPBaiJiaVC alloc]init];
//        vc.BJType=6;
//        vc.BJ_userId=[HPUserInfo getUserId];
//        vc.BJ_topicId=[[dic valueForKey:@"link_id"] description];
//        [ComoneObject pushNextUIViewController:vc myView:view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==180)//跳转到实时情报列表
//    {
//        HXQBQSViewController *qb=[[HXQBQSViewController alloc]init];
//        qb.isXieYi=1;
//        qb.title=@"实时情报";
//        [ComoneObject pushNextUIViewController:qb myView:view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==190)//跳转到游戏
//    {
//        if (![HPUserInfo isLogin])
//        {
//            HPLoginViewController* hplogin = [[HPLoginViewController alloc] init];
//            hplogin.delegate=self;
//            [ComoneObject presentModalViewController:hplogin myView:view];
//            return;
//        }
//        HPGamesVC * hzgame=[[HPGamesVC alloc]init];
//        hzgame.games_URL=[ComoneObject EmptyCheckobj:[dic valueForKey:@"jump_url"]];
//        hzgame.title=[ComoneObject EmptyCheckobj:[dic valueForKey:@"title"]];
//        [ComoneObject pushNextUIViewController:hzgame myView:view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==200)
//    {
//        if (![HPUserInfo isLogin])
//        {
//            [self NOLogin:view];
//            return;
//        }
//        HPBaiJiaVC *vc=[[HPBaiJiaVC alloc]init];
//        vc.BJType=7;
//        [ComoneObject pushNextUIViewController:vc myView:view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==210)
//    {
//        if (![HPUserInfo isLogin])
//        {
//            [self NOLogin:view];
//            return;
//        }
//        HPBaiJiaVC *vc=[[HPBaiJiaVC alloc]init];
//        vc.BJType=8;
//        if ([dic valueForKey:@"jumpInfo"]!=nil)
//        {
//            vc.Jumpurl=[dic valueForKey:@"jumpInfo"];
//        }
//        [ComoneObject pushNextUIViewController:vc myView:view];
//        
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==220)//跳转到大转盘
//    {
//        if([[[[DataManager sharedManager].dicDataManager objectForKey:@"dzp_login"]description]integerValue]==1){
//            if (![HPUserInfo isLogin])
//            {
//                [self NOLogin:view];
//                return;
//            }
//        }
//        HDLotteryVC *lotteryVC = [[HDLotteryVC alloc]init];
//        lotteryVC.jump_url=[[dic valueForKey:@"jump_url"] description];
//        if ([dic valueForKey:@"jumpInfo"]!=nil)
//        {
//            lotteryVC.jumpInfo=[NSMutableDictionary dictionaryWithDictionary:[dic valueForKey:@"jumpInfo"]];
//            
//            [lotteryVC.jumpInfo setObject:[HPUserInfo getUserId] forKey:@"user_id"];
//        }
//        [ComoneObject pushNextUIViewController:lotteryVC myView:view];
//        
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==230)//跳转到情报师个人界面
//    {
//        HPOwnPageViewController* own = [[HPOwnPageViewController alloc] init];
//        own.userIDs =[[dic valueForKey:@"link_id"] intValue]; //情报师用户ID
//        own.isshowyapan = YES;
//        own.loadtypeui=1;
//        own.type=@"";
//        [ComoneObject pushNextUIViewController:own myView:view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==240)//跳转到情报贴
//    {
////        if (![HPUserInfo isLogin])
////        {
////            HPLoginViewController* hplogin = [[HPLoginViewController alloc] init];
////            hplogin.delegate=self;
////            [ComoneObject presentModalViewController:hplogin myView:self];
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
////        [model ShowPayInformationAlertViewWithData:dic withCellModel:hzinfomodel  withView:self withType:1 andSuccess:^{
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
//        [ComoneObject pushNextUIViewController:hzinfovc myView:view];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==250)//跳转到情报箱 主要查看免费情报箱
//    {
//        IntelligenceDetailViewController* Intell = [[IntelligenceDetailViewController alloc] init];
//        Intell.ismebox = NO;
//        Intell.Myuserid = @"";
//        Intell.title = @"情报箱详情";
//        [ComoneObject pushNextUIViewController:Intell myView:self];
//        [Intell LoadRecom_boxDetailByRecId:[[dic valueForKey:@"link_id"] intValue] withBoxType:[[dic valueForKey:@"link_id2"] intValue] withpage:0];
//        [[NSNotificationCenter defaultCenter] postNotificationName:KRecomAttionLoad object:nil];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==260)//跳转到邀请有礼
//    {
//        if (![HPUserInfo isLogin])
//        {
//            [self NOLogin:view];
//            return;
//        }
//        HXYQYLViewController *ya=[[HXYQYLViewController alloc]init];
//        ya.title=@"邀请有礼";
//        [ComoneObject pushNextUIViewController:ya myView:self];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==270)//跳转到情报首页
//    {
//        InfoStationHomeViewController * infostaion=[[InfoStationHomeViewController alloc]init];
//        infostaion.title=@"情报站";
//        [ComoneObject pushNextUIViewController:infostaion myView:self];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==280)//跳转到购彩蓝
//    {
//        HDCreateOrderWebViewVC * hdcate=[[HDCreateOrderWebViewVC alloc]init];
//        hdcate.jumpurl=[[dic valueForKey:@"jump_url"] description];
//        [ComoneObject pushNextUIViewController:hdcate myView:self];
//    }
//    else if ([[dic valueForKey:@"link_type"] intValue]==290)//实单详情
//    {
//        HPRealOrderInfoVC *orderInfo = [[HPRealOrderInfoVC alloc]init];
//        orderInfo.str_order_id=[[dic valueForKey:@"link_id"] description];
//        [ComoneObject pushNextUIViewController:orderInfo myView:self];
//        
//    }else if ([[dic valueForKey:@"link_type"] intValue]==300)//新手引导
//    {
//        //新手引导
//        HDNewUserGuideVC *guideVC= [[HDNewUserGuideVC alloc]init];
//        [ComoneObject pushNextUIViewController:guideVC myView:view];
//        
//    }
//
//}

-(void)PushInSideWeb:(NSDictionary *)dic withview:(UIView *)view
{
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
//    
//    NSString* data = [Request converseToJson:tempparams];
//    NSString* signString = [NSString stringWithFormat:@"%@%@%@", [Request Returnsolcode:[DataManager sharedManager].yanzhicode withday:[[ComoneObject timeConversion:[DataManager sharedManager].yanzhitime style:@"4"] intValue]], data, [Request Returnsolcode:[DataManager sharedManager].yanzhicode withday:[[ComoneObject timeConversion:[DataManager sharedManager].yanzhitime style:@"4"] intValue]]];
//    NSString* sign = [Request getMd5_32Bit_String:signString];
//    
//    NSString * strurl=[ComoneObject EmptyCheckobjnil:[dic valueForKey:@"jump_url"]];
//    if ([strurl rangeOfString:@"?"].location==NSNotFound) {
//       strurl=[NSString stringWithFormat:@"%@?data=%@&sign=%@&platform=mofang&mf_token=%@",[ComoneObject EmptyCheckobj:[dic valueForKey:@"jump_url"]],[MMUntil URLEncodedString:data],sign,[HPUserInfo getToken]];
//    }
//    else
//    {
//        strurl=[NSString stringWithFormat:@"%@&data=%@&sign=%@&platform=mofang&mf_token=%@",[ComoneObject EmptyCheckobj:[dic valueForKey:@"jump_url"]],[MMUntil URLEncodedString:data],sign,[HPUserInfo getToken]];
//    }
//    ShowIOSAdvViewController* showIos = [[ShowIOSAdvViewController alloc] init];
//    showIos.shareurl = strurl;
//    showIos.dicdata=dic;
//    showIos.title =[dic valueForKey:@"title"];
//    [ComoneObject pushNextUIViewController:showIos myView:view];

}


-(void)PushOutSideWeb:(NSDictionary *)dic
{
//    NSDictionary * dicparm=@{@"type":[dic valueForKey:@"type"]==nil?@"":[[dic valueForKey:@"type"] description],@"related_id": [dic valueForKey:@"related_id"]==nil?@"":[ComoneObject EmptyCheckobj:[dic valueForKey:@"related_id"]],@"user_id":[HPUserInfo getUserId],@"partner_id":[[dic valueForKey:@"partner_id"] description],@"bet_option":[dic valueForKey:@"bet_option"]==nil?@"":[[dic valueForKey:@"bet_option"] description],@"cai_type":[dic valueForKey:@"cai_type"]==nil?@"":[[dic valueForKey:@"cai_type"] description],@"from_type":[dic valueForKey:@"from_type"]==nil?@"":[[dic valueForKey:@"from_type"] description]};
//   
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
//         strurl=[NSString stringWithFormat:@"%@&data=%@&sign=%@&platform=mofang&mf_token=%@",[ComoneObject EmptyCheckobj:[dic valueForKey:@"jump_url"]],[MMUntil URLEncodedString:data],sign,[HPUserInfo getToken]];
//    }
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strurl]];
//    
}

//-(void)NOLogin:(UIView *)view
//{
//    HPLoginViewController* hplogin = [[HPLoginViewController alloc] init];
//    hplogin.delegate=self;
//    [ComoneObject presentModalViewController:hplogin myView:view];
//}
//#pragma mark创建欢呼吧账号
//-(void)accountAlertShow:(NSDictionary *)dic{
//     NSString *logi= [ComoneObject getUnifyKey:@"login_enter_type"];
//    if ([dic[@"is_show"] integerValue]==1) {
//        if ([logi integerValue] == 1) {
//            
//            HXCreathhbViewController* vc = [[HXCreathhbViewController alloc] init];
//            if ([_accountDic[@"nick_status"] integerValue] == 0) {
//                vc.can_edit = YES;
//            }
//            else {
//                
//                vc.can_edit = NO;
//            }
//            vc.usernameStr = _accountDic[@"nick_name"];
//            [ComoneObject pushNextUIViewController:vc myView:self];
//            //[self newbuttonClick:nil];
//        }else{
//            
//            _accountDic=[[NSMutableDictionary alloc]initWithDictionary:dic];
//            UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
//            view.backgroundColor=[Tool hexStringToColor:@"000000" thisAlpha:0.4];
//            HXCreathhbAlertView *a1=[[HXCreathhbAlertView alloc]init];
//            [a1.creatNewButton addTarget:self action:@selector(newbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
//            [a1.oldButton addTarget:self action:@selector(oldbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
//            [view addSubview:a1];
//            [a1 mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.left.mas_equalTo(25);
//                make.right.mas_equalTo(-25);
//                make.top.mas_equalTo(([UIScreen mainScreen].bounds.size.height)/4);
//            }];
//            id object = [self nextResponder];
//            
//            while (![object isKindOfClass:[UIViewController class]] &&
//                   
//                   object != nil) {
//                
//                object = [object nextResponder];
//            }
//            
//            UIViewController* uc = (UIViewController*)object;
//            [uc.view addSubview:view];
//            
//            
//        }
//    }
//}
//-(void)newbuttonClick:(UIButton *)btn{
//    UIView *alert=(UIView *)btn.superview.superview;
//    [alert removeFromSuperview];
//    HXCreathhbViewController* vc = [[HXCreathhbViewController alloc] init];
//    if ([_accountDic[@"nick_status"] integerValue] == 0) {
//        vc.can_edit = YES;
//    }
//    else {
//        
//        vc.can_edit = NO;
//    }
//    vc.usernameStr = _accountDic[@"nick_name"];
//    [ComoneObject pushNextUIViewController:vc myView:self];
//}
//-(void)oldbuttonClick:(UIButton *)btn{
//    
//    UIView *alert=(UIView *)btn.superview.superview;
//    [alert removeFromSuperview];
//    HXCreatNewNumVC *vc=[[HXCreatNewNumVC alloc]init];
//    vc.title=@"绑定欢呼吧账号";
//    [ComoneObject pushNextUIViewController:vc myView:self];
//}
@end
