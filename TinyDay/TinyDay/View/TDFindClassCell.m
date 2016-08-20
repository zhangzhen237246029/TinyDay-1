//
//  HeaderCell.m
//  TinyDay
//
//  Created by tarena46 on 16/8/13.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDFindClassCell.h"

@implementation TDFindClassCell
- (UIImageView *)imageview {
    if(_imageview == nil) {
        _imageview = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageview];
        [_imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(4);
            make.size.mas_equalTo(CGSizeMake(45, 45));
            make.bottom.mas_equalTo(-21);
        }];
    }
    return _imageview;
}

- (UILabel *)label {
    if(_label == nil) {
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_label];
        _label.textAlignment = NSTextAlignmentCenter;
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.imageview);
            make.right.left.mas_equalTo(0);
            make.top.mas_equalTo(self.imageview.mas_bottom).mas_equalTo(0);
        }];
    }
    return _label;
}

@end
