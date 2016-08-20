//
//  TinyDayViewModel.h
//  TinyDay
//
//  Created by 臻 曦 on 16/8/15.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDBaseViewModel.h"
#import "TDNetManager.h"

@interface TDTinyViewModel : TDBaseViewModel
/*************** 头部广告滚动栏 ***************/
@property (nonatomic) NSInteger rowNumber;
//图片；
- (NSURL *)indexIconUrl:(NSInteger)row;
//图片详情;
- (NSURL *)detialUrl:(NSInteger)row;
//题目
- (NSString *)indexTitle:(NSInteger)row;
@property (nonatomic) NSArray<TDTinyHeadModel *> *headList;


/*************** 第一个分区 ***************/
@property (nonatomic,readonly) NSInteger selectedNumber;
//图片
- (NSURL *)selectedIconUrl:(NSInteger)row;
//主题
- (NSString *)selectedTitle:(NSInteger)row;

//详情页
- (NSURL *)selectedDetailUrl:(NSInteger)row;

@property (nonatomic) NSArray<TDTinyArticlesSelectedModel *> *selectedList;

/*************** 日期 ***************/
@property (nonatomic,readonly) NSInteger dayNumber;
//日期
- (NSString *)dayForRow:(NSInteger)row;
//主题
- (NSString *)DaytitleForRow:(NSInteger)row;

@property (nonatomic) NSMutableArray<TDTinyModel *> *dateList;

/*************** 详细内容 ***************/
//多少个分区;
@property (nonatomic,readonly) NSInteger sectionNumber;
//图片
- (NSURL *)listIconForSection:(NSInteger)section;
//title
- (NSString *)listTitleForSection:(NSInteger)section;
//描述
- (NSString *)listDescForSection:(NSInteger)section;
//详细页面；
- (NSURL *)listDetailForSection:(NSInteger)section;

@property (nonatomic) NSArray<TDTinyListModel *> *lists;







@end
