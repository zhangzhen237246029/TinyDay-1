//
//  TDListViewModel.h
//  TinyDay
//
//  Created by 臻 曦 on 16/8/18.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDBaseViewModel.h"
#import "TDNetManager.h"

@interface TDListViewModel : TDBaseViewModel
@property (nonatomic) NSInteger rowNumber;
//图片;
- (NSURL *)iconForRow:(NSInteger)row;
//详情
- (NSURL *)detailUrlForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
@property (nonatomic) NSArray<TDListListModel *> *dataList;
@end
