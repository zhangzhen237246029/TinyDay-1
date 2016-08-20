//
//  ListWebViewController.m
//  TinyDay
//
//  Created by 臻 曦 on 16/8/16.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDTinyListWebViewController.h"

@interface TDTinyListWebViewController ()<UIWebViewDelegate>
@property (nonatomic) UIWebView *webView;
@property (nonatomic) UIImageView *barImageView;
@end

@implementation TDTinyListWebViewController
#pragma mark - Init 初始化
- (instancetype)initWithWebURL:(NSURL *)webUrl andIconUrl:(NSURL *)iconUrl andTitle:(NSString *)title{
    if (self = [super init]) {
        _webUrl = webUrl;
        _webTitle = title;
        _iconUrl = iconUrl;
    }
    return self;
}

#pragma mark - LifeCycle 生命周期
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=YES;
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    _barImageView = self.navigationController.navigationBar.subviews.firstObject;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden=NO;
    self.navigationController.navigationBar.translucent = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *lItem  =  [TDFactory addLikeBtnForVC:self clickedHandler:^{
        NSLog(@"关注处理事件");
    }];
    UIBarButtonItem *sItem = [TDFactory addShareItemForVC:self withWebURL:_webUrl andIconUrl:_iconUrl andTitle:_webTitle clickedHandler:nil];
    self.navigationItem.rightBarButtonItems = @[sItem,lItem];
    [TDFactory addPopBackItemForVC:self];
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, -64, kScreenW, kScreenH+64)];
    [self.view addSubview:self.webView];
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.webUrl]];
    self.webView.backgroundColor = [UIColor whiteColor];
    [_webView.scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    _barImageView.frame = CGRectMake(0, -20, kScreenW, 64);
    _barImageView.backgroundColor = [UIColor blackColor];
    if ([keyPath isEqualToString:@"contentOffset"]) {
        CGFloat y = _webView.scrollView.contentOffset.y;
        if (y>=0 && y<=64) {
            CGFloat nav_alpha = y/64;
            self.barImageView.alpha = nav_alpha;
        }else if(y>64){
            self.barImageView.alpha = 1.0;
        }else{
            self.barImageView.alpha = 0.0;
        }
    }
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
