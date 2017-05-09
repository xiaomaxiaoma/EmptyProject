//
//  HZStandSkinColor.h
//  FootballCube
//
//  Created by zoff on 16/3/30.
//  Copyright © 2016年 zoff. All rights reserved.
//

#ifndef HZStandSkinColor_h
#define HZStandSkinColor_h

#define TxtStandColor1    [Tool hexStringToColor:@"2d3859" thisAlpha:1.0]
#define TxtStandColor1_y  [Tool hexStringToColor:@"c2cce7" thisAlpha:1.0]
#define TxtStandColor1_q  [[ThemeManager sharedInstance] ReturnColorByTheme:TxtStandColor1 withNightColor:TxtStandColor1_y]

#define TxtStandColor2    [Tool hexStringToColor:@"596380" thisAlpha:1.0]
#define TxtStandColor2_y  [Tool hexStringToColor:@"8f9dbe" thisAlpha:1.0]
#define TxtStandColor2_q  [[ThemeManager sharedInstance] ReturnColorByTheme:TxtStandColor2 withNightColor:TxtStandColor2_y]

#define TxtStandColor3    [Tool hexStringToColor:@"9099b4" thisAlpha:1.0]
#define TxtStandColor3_y  [Tool hexStringToColor:@"667188" thisAlpha:1.0]
#define TxtStandColor3_q  [[ThemeManager sharedInstance] ReturnColorByTheme:TxtStandColor3 withNightColor:TxtStandColor3_y]

#define VBackStandColor1    [Tool hexStringToColor:@"ebebf2" thisAlpha:1.0]
#define VBackStandColor1_y  [Tool hexStringToColor:@"252e49" thisAlpha:1.0]
#define VBackStandColor1_q  [[ThemeManager sharedInstance] ReturnColorByTheme:VBackStandColor1 withNightColor:VBackStandColor1_y]

#define VBackStandColor2    [Tool hexStringToColor:@"efefef" thisAlpha:1.0]
#define VBackStandColor2_y  [Tool hexStringToColor:@"384670" thisAlpha:1.0]
#define VBackStandColor2_q  [[ThemeManager sharedInstance] ReturnColorByTheme:VBackStandColor2 withNightColor:VBackStandColor2_y]

#define VBackStandColor3    [Tool hexStringToColor:@"fafafa" thisAlpha:1.0]
#define VBackStandColor3_y  [Tool hexStringToColor:@"344066" thisAlpha:1.0]
#define VBackStandColor3_q  [[ThemeManager sharedInstance] ReturnColorByTheme:VBackStandColor3 withNightColor:VBackStandColor3_y]

#define VBackStandColorSearch    [Tool hexStringToColor:@"dddddd" thisAlpha:1.0]
#define VBackStandColorSearch_y  [Tool hexStringToColor:@"2d3859" thisAlpha:1.0]
#define VBackStandColorSearch_q  [[ThemeManager sharedInstance] ReturnColorByTheme:VBackStandColorSearch withNightColor:VBackStandColorSearch_y]

#define VBackStandColorWhite    [Tool hexStringToColor:@"ffffff" thisAlpha:1.0]
#define VBackStandColorWhite_y  [Tool hexStringToColor:@"2d3859" thisAlpha:1.0]
#define VBackStandColorWhite_q  [[ThemeManager sharedInstance] ReturnColorByTheme:VBackStandColorWhite withNightColor:TopBarColor_1]

#define VSeparatorColorStandColor  [Tool hexStringToColor:@"000000" thisAlpha:0.1]
#define VLineStandColor         [Tool hexStringToColor:@"000000" thisAlpha:0.2]

#define VStandColor_RedAlert    [Tool hexStringToColor:@"fe3824" thisAlpha:1.0]

#define VStandColor_GeenAlert   [Tool hexStringToColor:@"44db54" thisAlpha:1.0]

#define VStandColor_BlueButton  [Tool hexStringToColor:@"5682d9" thisAlpha:1.0]
#define VStandColor_YellowDark  [Tool hexStringToColor:@"ff9600" thisAlpha:1.0]
#define VStandColor_YellowLight [Tool hexStringToColor:@"f8b500" thisAlpha:1.0]
#define VStandColor_YellowDan   [Tool hexStringToColor:@"ffba3c" thisAlpha:1.0]
#define VStandColor_BlueLight   [Tool hexStringToColor:@"4285f4" thisAlpha:1.0]
#define VStandColor_BlueDark    [Tool hexStringToColor:@"5a6fb1" thisAlpha:1.0]
#define VStandColor_RedDark     [Tool hexStringToColor:@"e34444" thisAlpha:1.0]
#define VStandColor_RedLight    [Tool hexStringToColor:@"fd6e62" thisAlpha:1.0]
#define VStandColor_RedDan      [Tool hexStringToColor:@"e33c1c" thisAlpha:1.0]
#define VStandColor_GeenDark    [Tool hexStringToColor:@"4c994c" thisAlpha:1.0]
#define VStandColor_YellowLight_1 [Tool hexStringToColor:@"f8b500" thisAlpha:1.0]
#define VStandColor_OrangeLight [Tool hexStringToColor:@"e86516" thisAlpha:1.0]

