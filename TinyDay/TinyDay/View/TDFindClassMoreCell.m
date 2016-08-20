//
//  LnHeaderMoreCell.m
//  TinyDay
//
//  Created by tarena46 on 16/8/16.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDFindClassMoreCell.h"

@implementation TDFindClassMoreCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self headerIV];
        [self titleLb];
    }
    return self;
}

- (UIImageView *)headerIV {
    if(_headerIV == nil) {
        _headerIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_headerIV];
        _headerIV.contentMode = UIViewContentModeScaleAspectFill;
        _headerIV.clipsToBounds = YES;
        [_headerIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _headerIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        _titleLb.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(22.0)];
        _titleLb.textColor = [UIColor whiteColor];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
        }];
    }
    return _titleLb;
}

@end
