//
//  DayView.h
//  TinyDay
//
//  Created by 臻 曦 on 16/8/18.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDTinyDateView : UIView
@property (nonatomic) UILabel *dateLb;
@property (nonatomic) UIView *maskView;
@property (nonatomic) UILabel *titleLb;
@property (nonatomic) UIView *maskV;
@property (nonatomic) UIButton *btnClick;
@property (nonatomic,copy) void(^btnClicked)(UIButton *btn);

@end