#define TxtFontSTHeitiSC_Light(r)  [UIFont fontWithName:@"STHeitiSC-Light" size:(r)]

//魔方红色背景
#define VStand_Cube_RedColor  [Tool hexStringToColor:@"963030" thisAlpha:1.0]
//魔方蓝色背景
#define VStand_Cube_BlueColor [Tool hexStringToColor:@"364975" thisAlpha:1.0]
//魔方黄色背景
#define VStand_Cube_YellowColor [Tool hexStringToColor:@"F8B500" thisAlpha:1.0]


/**
 *  RGB 的颜色值
 */
#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]

/**
 *  Description
 */
#define CONTENT_FONT(size) [UIFont systemFontOfSize:size]

/**
 *  各部分颜色
 */
#define TextColorNome [Tool hexStringToColor:@"2d3859" thisAlpha:1.0] //平常的颜色色值显示
#define RowGaryColor [Tool hexStringToColor:@"ececec" thisAlpha:1.0] //行灰色
#define TextColorGaryNome [Tool hexStringToColor:@"999999" thisAlpha:1.0] //平常灰色
#define TextColorGarySelected [Tool hexStringToColor:@"666666" thisAlpha:1.0] //灰色选中
#define TextColorLightGary [Tool hexStringToColor:@"e5e5e5" thisAlpha:1.0] //灰色选中
#define GaryBackColor RGBACOLOR(230, 230, 230, 1)
#define LeftSideTableLineColor [Tool hexStringToColor:@"c2c2c2" thisAlpha:1.0]
#define LeftSideTableColor [Tool hexStringToColor:@"d7d7d7" thisAlpha:1.0]


/**
 *  账号密码默认线的颜色
 */

#define LINE_COLOR [Tool hexStringToColor:@"f1f1f1" thisAlpha:1.0]

/**
 *  倒计时的颜色
 */

#define DAOJISHI_COLOR [Tool hexStringToColor:@"dcdcdc" thisAlpha:1.0]

/**
 *  比赛的颜色
 */

#define MATCH_COLOR_ONE [Tool hexStringToColor:@"2d313c" thisAlpha:1.0]

#define MATCH_COLOR_TWO [Tool hexStringToColor:@"b5c3ce" thisAlpha:1.0]
/**
 *  红牌
 */
#define MATCH_COLOR_THREE [Tool hexStringToColor:@"ff2d2e" thisAlpha:1.0]
/**
 *  黄牌
 */
#define MATCH_COLOR_FOUR [Tool hexStringToColor:@"ffcd01" thisAlpha:1.0]

/**
 *  速查按钮字体颜色
 */
#define TEAMSC_COLOR_ONE [Tool hexStringToColor:@"353541" thisAlpha:1.0]
#define TEAMSC_COLOR_TWO [Tool hexStringToColor:@"dddddd" thisAlpha:1.0]
/**
 *  直播按钮默认字体颜色
 */
#define MATCH_COLOR_EIGHT [Tool hexStringToColor:@"8a9ec1" thisAlpha:1.0]
#define MATCH_COLOR_NINE [Tool hexStringToColor:@"666666" thisAlpha:1.0]

/**
 *  粗体字
 */
#define TextFontHelv_BOLD(m) [UIFont fontWithName:@"HelveticaNeue-Bold" size:(m)]
#define TextVerdana_BOLD(m)  [UIFont fontWithName:@"Arial-BoldMT" size:(m)]
#define TextArialMT(m)  [UIFont fontWithName:@"ArialMT" size:(m)]

#define TextFontPF_Mediem(m)   [UIFont boldSystemFontOfSize:(m)]
#define TextFontPF_Regular(m)  [UIFont systemFontOfSize:(m)]
#define TextFontPF_Semibold(m) [UIFont fontWithName:@"HelveticaNeue-Bold" size:(m)]

/**
 *   欧赔字体颜色
 */
#define OUPEI_COLOR [Tool hexStringToColor:@"cccccc" thisAlpha:1.0]
/**
 *   欧赔字体颜色
 */
#define OUPEI_YELLOW_COLOR [Tool hexStringToColor:@"f4cc1d" thisAlpha:1.0]

/**
 *  ***************    最新RGB色值    ***************
 */

// 浅红色   12
#define NEW_LightRed_Color [Tool hexStringToColor:@"d85757" thisAlpha:1.0]
// 浅青色   13
#define NEW_CyanBlue_Color [Tool hexStringToColor:@"4c994c" thisAlpha:1.0]




#endif /* HZStandSkinColor_h */
