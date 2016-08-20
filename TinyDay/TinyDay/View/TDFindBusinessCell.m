//
//  LNBusinessCell.m
//  TinyDay
//
//  Created by tarena46 on 16/8/15.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDFindBusinessCell.h"

@implementation TDFindBusinessCell

- (UIImageView *)headerIV {
    if(_headerIV == nil) {
        _headerIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_headerIV];
        _headerIV.contentMode = UIViewContentModeScaleAspectFill;
        [_headerIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
    }
    return _headerIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        _titleLb.font = [UIFont systemFontOfSize:18];
        _titleLb.textColor = [UIColor whiteColor];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
            make.height.mas_equalTo(44);
            make.left.mas_equalTo(5);
            make.right.mas_equalTo(-5);
        }];
    }
    return _titleLb;
}

- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        [self.headerIV addSubview:_nameLb];
        _nameLb.textColor = [UIColor whiteColor];
        _nameLb.textAlignment = NSTextAlignmentCenter;
        _nameLb.font = [UIFont systemFontOfSize:14];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(5);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(30);
        }];
    }
    return _nameLb;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
