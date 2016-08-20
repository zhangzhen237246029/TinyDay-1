//
//  WebViewController.h
//  TinyDay
//
//  Created by tarena46 on 16/8/19.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (nonatomic) NSURL *url;
-(instancetype)initWithURL:(NSURL *)url;

@end
