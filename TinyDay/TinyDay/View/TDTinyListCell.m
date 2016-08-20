//
//  TDTinyListCell.m
//  TinyDay
//
//  Created by 臻 曦 on 16/8/18.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDTinyListCell.h"

@implementation TDTinyListCell

#pragma mark - LazyLoad 懒加载
- (UIImageView *)iconView {
    if(_iconView == nil) {
        //图片的尺寸 750 × 468
        _iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconView];
        _iconView.contentMode = UIViewContentModeScaleAspectFill;
        _iconView.clipsToBounds = YES;
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(0);
        }];
    }
    return _iconView;
}
- (UIView *)maskView {
    if(_maskView == nil) {
        _maskView = [[UIView alloc] init];
        [self.contentView addSubview:_maskView];
        _maskView.backgroundColor = [UIColor whiteColor];
        [_maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(0);
            make.top.equalTo(self.iconView.mas_bottom).equalTo(0);
            make.height.equalTo(10);
        }];
    }
    return _maskView;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self maskView];
    }
    return self;
}
- (void)awakeFromNib {
   
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
