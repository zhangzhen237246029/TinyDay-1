//
//  TDListDetailController.m
//  TinyDay
//
//  Created by 臻 曦 on 16/8/19.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDTinyRankDetailWebViewController.h"

@interface TDTinyRankDetailWebViewController ()<UIWebViewDelegate>
@property (nonatomic) UIWebView *webView;
@end

@implementation TDTinyRankDetailWebViewController
- (instancetype)initWithWebURL:(NSURL *)webUrl andIconUrl:(NSURL *)iconUrl andTitle:(NSString *)title{
    if (self = [super init]) {
        _webUrl = webUrl;
        _webTitle = title;
        _iconUrl = iconUrl;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [TDFactory addShareItemForVC:self withWebURL:_webUrl andIconUrl:_iconUrl andTitle:_webTitle clickedHandler:nil];
    [TDFactory addPopBackItemForVC:self];
    self.webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.webView];    
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.webUrl]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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


@end
