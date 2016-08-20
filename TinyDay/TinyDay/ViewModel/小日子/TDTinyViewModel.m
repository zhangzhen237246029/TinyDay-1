//
//  TinyDayViewModel.m
//  TinyDay
//
//  Created by 臻 曦 on 16/8/15.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDTinyViewModel.h"

@implementation TDTinyViewModel
/*************** 头部广告滚动栏 ***************/
- (NSArray<TDTinyHeadModel *> *)headList {
    if(_headList == nil) {
        _headList = [[NSArray<TDTinyHeadModel *> alloc] init];
    }
    return _headList;
}
- (NSInteger)rowNumber{
    return self.headList.count;
}
- (NSString *)indexTitle:(NSInteger)row{
    return self.headList[row].title;
}
- (NSURL *)indexIconUrl:(NSInteger)row{
    return self.headList[row].img.im_URL;
}
- (NSURL *)detialUrl:(NSInteger)row{
    return self.headList[row].url.im_URL;
}

/*************** 第一个分区 ***************/
- (NSInteger)selectedNumber{
    return self.selectedList.count;
}
- (NSURL *)selectedIconUrl:(NSInteger)row{
    return self.selectedList[row].img.im_URL;
}
- (NSString *)selectedTitle:(NSInteger)row{
    return self.selectedList[row].title;
}
- (NSURL *)selectedDetailUrl:(NSInteger)row{
    return self.selectedList[row].url.im_URL;
}

/*************** 日期 ***************/
- (NSInteger)dayNumber{
    return 1;
}
- (NSString *)dayForRow:(NSInteger)row{
    return self.dateList[row].date;
}
- (NSString *)DaytitleForRow:(NSInteger)row{
    return self.dateList[row].title;
}

/*************** 详细内容 ***************/
- (NSInteger)sectionNumber{
    return self.lists.count;
}
- (NSURL *)listIconForSection:(NSInteger)section{
    return self.lists[section].img.im_URL;
}
- (NSString *)listTitleForSection:(NSInteger)section{
    return self.lists[section].title;
}
- (NSString *)listDescForSection:(NSInteger)section{
    NSString *desc1 = self.lists[section].sName;
    NSString *desc2 = self.lists[section].name;
    if (!desc1.length || !desc2.length) {
        return @"";
    }
    return [NSString stringWithFormat:@"%@ · 「 %@ 」", desc1, desc2];
}
- (NSURL *)listDetailForSection:(NSInteger)section{
    return self.lists[section].share_url.im_URL;
}
- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    self.dataTask = [TDNetManager getTinyCompletionHandler:^(TDTinyModel *models, NSError *error) {
        if (!error) {
            self.headList = models.head;
            self.selectedList = models.articles.selected;
            self.lists = models.list;
            [self.dateList addObject:models];
        }
        !completionHandler ?: completionHandler(error);
    }];
}

- (NSArray<TDTinyListModel *> *)lists {
    if(_lists == nil) {
        _lists = [[NSArray<TDTinyListModel *> alloc] init];
    }
    return _lists;
}
- (NSMutableArray<TDTinyModel *> *)dateList {
    if(_dateList == nil) {
        _dateList = [[NSMutableArray<TDTinyModel *> alloc] init];
    }
    return _dateList;
}
@end
