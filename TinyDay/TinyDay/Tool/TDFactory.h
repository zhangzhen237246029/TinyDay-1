//
//  Factory.h
//  GameLive
//

//  Created by tarena31 on 16/8/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDFactory : NSObject
//pop返回按钮
+(void)addPopBackItemForVC:(UIViewController *)vc;
//dismiss返回按钮
+(void)addDismissItemForVC:(UIViewController *)vc;

+(void)addSearchItemForVC:(UIViewController *)vc clickedHandler:(void(^)())handler;
//Cell上的红心按钮
+(void)addLikeBtnForView:(UIImageView *)view;
//导航红心按钮
+(UIBarButtonItem *)addLikeBtnForVC:(UIViewController *)vc clickedHandler:(void(^)())handler;
//导航分享按钮
+(UIBarButtonItem *)addShareItemForVC:(UIViewController *)vc withWebURL:(NSURL *)webUrl andIconUrl:(NSURL *)iconUrl andTitle:(NSString *)title clickedHandler:(void(^)())handler;
//添加发布日志按钮
+(void)addSendMessageForVc:(UIViewController *)vc clickedHandler:(void(^)())handler;
//添加显示城市的按钮
+(void)addShowCityForVc:(UIViewController *)vc clickedHandler:(void(^)())handler;
//添加取消按钮
+(void)addCancelForVc:(UIViewController *)vc clickedHandler:(void(^)())handler;
//导航栏地图按钮
+(void)addRightBarButtonForVC:(UIViewController *)vc;

@end
