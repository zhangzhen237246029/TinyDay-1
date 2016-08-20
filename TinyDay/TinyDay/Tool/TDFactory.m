//
//  Factory.m
//  GameLive
//

//  Created by tarena31 on 16/8/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TDFactory.h"

@implementation TDFactory

+(void)addPopBackItemForVC:(UIViewController *)vc{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back_2"] forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back_1"] forState:UIControlStateHighlighted];
    backBtn.frame =  CGRectMake(0, 0, 44, 44);
    [backBtn bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;
    vc.navigationItem.leftBarButtonItems = @[spaceItem,backItem];
}

+(void)addDismissItemForVC:(UIViewController *)vc{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back_1"] forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back_2"] forState:UIControlStateHighlighted];
    backBtn.frame =  CGRectMake(0, 0, 44, 44);
    [backBtn bk_addEventHandler:^(id sender) {
        [vc.navigationController dismissViewControllerAnimated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;
    vc.navigationItem.leftBarButtonItems = @[spaceItem,backItem];
}

+(void)addSearchItemForVC:(UIViewController *)vc clickedHandler:(void (^)())handler{
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"搜索_默认"] forState:UIControlStateNormal];
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"搜索_按下"] forState:UIControlStateHighlighted];
    searchBtn.frame =  CGRectMake(0, 0, 44, 44);
    [searchBtn bk_addEventHandler:^(id sender) {
        !handler ?: handler();
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;
    vc.navigationItem.rightBarButtonItems = @[searchItem, spaceItem];
}

+(void)addLikeBtnForView:(UIImageView *)view{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"title_like_default"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"title_like_select"] forState:UIControlStateSelected];
    [btn bk_addEventHandler:^(id sender) {
        btn.selected = !btn.selected;
        NSLog(@"%@",btn.selected?@"关注":@"取消关注");
        btn.transform = CGAffineTransformIdentity;
        [UIView animateKeyframesWithDuration:0.5 delay:0 options:0 animations: ^{
            [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 3.0 animations: ^{
                btn.transform = CGAffineTransformMakeScale(1.8, 1.8);
            }];
            [UIView addKeyframeWithRelativeStartTime:1/3.0 relativeDuration:1/3.0 animations: ^{
                btn.transform = CGAffineTransformMakeScale(0.8, 0.8);
            }];
            [UIView addKeyframeWithRelativeStartTime:2/3.0 relativeDuration:1/3.0 animations: ^{
                btn.transform = CGAffineTransformMakeScale(1.0, 1.0);
            }];
        } completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(-10);
        make.width.height.equalTo(40);
    }];
}

+(UIBarButtonItem *)addLikeBtnForVC:(UIViewController *)vc clickedHandler:(void (^)())handler{    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"title_like_default"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"title_like_select"] forState:UIControlStateSelected];
    btn.frame = CGRectMake(0, 0, 43, 43);
    [btn bk_addEventHandler:^(id sender) {
        !handler ?: handler();
        btn.selected = !btn.selected;
        NSLog(@"%@",btn.selected?@"关注":@"取消关注");
        btn.transform = CGAffineTransformIdentity;
        [UIView animateKeyframesWithDuration:0.5 delay:0 options:0 animations: ^{
            [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 3.0 animations: ^{
                btn.transform = CGAffineTransformMakeScale(1.8, 1.8);
            }];
            [UIView addKeyframeWithRelativeStartTime:1/3.0 relativeDuration:1/3.0 animations: ^{
                btn.transform = CGAffineTransformMakeScale(0.8, 0.8);
            }];
            [UIView addKeyframeWithRelativeStartTime:2/3.0 relativeDuration:1/3.0 animations: ^{
                btn.transform = CGAffineTransformMakeScale(1.0, 1.0);
            }];
        } completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *likeItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return likeItem;
}

+ (UIBarButtonItem *)addShareItemForVC:(UIViewController *)vc withWebURL:(NSURL *)webUrl andIconUrl:(NSURL *)iconUrl andTitle:(NSString *)title clickedHandler:(void (^)())handler{
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"titleshare_2"] forState:UIControlStateNormal];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"titleshare_1"] forState:UIControlStateHighlighted];
    shareBtn.frame =  CGRectMake(0, 0, 44, 44);
    [shareBtn bk_addEventHandler:^(id sender) {
        !handler ?: handler();
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:title images:@[iconUrl] url:webUrl title:@"小日子分享" type:SSDKContentTypeAuto];
        [ShareSDK showShareActionSheet:nil items:@[@(SSDKPlatformSubTypeWechatSession),@(SSDKPlatformSubTypeWechatTimeline),@(SSDKPlatformTypeSinaWeibo)] shareParams:shareParams onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
            switch (state) {
                case SSDKResponseStateSuccess:{
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                    [alertView show];
                    break;
                }
                case SSDKResponseStateFail:{
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败" message:[NSString stringWithFormat:@"%@",error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert show];
                    break;
                }
                default:
                    break;
            }
        }];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithCustomView:shareBtn];
    return shareItem;
}

+ (void)addSendMessageForVc:(UIViewController *)vc clickedHandler:(void (^)())handler{
    UIButton *messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [messageBtn setBackgroundImage:[UIImage imageNamed:@"camera_1"] forState:UIControlStateNormal];
    [messageBtn setBackgroundImage:[UIImage imageNamed:@"camera_2"] forState:UIControlStateHighlighted];
    messageBtn.frame =  CGRectMake(0, 0, 44, 44);
    [messageBtn bk_addEventHandler:^(id sender) {
        !handler ?: handler();
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *messageItem = [[UIBarButtonItem alloc] initWithCustomView:messageBtn];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;
    vc.navigationItem.rightBarButtonItems = @[spaceItem,messageItem];
}

+ (void)addShowCityForVc:(UIViewController *)vc clickedHandler:(void (^)())handler{
    UIButton *showBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [showBtn setTitle:@"深圳" forState:UIControlStateNormal];
    [showBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    showBtn.frame =  CGRectMake(0, 0, 44, 44);
    [showBtn bk_addEventHandler:^(id sender) {
        !handler ?: handler();
    } forControlEvents:UIControlEventTouchUpInside];
    UIImageView *imageV = [UIImageView new];
    [showBtn addSubview:imageV];
    imageV.contentMode = UIViewContentModeScaleAspectFill;
    imageV.clipsToBounds = YES;
    imageV.image = [UIImage imageNamed:@"city"];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(15);
        make.centerY.equalTo(0);
        make.size.equalTo(CGSizeMake(15, 15));
    }];
    UIBarButtonItem *showItem = [[UIBarButtonItem alloc] initWithCustomView:showBtn];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -10;
    vc.navigationItem.leftBarButtonItems = @[spaceItem,showItem];
}

+ (void)addCancelForVc:(UIViewController *)vc clickedHandler:(void (^)())handler{
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn bk_addEventHandler:^(id sender) {
        [vc dismissViewControllerAnimated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithCustomView:cancelBtn];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -5;
    vc.navigationItem.leftBarButtonItems = @[cancelItem,spaceItem];
}

+(void)addRightBarButtonForVC:(UIViewController *)vc{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"near_2"] forState:UIControlStateNormal];
    backBtn.frame =  CGRectMake(0, 0, 44, 44);
    [backBtn bk_addEventHandler:^(id sender) {
        NSLog(@"附近按钮被点击");
    } forControlEvents:UIControlEventTouchUpInside];
    [vc.view endEditing:YES];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;
    vc.navigationItem.rightBarButtonItems = @[spaceItem,backItem];
}
@end
