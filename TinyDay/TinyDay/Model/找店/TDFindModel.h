//
//  LNfounShopModel.h
//  TinyDay
//


//  Created by tarena46 on 16/8/13.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TDFindCbdsModel,TDFindTagsModel,TDFindThemesModel;

@interface TDFindModel : NSObject
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSArray<TDFindThemesModel *> *themes;
@property (nonatomic, strong) NSArray<TDFindTagsModel *> *tags;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) NSArray<TDFindCbdsModel *> *cbds;
@end

@interface TDFindCbdsModel : NSObject
//ID->id
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy) NSString *coord;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray *shops;
@property (nonatomic, assign) NSInteger radius;
@end

@interface TDFindTagsModel : NSObject
//ID-id
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@end

@interface TDFindThemesModel : NSObject
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *img;
//ID-id
@property (nonatomic, assign) NSInteger ID;;
@property (nonatomic, assign) NSInteger root_type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *tag;
@property (nonatomic, copy) NSString *url;
@end

