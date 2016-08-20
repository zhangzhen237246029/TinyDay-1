//
//  TDSearchViewModel.h
//  TinyDay
//


//  Created by tarena46 on 16/8/17.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDBaseViewModel.h"
#import "TDFindHeaderNextModel.h"
#import "TDNetManager.h"

@interface TDFindSearchViewModel : TDBaseViewModel
@property (nonatomic) NSString *keywords;
@property (nonatomic) NSArray<TDFindHeaderNextListModel *> *dataList;

//有几行
@property (nonatomic) NSInteger numRow;

//cell 里面的 headerIV
-(NSURL *)HeaderIVForRow:(NSInteger)row;
-(NSString *)titleLbForRow:(NSInteger)row;
-(NSString *)nameLbForRow:(NSInteger)row;

//点击下一页
-(NSURL *)dateURLForRow:(NSInteger)row;

@end
