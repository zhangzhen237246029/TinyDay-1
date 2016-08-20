//
//  AppDelegate.m
//  TinyDay
//
//  Created by tarena31 on 16/8/11.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "AppDelegate.h"
#import "TDMyTabbarController.h"
#import "TDWelcomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
- (UIWindow *)window {
    if(!_window) {
        /******  主界面窗口  ******/
        _window = [[UIWindow alloc]initWithFrame:kScreenBounds];
        [_window makeKeyAndVisible];
        _window.rootViewController = [TDMyTabbarController new];
    }
    return _window;
}

- (UIWindow *)welcomeWindow {
    if(!_welcomeWindow) {
        /******  欢迎界面窗口  ******/
        _welcomeWindow = [[UIWindow alloc] initWithFrame:kScreenBounds];
        _welcomeWindow.hidden = NO;
        _welcomeWindow.rootViewController = [TDWelcomeViewController new];
        _welcomeWindow.windowLevel = 1;
    }
    return _welcomeWindow;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self configApplication:launchOptions];
    [self welcomeWindow];
    return YES;
}

@end
