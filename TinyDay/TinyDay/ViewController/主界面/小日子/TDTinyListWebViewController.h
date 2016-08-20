//
//  ListWebViewController.h
//  TinyDay
//
//  Created by 臻 曦 on 16/8/16.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDTinyListWebViewController : UIViewController
- (instancetype)initWithWebURL:(NSURL *)webUrl andIconUrl:(NSURL *)iconUrl andTitle:(NSString *)title;
@property (nonatomic,readonly) NSURL *webUrl;
@property (nonatomic, copy) NSString *webTitle;
@property (nonatomic, readonly) NSURL *iconUrl;
@end
