//
//  TDListModel.h
//  TinyDay
//
//  Created by 臻 曦 on 16/8/18.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TDListListModel;
@interface TDListModel : NSObject
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSArray<TDListListModel *> *list;
@end

@interface TDListListModel : NSObject
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, assign) NSInteger root_type;
//id --> identify
@property (nonatomic, assign) NSInteger identify;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *tags;
@property (nonatomic, copy) NSString *url;

@end

