//
//  TDTinyReadView.h
//  TinyDay
//
//  Created by 臻 曦 on 16/8/18.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDTinyReadView : UIView
@property (nonatomic) UIImageView *iconIv;
@property (nonatomic) UILabel *titleLb;
@property (nonatomic) UIButton *btnClick;
@property (nonatomic,copy) void(^btnClicked)(UIButton *btn);
@property (nonatomic) UIView *maskView;

@end
