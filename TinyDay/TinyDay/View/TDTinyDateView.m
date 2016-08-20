//
//  DayView.m
//  TinyDay
//
//  Created by 臻 曦 on 16/8/18.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDTinyDateView.h"

@implementation TDTinyDateView

- (UILabel *)dateLb {
    if(_dateLb == nil) {
        _dateLb = [[UILabel alloc] init];
        [self addSubview:_dateLb];
        [_dateLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(self.maskV.mas_bottom).equalTo(10);
        }];
    }
    return _dateLb;
}
- (UIView *)maskView {
    if(_maskView == nil) {
        _maskView = [[UIView alloc] init];
        [self addSubview:_maskView];
        _maskView.backgroundColor = [UIColor redColor];
        _maskView.backgroundColor = kRGBA(28, 28, 28, 1);
        [_maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(self.dateLb.mas_bottom).equalTo(5);
            make.height.equalTo(2);
            make.width.equalTo(20);
        }];
    }
    return _maskView;
}
- (UIView *)maskV {
    if(_maskV == nil) {
        _maskV = [[UIView alloc] init];
        [self addSubview:_maskV];
        _maskV.backgroundColor = [UIColor colorWithWhite:245/ 255.0 alpha:1];
        [_maskV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(10);
            make.height.equalTo(10);
        }];
    }
    return _maskV;
}
- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self addSubview:_titleLb];
        _titleLb.font = [UIFont systemFontOfSize:16];
        _titleLb.textColor = [UIColor lightGrayColor];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(self.maskView.mas_bottom).equalTo(10);
        }];
    }
    return _titleLb;
}
- (UIButton *)btnClick {
    if(_btnClick == nil) {
        _btnClick = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_btnClick];
        _btnClick.backgroundColor = [UIColor clearColor];
        //添加button的点击事件
        [_btnClick bk_addEventHandler:^(UIButton *sender) {
            !_btnClicked ?: _btnClicked(sender);
        } forControlEvents:UIControlEventTouchUpInside];
        [_btnClick mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _btnClick;
}
#pragma mark - LifeCycle 生命周期
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
       
        [self dateLb];
        [self maskView];
        [self titleLb];
        [self maskV];
        [self btnClick];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end
