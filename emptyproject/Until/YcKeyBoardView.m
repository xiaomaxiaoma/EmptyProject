//
//  YcKeyBoardView.m
//  KeyBoardAndTextView
//
//  Created by zzy on 14-5-28.
//  Copyright (c) 2014年 zzy. All rights reserved.
//

#import "YcKeyBoardView.h"

@interface YcKeyBoardView () <UITextFieldDelegate>
@property (nonatomic, assign) CGFloat textViewWidth;
@property (nonatomic, assign) BOOL isChange;
@property (nonatomic, assign) BOOL reduce;
@property (nonatomic, assign) CGRect originalKey;
@property (nonatomic, assign) CGRect originalText;
@end

@implementation YcKeyBoardView {
    NSString* kuaixun_id;
    NSString* isguanzhu;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [Tool hexStringToColor:@"cccccc" thisAlpha:1.0];
        //[self initTextView:frame];
    }
    return self;
}
- (void)initTextView:(UITextField*)fields kuaiXunID:(NSString*)my_id guanzhu:(NSString*)myGuanzhu
{
    isguanzhu = myGuanzhu;
    kuaixun_id = my_id;
    self.textfield_s = fields;
    self.textfield_s.delegate = self;
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(54, 6, 208 * hzbeishu, 38)];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.borderWidth = 1;
    view.layer.borderColor = [[Tool hexStringToColor:@"c7c7c7" thisAlpha:1.0] CGColor];
    [self addSubview:view];

    //    UIImageView *image_s = [[UIImageView alloc]initWithFrame:CGRectMake(5*hzbeishu, 7, 15, 15)];
    //    image_s.image = [UIImage imageNamed:@"jianpan_xie"];
    //    [view addSubview:image_s];

    UIButton* btndel = [UIButton buttonWithType:UIButtonTypeCustom];
    btndel.frame = CGRectMake(14 * hzbeishu, 16, 22, 20);
    btndel.backgroundColor = [UIColor clearColor];
    btndel.tag = 1001;

    if ([isguanzhu isEqualToString:@"1"]) {
        [btndel setImage:[UIImage imageNamed:@"yishoucang"] forState:UIControlStateNormal];
    }
    else {
        [btndel setImage:[UIImage imageNamed:@"my_guanzhuBtn"] forState:UIControlStateNormal];
    }
    [btndel addTarget:self action:@selector(guanzhu) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btndel];

    UIButton* fasong = [UIButton buttonWithType:UIButtonTypeCustom];
    fasong.frame = CGRectMake(view.frame.size.width + view.frame.origin.x + 6 * hzbeishu, 6, 48 * hzbeishu, 38);
    fasong.backgroundColor = [UIColor whiteColor];
    fasong.layer.borderWidth = 1;
    fasong.layer.borderColor = [[Tool hexStringToColor:@"c9c9c9" thisAlpha:1.0] CGColor];
    [fasong setTitle:@"发送" forState:UIControlStateNormal];

    fasong.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [fasong setTitleColor:[Tool hexStringToColor:@"999999" thisAlpha:1.0] forState:UIControlStateNormal];
    [fasong addTarget:self action:@selector(fasong) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:fasong];

    [view addSubview:fields];
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField
{

    if ([self.delegate respondsToSelector:@selector(keyBoardViewHide:textView:)]) {

        [self.delegate keyBoardViewHide:self textView:self.textfield_s];
    }

    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"执行le");
    if ([self.delegate respondsToSelector:@selector(keyBoardViewEndEdit)])
    {
        [self.delegate keyBoardViewEndEdit];
    }
}
-(void)needBangding:(NSDictionary *)dic{
    
//    HXCreathhbViewController *hhb=[[HXCreathhbViewController alloc]init];
//    hhb.usernameStr=dic[@"nick_name"];
//    [ComoneObject pushNextUIViewController:hhb myView:self];
//    if([dic[@"verify_account"] integerValue]==0){
//        HXCreathhbViewController *vc=[[HXCreathhbViewController alloc]init];
//        if ([dic[@"nick_status"] integerValue]==0) {
//            vc.can_edit=YES;
//        }else{
//            
//            vc.can_edit=NO;
//        }
//        vc.usernameStr=dic[@"nick_name"];
//        [ComoneObject pushNextUIViewController:vc myView:self];
//    }
    [self accountAlertShow:dic];
}
- (void)guanzhu
{

//    if (![HPUserInfo isLogin]) {
//        HPLoginViewController* hplogin = [[HPLoginViewController alloc] init];
//        hplogin.delegate = self;
//
//        [ComoneObject presentModalViewController:hplogin myView:self];
//        return;
//    }
//
//    UIButton* btn = (UIButton*)[self viewWithTag:1001];
//
//    NSDictionary* dicparm = @{ @"alerts_id" : kuaixun_id,
//        @"user_id" : [HPUserInfo getUserId] };
//    [Request asiPost:dicparm WithUrl:@"Alerts_addCollect" andSuccess:^(id responseObject) {
//        NSLog(@"%@",[responseObject objectForKey:@"status"]);
//        
//        NSString *str = [[responseObject objectForKey:@"status"] description];
//        if ([str isEqualToString:@"0"])
//        {
//            [SVProgressHUD showSuccessWithStatus:@"取消收藏"];
//            
//            [btn setImage:[UIImage imageNamed:@"my_guanzhuBtn"] forState:UIControlStateNormal];
//            
//        }else
//        {
//            [SVProgressHUD showSuccessWithStatus:@"收藏成功"];
//            [btn setImage:[UIImage imageNamed:@"yishoucang"] forState:UIControlStateNormal];
//            
//        
//        }
//        
//        [[NSNotificationCenter defaultCenter] postNotificationName:KTeamMainLoad object:nil];
//
//    } andfailure:^(NSString* error){
//
//    }];
}
- (void)fasong
{
    if ([self.delegate respondsToSelector:@selector(keyBoardViewHide:textView:)]) {

        [self.delegate keyBoardViewHide:self textView:self.textfield_s];
    }
}
@end
