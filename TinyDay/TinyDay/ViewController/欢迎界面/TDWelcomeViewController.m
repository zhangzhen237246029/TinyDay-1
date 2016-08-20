//
//  WelcomeViewController.m
//  TinyDay
//
//  Created by tarena31 on 16/8/13.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDWelcomeViewController.h"
#import "AppDelegate.h"

@interface TDWelcomeViewController ()
@property (nonatomic) NSArray<UIImage *> *imageList;
@property (nonatomic, strong) UIScrollView *sv;
@property (nonatomic, assign) int index;
@property (nonatomic) UIControl *wxLogC;
@property (nonatomic) UIControl *wbLogC;
@property (nonatomic) UIControl *qqLogC;
@property (nonatomic) UIButton *unLogBtn;
@end

@implementation TDWelcomeViewController
#pragma mark - LazyLoad 懒加载
- (NSArray<UIImage *> *)imageList {
    if(_imageList == nil) {
        /******  四组不同分辨率的三幅图  ******/
        NSArray *images960 = @[@"onepage-480h", @"twopage-480h", @"threepage-480h"];
        NSArray *images1136 = @[@"onepage-568h", @"twopage-568h", @"threepage-568h"];
        NSArray *images1334 = @[@"onepage-667h", @"twopage-667h", @"threepage-667h"];
        NSArray *images2208 = @[@"onepage-736h", @"twopage-736h", @"threepage-736h"];
        
        /******  不同分辨率的屏幕使用不同的图片组  ******/
        CGFloat height = kScreenNativeH;
        NSArray *images = nil;
        if (height == 960) {
            images = images960;
        }
        if (height == 1136) {
            images = images1136;
        }
        if (height == 1334) {
            images = images1334;
        }
        if (height == 1920 || height == 2208) {
            images = images2208;
        }
        NSMutableArray *tmpArr = [NSMutableArray new];
        [images enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [tmpArr addObject:[UIImage imageNamed:obj]];
        }];
        _imageList = tmpArr.copy;
    }
    return _imageList;
}

- (UIScrollView *)sv {
    if(_sv == nil) {
        /******  背景图是三幅图片放在一个scrollview中  ******/
        _sv = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _sv.scrollEnabled = NO;
        _sv.contentSize = CGSizeMake(kScreenW*3, 0);
        [self.view addSubview:_sv];
        for (int i=0; i<3; i++) {
            UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenW*i, 0, kScreenW, kScreenH)];
            iv.image = self.imageList[i];
            [_sv addSubview:iv];
        }
        
        /******  定时器,使scrollview自己偏移并"fade"实现渐变  ******/
        [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            _sv.contentOffset = CGPointMake(++self.index%3*kScreenW, 0);
            CATransition *animation = [CATransition new];
            animation.duration = 2;
            animation.type = kCATransitionFade;
            [_sv.layer addAnimation:animation forKey:nil];
        } repeats:YES];
    }
    return _sv;
}

- (UIControl *)wxLogC {
    if(_wxLogC == nil) {
        /******  微信登录按钮  ******/
        _wxLogC = [[UIControl alloc] init];
        _wxLogC.backgroundColor = kRGBA(50, 50, 50, 0.3);
        kViewBorderRadius(_wxLogC, 4, 1, [UIColor colorWithWhite:0.75 alpha:0.8]);
        [self.view addSubview:_wxLogC];
        [_wxLogC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20);
            make.bottom.equalTo(-68);
            make.width.equalTo(100);
            make.height.equalTo(34);
        }];
        
        UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_weixin"]];
        iv.contentMode = UIViewContentModeScaleAspectFit;
        [_wxLogC addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(10);
            make.width.height.equalTo(15);
        }];
        
        UILabel *label = [[UILabel alloc] init];
        label.text = @"微信登录";
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:13];
        [_wxLogC addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-10);
        }];
        
        [_wxLogC bk_addEventHandler:^(id sender) {
            kLOG(@"点击微信登录");
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _wxLogC;
}

- (UIControl *)wbLogC {
    if(_wbLogC == nil) {
        /******  微博登录按钮  ******/
        _wbLogC = [[UIControl alloc] init];
        _wbLogC.backgroundColor = kRGBA(50, 50, 50, 0.3);
        kViewBorderRadius(_wbLogC, 4, 1, [UIColor colorWithWhite:0.75 alpha:0.8]);
        [self.view addSubview:_wbLogC];
        [_wbLogC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-20);
            make.bottom.equalTo(-68);
            make.width.equalTo(100);
            make.height.equalTo(34);
        }];
        
        UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_weibo"]];
        iv.contentMode = UIViewContentModeScaleAspectFit;
        [_wbLogC addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(10);
            make.width.height.equalTo(15);
        }];
        
        UILabel *label = [[UILabel alloc] init];
        label.text = @"微博登录";
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:13];
        [_wbLogC addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-10);
        }];
        
        [_wbLogC bk_addEventHandler:^(id sender) {
            kLOG(@"点击微博登录");
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _wbLogC;
}

- (UIControl *)qqLogC {
    if(_qqLogC == nil) {
        /******  QQ登录按钮  ******/
        _qqLogC = [[UIControl alloc] init];
        _qqLogC.backgroundColor = kRGBA(50, 50, 50, 0.3);
        kViewBorderRadius(_qqLogC, 4, 1, [UIColor colorWithWhite:0.75 alpha:0.8]);
        [self.view addSubview:_qqLogC];
        [_qqLogC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(-68);
            make.width.equalTo(100);
            make.height.equalTo(34);
        }];
        
        UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_qq"]];
        iv.contentMode = UIViewContentModeScaleAspectFit;
        [_qqLogC addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(15);
            make.width.height.equalTo(15);
        }];
        
        UILabel *label = [[UILabel alloc] init];
        label.text = @"QQ登录";
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:13];
        [_qqLogC addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-15);
        }];
        
        [_qqLogC bk_addEventHandler:^(id sender) {
            kLOG(@"点击QQ登录");
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _qqLogC;
}

- (UIButton *)unLogBtn {
    if(_unLogBtn == nil) {
        /******  不登录进入按钮  ******/
        _unLogBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _unLogBtn.backgroundColor = kClearColor;
        [_unLogBtn setTitle:@"暂不登录, 进入小日子" forState:UIControlStateNormal];
        _unLogBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self.view addSubview:_unLogBtn];
        [_unLogBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(-20);
        }];
        
        [_unLogBtn bk_addEventHandler:^(id sender) {
            [UIView animateWithDuration:1.5 animations:^{
                self.view.window.transform = CGAffineTransformMakeTranslation(0, -kScreenH);
            } completion:^(BOOL finished) {
                kAppDelegate.welcomeWindow.rootViewController = nil;
                kAppDelegate.welcomeWindow = nil;
            }];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _unLogBtn;
}

#pragma mark - LifeCycle 生命周期
-(UIStatusBarStyle)preferredStatusBarStyle{
    /******  状态栏是白色的  ******/
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self sv];
    [self wxLogC];
    [self wbLogC];
    [self qqLogC];
    [self unLogBtn];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
