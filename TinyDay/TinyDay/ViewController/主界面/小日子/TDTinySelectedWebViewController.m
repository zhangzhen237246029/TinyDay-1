//
//  SelectedWebViewController.m
//  TinyDay
//
//  Created by 臻 曦 on 16/8/16.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDTinySelectedWebViewController.h"

@interface TDTinySelectedWebViewController ()<UIWebViewDelegate>
@property (nonatomic) UIWebView *webView;
@end

@implementation TDTinySelectedWebViewController
- (instancetype)initWithWebURL:(NSURL *)webUrl andIconUrl:(NSURL *)iconUrl andTitle:(NSString *)title{
    if (self = [super init]) {
        _webUrl = webUrl;
        _webTitle = title;
        _iconUrl = iconUrl;
    }
    return self;
}

#pragma mark - webViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.view showHUD];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.view hideHUD];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.view showWarning:error.localizedDescription];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *lItem  =  [TDFactory addLikeBtnForVC:self clickedHandler:^{
        NSLog(@"关注处理事件");
    }];
    UIBarButtonItem *sItem = [TDFactory addShareItemForVC:self withWebURL:_webUrl andIconUrl:_iconUrl andTitle:_webTitle clickedHandler:nil];
    self.navigationItem.rightBarButtonItems = @[sItem,lItem];
    [TDFactory addPopBackItemForVC:self];
    self.webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.webView];
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.webUrl]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
