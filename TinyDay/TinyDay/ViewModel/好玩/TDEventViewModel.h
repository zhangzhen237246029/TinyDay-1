//
//  EventViewModel.h
//  TinyDay
//
//  Created by tarena30 on 16/8/15.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDBaseViewModel.h"
#import "TDNetManager.h"

@interface TDEventViewModel : TDBaseViewModel
/******  UI  ******/
-(NSURL *)headImg;
@property(nonatomic,assign)NSInteger cellNum;
-(NSURL *)imageURLForCell:(NSInteger)row;
-(NSString *)titleForCell:(NSInteger)row;
-(NSString *)dateForCell:(NSInteger)row;
-(NSString *)typeForCell:(NSInteger)row;
-(NSString *)priceForCell:(NSInteger)row;
-(NSString *)timeType:(NSInteger)row;
-(NSURL *)webURL:(NSInteger)row;
-(NSURL *)adURL;
-(NSURL *)adImageUrl;
-(NSString *)adTitle;
/******  DataList  ******/
@property(nonatomic)NSArray<TDEventListModel *> *listData;
@property(nonatomic)NSArray<TDEventHeadModel *> *headData;

@end
