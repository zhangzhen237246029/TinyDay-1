//
//  TDBasicCell.m
//  TinyDay
//
//  Created by tarena31 on 16/8/18.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDBasicCell.h"

@implementation TDBasicCell
#pragma mark - LazyLoad 懒加载
- (UIImageView *)iconIv {
    if(_iconIv == nil) {
        _iconIv = [[UIImageView alloc] init];
        [TDFactory addLikeBtnForView:self.iconIv];
        [self.contentView addSubview:_iconIv];
        _iconIv.userInteractionEnabled = YES;
        _iconIv.contentMode = UIViewContentModeScaleAspectFill;
        _iconIv.clipsToBounds = YES;
        [_iconIv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.height.equalTo(200);
        }];
    }
    return _iconIv;
}

- (UIView *)maskV {
    if(_maskV == nil) {
        _maskV = [[UIView alloc] init];
        [self.contentView addSubview:_maskV];
        _maskV.backgroundColor = [UIColor whiteColor];
        [_maskV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(0);
            make.top.equalTo(self.iconIv.mas_bottom);
        }];
    }
    return _maskV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.maskV addSubview:_titleLb];
        _titleLb.numberOfLines = 0;
        _titleLb.font = [UIFont systemFontOfSize:15];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(8);
            make.top.equalTo(15);
            make.right.equalTo(-8);
        }];
    }
    return _titleLb;
}

- (UILabel *)descLb {
    if(_descLb == nil) {
        _descLb = [[UILabel alloc] init];
        [self.maskV addSubview:_descLb];
        _descLb.font = [UIFont systemFontOfSize:12];
        _descLb.textColor = [UIColor grayColor];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLb);
            make.top.equalTo(self.titleLb.mas_bottom).equalTo(10);
        }];
    }
    return _descLb;
}

- (UILabel *)priceLb {
    if(_priceLb == nil) {
        _priceLb = [[UILabel alloc] init];
        [self.contentView addSubview:_priceLb];
        _priceLb.font = [UIFont systemFontOfSize:12];
        _priceLb.textAlignment = NSTextAlignmentRight;
        _priceLb.textColor = [UIColor grayColor];
        [_priceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-8);
            make.centerY.equalTo(self.descLb.mas_centerY);
            make.left.lessThanOrEqualTo(self.descLb.mas_right).offset(10);
        }];
    }
    return _priceLb;
}

#pragma mark - Init 初始化
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self iconIv];
        [self maskV];
        [self titleLb];
        [self descLb];
        [self priceLb];
    }
    return self;
}

#pragma mark - LifeCycle 生命周期
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
