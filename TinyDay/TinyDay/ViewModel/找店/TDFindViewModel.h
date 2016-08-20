//
//  LNFoundShopViewModel.h
//  TinyDay
//

//  Created by tarena46 on 16/8/13.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDBaseViewModel.h"
#import "TDNetManager.h"

@interface TDFindViewModel : TDBaseViewModel

/******  tableview  ******/
//有几个分区
@property (nonatomic,readonly)NSInteger sectionNum;
//每个分区有几行
-(NSInteger)RowForSection:(NSInteger)section;
//第一个分区数组
@property (nonatomic) NSArray<TDFindCbdsModel *> *CbdsArr;
@property (nonatomic) NSArray<TDFindThemesModel *> *themesArr;
//cell 中的图片
-(NSURL *)headerIVForSection:(NSInteger)section Row:(NSInteger)row;
-(NSString *)titleLbForSection:(NSInteger)section Row:(NSInteger)row;
-(NSString *)nameLbForSection:(NSInteger)section Row:(NSInteger)row;

/******  collectionview  ******/
@property (nonatomic,readonly)NSInteger rowCollectionNum;
-(NSURL *)imageViewForRow:(NSInteger)row;
-(NSString *)labelForRow:(NSInteger)row;
@property (nonatomic) NSArray<TDFindTagsModel *> *tagArr;

@end
