//
//  WebViewController.m
//  TinyDay
//
//  Created by tarena46 on 16/8/19.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDLNWebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>

@property (nonatomic)UIWebView *webView;

@end

@implementation WebViewController

- (instancetype)initWithURL:(NSURL *)url
{
    self = [super init];
    if (self) {
        _url = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [TDFactory addPopBackItemForVC:self];
    _webView = [UIWebView new];
    _webView.delegate = self;
    [self.view addSubview:_webView];
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [_webView loadRequest:[NSURLRequest requestWithURL:_url]];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self.view showHUD];

}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.view hideHUD];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.view showWarning:@"加载失败"];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}






@end
