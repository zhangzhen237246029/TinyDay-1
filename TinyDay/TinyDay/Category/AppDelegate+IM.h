//
//  AppDelegate+IM.h
//  TRProject
//
//  Created by tarena31 on 16/7/21.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (IM)
- (void)configApplication:(NSDictionary *)options;
@property (nonatomic, readonly, getter=isOnline) BOOL online;
@end
