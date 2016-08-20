//
//  FootView.m
//  TinyDay
//
//  Created by tarena31 on 16/8/17.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDFootView.h"

@implementation TDFootView
#pragma mark - Init 初始化
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kClearColor;
        [self label];
    }
    return self;
}
#pragma mark - LazyLoad 懒加载
- (UILabel *)label {
    if(_label == nil) {
        _label = [[UILabel alloc] init];
        [self addSubview:_label];
        _label.font = [UIFont systemFontOfSize:14];
        _label.textColor = [UIColor lightGrayColor];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
        }];
    }
    return _label;
}

@end
