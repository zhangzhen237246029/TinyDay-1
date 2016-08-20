//
//  EventWebViewController.h
//  TinyDay
//
//  Created by tarena30 on 16/8/16.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDEventWebViewController : UIViewController
- (instancetype)initWithWebURL:(NSURL *)webUrl andIconUrl:(NSURL *)iconUrl andTitle:(NSString *)title;
@property (nonatomic,readonly) NSURL *webUrl;
@property (nonatomic, copy) NSString *webTitle;
@property (nonatomic, readonly) NSURL *iconUrl;
@end
