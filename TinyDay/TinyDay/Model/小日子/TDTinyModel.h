//
//  TinyModel.h
//  TinyDay
//
//  Created by 臻 曦 on 16/8/15.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TDTinyArticlesModel,TDTinyArticlesSelectedModel,TDTinyArticlesCategoriesModel,TDTinyHeadModel,TDTinyListModel;

@interface TDTinyModel : NSObject
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) TDTinyArticlesModel *articles;
@property (nonatomic, strong) NSArray<TDTinyListModel *> *list;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) NSArray<TDTinyHeadModel *> *head;
//@end
//@interface TinyDayModel : NSObject
/**************** 日期 ***************/
@property (nonatomic, assign) NSInteger like;
//id --> identify;
@property (nonatomic, assign) NSInteger identify;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *date;
@end

@interface TDTinyArticlesModel : NSObject
@property (nonatomic, strong) NSArray<TDTinyArticlesSelectedModel *> *selected;
@property (nonatomic, strong) NSArray<TDTinyArticlesCategoriesModel *> *categories;
@end

@interface TDTinyArticlesSelectedModel : NSObject
@property (nonatomic, copy) NSString *from;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, assign) NSInteger look;
//id --> identify;
@property (nonatomic, assign) NSInteger identify;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger like;
@property (nonatomic, assign) NSInteger root_type;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, copy) NSString *tags;
@property (nonatomic, copy) NSString *url;
@end

@interface TDTinyArticlesCategoriesModel : NSObject
//id --> identify;
@property (nonatomic, assign) NSInteger identify;
@property (nonatomic, copy) NSString *name;
@end

@interface TDTinyHeadModel : NSObject
////id --> identify;
@property (nonatomic, assign) NSInteger identify;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger root_type;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *img;
@end

@interface TDTinyListModel : NSObject
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *position;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *open_time;
@property (nonatomic, copy) NSString *shop_time;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, assign) NSInteger per;
@property (nonatomic, copy) NSString *shareURL;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *tag;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *share_url;
//id --> identify;
@property (nonatomic, assign) NSInteger identify;
@property (nonatomic, assign) NSInteger classify_type;
@property (nonatomic, strong) NSArray<TDTinyListModel *> *tips;
@property (nonatomic, assign) NSInteger root_type;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, assign) NSInteger look;
@property (nonatomic, strong) NSArray *shop;
@property (nonatomic, copy) NSString *recommend;
@property (nonatomic, strong) NSArray *more;
@property (nonatomic, copy) NSString *detail;
//@property (nonatomic, strong) TinyListSpaceModel *space;
@property (nonatomic, assign) NSInteger signin;
@property (nonatomic, assign) NSInteger like;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) NSInteger shop_id;
//@end
//@interface TinyListSpaceModel : NSObject
//id --> sIdentify;
@property (nonatomic, assign) NSInteger sIdentify;
@property (nonatomic, assign) NSInteger tag_type;
@property (nonatomic, copy) NSString *icon;
//name --> sName;
@property (nonatomic, copy) NSString *sName;
@property (nonatomic, copy) NSString *icon_map;
//@end
//
//@interface TinyListTipsModel : NSObject
//id --> tipsID;
@property (nonatomic, assign) NSInteger tipsID;
//name --> tName;
@property (nonatomic, copy) NSString *tName;
//img --> tImg
@property (nonatomic, copy) NSString *tImg;
@end

