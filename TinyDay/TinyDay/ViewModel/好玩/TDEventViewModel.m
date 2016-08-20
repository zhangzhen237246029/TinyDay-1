//
//  EventViewModel.m
//  TinyDay
//
//  Created by tarena30 on 16/8/15.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDEventViewModel.h"

@implementation TDEventViewModel
/******  DataList  ******/
- (NSArray<TDEventListModel *> *)listData {
    if(_listData == nil) {
        _listData = [[NSArray<TDEventListModel *> alloc] init];
    }
    return _listData;
}
- (NSArray<TDEventHeadModel *> *)headData {
    if(_headData == nil) {
        _headData = [[NSArray<TDEventHeadModel *> alloc] init];
    }
    return _headData;
}
- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    self.dataTask = [TDNetManager getEventCompletionHandler:^(TDEventModel *model, NSError *error) {
        if (!error) {
            self.headData = model.head;
            self.listData = model.list;
        }
        !completionHandler ?: completionHandler(error);
    }];
}

/******  UI  ******/
//头部图片
-(NSURL *)headImg{
    return _headData[0].img.im_URL;
}
//多少个cell
-(NSInteger)cellNum{
    return _listData.count;
}
//图片URL
-(NSURL *)imageURLForCell:(NSInteger)row{
    return _listData[row].imgs[0].im_URL;
}
//title
-(NSString *)titleForCell:(NSInteger)row{
    return _listData[row].title;
}
-(NSString *)timeType:(NSInteger)row{
    NSMutableArray *array = [NSMutableArray new];
    NSString *weekday = _listData[row].time_list[0].weekdays;
    if ([weekday containsString:@"0"]) {
        [array addObject:@"一"];
    }
    if ([weekday containsString:@"1"]) {
        [array addObject:@"二"];
    }
    if ([weekday containsString:@"2"]) {
        [array addObject:@"三"];
    }
    if ([weekday containsString:@"3"]) {
        [array addObject:@"四"];
    }
    if ([weekday containsString:@"4"]) {
        [array addObject:@"五"];
    }
    if ([weekday containsString:@"5"]) {
        [array addObject:@"六"];
    }
    if ([weekday containsString:@"6"]) {
        [array addObject:@"日"];
    }
    NSString *string = [array componentsJoinedByString:@","];
    return string;
}
//活动时间
-(NSString *)dateForCell:(NSInteger)row{
    NSInteger type =_listData[row].time_type;
    //开始时间
    NSString *time = _listData[row].time_list[0].start_time;
    NSString *timeA = [time substringToIndex:5];
    //结束日期
    NSString *data1 =_listData[row].time_list[0].end_date;
    NSString *data2 = [data1 substringFromIndex:5];
    NSString *m = [data2 substringToIndex:2];
    NSString *d = [data2 substringFromIndex:3];
    NSString *data = [NSString stringWithFormat:@"%@月%@日",m,d];
    if (type == 1 || type == 2) {
        return [NSString stringWithFormat:@"截止至%@",data];
    }
    if (type == 4 || type == 0) {
        return [NSString stringWithFormat:@"%@  %@",data,timeA];
    }
    if (type == 3) {
        NSString *str = [NSString stringWithFormat:@"每周%@",[self timeType:row]];
        NSString *data = [str stringByAppendingString:timeA];
        return data;
    }
    return data;
}
//活动类型
-(NSString *)typeForCell:(NSInteger)row{
    return _listData[row].tag;
}
//活动价格
-(NSString *)priceForCell:(NSInteger)row{
    if (_listData[row].tickets.count != 0) {
        NSString *str = [NSString stringWithFormat:@"¥%ld",_listData[row].tickets[0].price];
        return str;
    }else{
        
        return [NSString stringWithFormat:@""];
    }
}
//web页面链接地址
-(NSURL *)webURL:(NSInteger)row{
    return _listData[row].url.im_URL;
}
-(NSURL *)adURL{
    return _headData[0].url.im_URL;
}
-(NSURL *)adImageUrl{
    return _headData[0].img.im_URL;
}
-(NSString *)adTitle{
    return _headData[0].title;
}
@end
