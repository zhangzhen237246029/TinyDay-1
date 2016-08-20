//
//  SelectedCell.m
//  TinyDay
//
//  Created by 臻 曦 on 16/8/16.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDTinySelectedCell.h"

@implementation TDTinySelectedCell

#pragma mark - LazyLoad 懒加载
- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        _iconIV.clipsToBounds = YES;
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(165, 110));
            make.left.top.equalTo(10);
        }];
    }
    return _iconIV;
}
- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        _titleLb.font = [UIFont systemFontOfSize:16];
        _titleLb.numberOfLines = 0;
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconIV.mas_top).equalTo(5);
            make.left.equalTo(self.iconIV.mas_right).equalTo(10);
            make.right.equalTo(-5);
        }];
    }
    return _titleLb;
}


#pragma mark - Init 初始化
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self iconIV];
        [self titleLb];
        
}
    return self;
}

#pragma mark - LifeCycle 生命周期
- (void)awakeFromNib {
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
