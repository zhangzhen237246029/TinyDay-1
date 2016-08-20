//
//  LnHeaderNextViewModel.h
//  TinyDay
//


//  Created by tarena46 on 16/8/16.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDBaseViewModel.h"
#import "TDNetManager.h"

@interface TDFindClassMoreViewModel : TDBaseViewModel
@property (nonatomic) NSInteger num;
-(instancetype)initWithNum:(NSInteger)num;

/******  DataList  ******/
@property (nonatomic) NSArray<TDFindHeaderNextListModel *> *dataList;

/******  TableView  ******/
@property (nonatomic) NSInteger numRow;
-(NSURL *)HeaderIVForRow:(NSInteger)row;
-(NSString *)titleLbForRow:(NSInteger)row;
-(NSString *)nameLbForName:(NSString*)name Row:(NSInteger)row;

/******  更多collectionview  ******/
@property (nonatomic) NSInteger numCollectionCell;
-(NSURL *)collectionHanderIVForRow:(NSInteger)row;
-(NSString *)collectionTitleForRow:(NSInteger)row;
-(NSURL *)dateListForRow:(NSInteger)row;
@end
