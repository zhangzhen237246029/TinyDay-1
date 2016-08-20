//
//  LnHeaderNextModel.h
//  TinyDay
//

//  Created by tarena46 on 16/8/16.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TDFindHeaderNextListModel,TDFindHeaderNextSpaceModel,TDFindHeaderNextShopOwnerModel,TDFindHeaderNextRecommendUserModel,TDFindHeaderNextTipsModel;

@interface TDFindHeaderNextModel : NSObject
@property (nonatomic, strong) NSArray<TDFindHeaderNextListModel *> *list;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, assign) NSInteger code;
@end

@interface TDFindHeaderNextListModel : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *icon_map;
@property (nonatomic, assign) NSInteger tag_type;
@property (nonatomic, assign) NSInteger shop_id;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *position;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) TDFindHeaderNextRecommendUserModel *recommend_user;
@property (nonatomic, copy) NSString *shop_time;
@property (nonatomic, copy) NSString *open_time;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, assign) NSInteger per;
@property (nonatomic, strong) TDFindHeaderNextShopOwnerModel *shop_owner;
@property (nonatomic, copy) NSString *shareURL;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *tag;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *share_url;
//id--ID
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, strong) NSArray<TDFindHeaderNextTipsModel *> *tips;
@property (nonatomic, assign) NSInteger classify_type;
@property (nonatomic, assign) NSInteger root_type;
@property (nonatomic, assign) NSInteger look;
@property (nonatomic, strong) NSArray *shop;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, strong) NSArray *more;
@property (nonatomic, copy) NSString *recommend;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, strong) TDFindHeaderNextSpaceModel *space;
@property (nonatomic, assign) NSInteger signin;
@property (nonatomic, assign) NSInteger like;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *content;
@end

@interface TDFindHeaderNextSpaceModel : NSObject
//id--ID
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) NSInteger tag_type;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *icon_map;
@property (nonatomic, copy) NSString *name;
@end

@interface TDFindHeaderNextShopOwnerModel : NSObject
@end

@interface TDFindHeaderNextRecommendUserModel : NSObject
@end

@interface TDFindHeaderNextTipsModel : NSObject
@property (nonatomic, copy) NSString *img;
//id---ID
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy) NSString *name;
@end

