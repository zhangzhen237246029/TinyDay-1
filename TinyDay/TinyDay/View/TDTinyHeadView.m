//
//  HeadView.m
//  TinyDay
//
//  Created by 臻 曦 on 16/8/15.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDTinyHeadView.h"

@interface TDTinyHeadView ()<iCarouselDelegate, iCarouselDataSource>

@end

@implementation TDTinyHeadView
- (void)setDuration:(NSTimeInterval)duration{
    _duration = duration;
    //判断当期当前是自动滚动状态 ,只有是才滚动；
    self.autoScroll = _autoScroll;
}
- (void)setAutoScroll:(BOOL)autoScroll{
    _autoScroll = autoScroll;
    //让之前的timer 失效
    [_timer invalidate];//失效停止；
    _timer = nil;
    if (autoScroll) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:_duration block:^(NSTimer *timer) {
            [self.ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
        } repeats:YES];
    }
}

#pragma mark - LazyLoad 懒加载
- (iCarousel *)ic{
    if (!_ic) {
        _ic = [[iCarousel alloc] init];
        [self addSubview:_ic];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.scrollSpeed = .2;
        _ic.pagingEnabled = YES;
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.bottom.equalTo(-65);
        }];
    }
    return _ic;
}
- (UIPageControl *)pc {
    if(_pc == nil) {
        _pc = [[UIPageControl alloc] init];
        [self addSubview:_pc];
        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(-55);
        }];
    }
    return _pc;
}

#pragma mark - Init 初始化
//主要是为了定frame：
- (instancetype)initWithFrame:(CGRect)frame{
    CGFloat width = frame.size.width;
    CGFloat height = width / 2;
    if (self = [super initWithFrame:CGRectMake(0, 0, width, height + 80)]) {
        [self ic];
        [self pc];
        [self addOtherBtns];
        _duration = 3;
        self.autoScroll = YES;
    }
    return self;
}
- (void)setFrame:(CGRect)frame{
    //防止别人手动修改frame
    CGFloat width = frame.size.width;
    CGFloat height = width / 2;
    super.frame = CGRectMake(0, 0, width, height + 80);
}
- (void)addOtherBtns{
    UIView *lastV = nil;
    NSArray *titles = @[@"好物", @"榜单", @"周末", @"演出"];
    NSArray *imageNames = @[@"goods", @"list", @"weekend", @"show"];
    for (int i = 0; i < 4; i ++) {
        UIControl *c = [UIControl new];
        [self addSubview:c];
        [c mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(0);
            make.top.equalTo(self.ic.mas_bottom).equalTo(0);
            if (i == 0) {
                make.left.equalTo(0);
            }else{
                make.width.equalTo(lastV);
                make.left.equalTo(lastV.mas_right);
                if (i == 3) {
                    make.right.equalTo(0);
                }
            }
        }];
        lastV = c;
        //里面的label
        UILabel *titleLb = [UILabel new];
        [c addSubview:titleLb];
        titleLb.font = [UIFont systemFontOfSize:14];
        titleLb.text = titles[i];
        [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(-5);
        }];
        //里面的button
        UIImageView *iv = [UIImageView new];
        [c addSubview:iv];
        iv.image = [UIImage imageNamed:imageNames[i]];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(titleLb);
            make.bottom.equalTo(titleLb.mas_top).equalTo(-5);
        }];
        //各个button的点击事件
        c.tag = 100 + i;
        [c bk_addEventHandler:^(UIControl *sender) {
            switch (sender.tag) {
                case 100:
                    break;
                case 101:
                     !_btnClicked ?: _btnClicked(sender);
                    break;
                case 102:
                    !_btnClicked ?: _btnClicked(sender);
                    break;
                case 103:
                    break;
                default:
                    break;
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark - ic Delegate
- (void)reloadData{
    [self.ic reloadData];
    if ([_dataSource respondsToSelector:@selector(numberOfItems:)]) {
        self.pc.numberOfPages = [_dataSource numberOfItems:self];
    }
    self.pc.currentPage = _ic.currentItemIndex;
}
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    if ([_dataSource respondsToSelector:@selector(numberOfItems:)]) {
        return [_dataSource numberOfItems:self];
    }
    return 0;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIImageView alloc] initWithFrame:carousel.bounds];
        view.contentMode = UIViewContentModeScaleAspectFill;
        view.clipsToBounds = YES;
    }
    if ([_dataSource respondsToSelector:@selector(headView:iconURLForIndex:)]) {
        [(UIImageView *)view setImageURL:[_dataSource headView:self iconURLForIndex:index]];
    }
    return view;
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    self.pc.currentPage = carousel.currentItemIndex;
}
//循环滚动
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}
//被点击的时候;
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    //必须判断，如果代理方法实现某个方法才调用
    if ([_delegate respondsToSelector:@selector(headView:didSelsctedItemIndex:)]){
        [_delegate headView:self didSelsctedItemIndex:index];
    }
}

@end
