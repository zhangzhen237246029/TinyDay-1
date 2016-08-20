//
//  TDTinyReadView.m
//  TinyDay
//
//  Created by 臻 曦 on 16/8/18.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDTinyReadView.h"

@implementation TDTinyReadView
- (UIImageView *)iconIv {
    if(_iconIv == nil) {
        _iconIv = [[UIImageView alloc] init];
        [self addSubview:_iconIv];
        _iconIv.contentMode = UIViewContentModeScaleAspectFill;
        _iconIv.clipsToBounds = YES;
        [_iconIv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.size.equalTo(CGSizeMake(15, 15));
            make.left.equalTo(self.titleLb.mas_right).equalTo(0);
        }];
    }
    return _iconIv;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self addSubview:_titleLb];
        _titleLb.font = [UIFont systemFontOfSize:12];
        _titleLb.textColor = [UIColor lightGrayColor];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.centerX.equalTo(0);
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
- (UIView *)maskView {
    if(_maskView == nil) {
        _maskView = [[UIView alloc] init];
        [self addSubview:_maskView];
        _maskView.backgroundColor = [UIColor colorWithWhite:240/ 255.0 alpha:1];
        [_maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(0);
            make.height.equalTo(1);
        }];
    }
    return _maskView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self titleLb];
        [self iconIv];
        [self maskView];
        [self btnClick];
    }
    return self;
}
@end
