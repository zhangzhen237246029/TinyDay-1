//
//  HeadView.h
//  TinyDay
//
//  Created by 臻 曦 on 16/8/15.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TDTinyHeadView;
@protocol headViewDataSource <NSObject>
- (NSInteger)numberOfItems:(TDTinyHeadView *)headView;
- (NSURL *)headView:(TDTinyHeadView *)headView iconURLForIndex:(NSInteger)index;
@end

@protocol headViewDelegate <NSObject>
- (void)headView:(TDTinyHeadView *)headView didSelsctedItemIndex:(NSInteger)index;
@end

@interface TDTinyHeadView : UIView<iCarouselDelegate,iCarouselDataSource>
@property (nonatomic) iCarousel *ic;
@property (nonatomic) UIPageControl *pc;

//刷新页面;
- (void)reloadData;
//为了防止循环引用问题 一定要使用weak修饰
@property (nonatomic, weak) id<headViewDelegate> delegate;
@property (nonatomic, weak) id<headViewDataSource> dataSource;
@property (nonatomic) NSTimer *timer;
//默认为YES; 自动滚动;
@property (nonatomic) BOOL autoScroll;
//滚动的间隔时间，默认2秒;
@property (nonatomic) NSTimeInterval duration;
//点击事件;
@property (nonatomic, copy) void(^btnClicked)(UIControl *btn);
@end
