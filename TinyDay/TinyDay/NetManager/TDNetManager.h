//
//  NetManager.h
//  TinyDay
//
                   
//  Created by tarena31 on 16/8/13.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDBaseNetworking.h"
#import "TDTinyModel.h"
#import "TDEventModel.h"
#import "TDFindModel.h"
#import "TDFindHeaderNextModel.h"
#import "TDListModel.h"

@interface TDNetManager : TDBaseNetworking

/******  小日子  ******/
+ (id)getTinyCompletionHandler:(void(^)(TDTinyModel *models, NSError *error))completionHandler;
/******  小日子榜单  ******/
+ (id)getListCompletionHandler:(void(^)(TDListModel *models, NSError *error))completionHandler;

/******  好玩  ******/
+(id)getEventCompletionHandler:(void(^)(TDEventModel *model, NSError *error))completionHandler;

/******  找店  ******/
+(id)getFindCompletionHandler:(void(^)(TDFindModel *model, NSError *error))completionHandler;
+(id)getFindHeaderNext:(NSInteger)Num CompletionHandler:(void(^)(TDFindHeaderNextModel *model, NSError *error))completionHandler;
//搜索栏搜索结果
+(id)getSearchDataList:(NSString *)name CompletionHandler:(void(^)(TDFindHeaderNextModel *model, NSError *error))completionHandler;
@end
