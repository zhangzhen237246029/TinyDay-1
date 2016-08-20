//
//  EventModel.h
//  TinyDay
//
//  Created by tarena30 on 16/8/15.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TDEventHeadModel,TDEventListModel,TDEventListTimeListModel,TDEventListTicketsModel;

@interface TDEventModel : NSObject
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) NSArray<TDEventListModel *> *list;//tableview中的内容
@property (nonatomic, strong) NSArray<TDEventHeadModel *> *head;//头部数据
@end

@interface TDEventHeadModel : NSObject
//id ->hID
@property (nonatomic, assign) NSInteger hID;
@property (nonatomic, copy) NSString *img;//头部图片
@property (nonatomic, assign) NSInteger root_type;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *title;
@end

@interface TDEventListModel : NSObject
@property (nonatomic, assign) NSInteger like;//收藏人数
@property (nonatomic, strong) NSArray<NSString *> *imgs;//详情图片数组
@property (nonatomic, strong) NSArray<TDEventListTicketsModel *> *tickets;//售票类型
@property (nonatomic, copy) NSString *poi;//店名
@property (nonatomic, assign) NSInteger look;
@property (nonatomic, copy) NSString *position;//地理位置
//id -> ID
@property (nonatomic, assign) NSInteger ID;//活动id
@property (nonatomic, copy) NSString *ticket_rule;//票规则
@property (nonatomic, copy) NSString *url;//详情web页面
@property (nonatomic, copy) NSString *title;//标题
@property (nonatomic, copy) NSString *tag;//标签
@property (nonatomic, copy) NSString *address;//商家地址
@property (nonatomic, copy) NSString *city;//城市
@property (nonatomic, assign) NSInteger leo_id;
@property (nonatomic, copy) NSString *content;
//date.time_list
@property (nonatomic, strong) NSArray<TDEventListTimeListModel *> *time_list;
//date.time_type
@property (nonatomic, assign) NSInteger time_type;//时间类型
//business.name
@property (nonatomic, copy) NSString *name;
//business.id
@property (nonatomic, assign) NSInteger busID;
//business.head_photo
@property (nonatomic, copy) NSString *head_photo;
@end

@interface TDEventListTimeListModel : NSObject
@property (nonatomic, copy) NSString *weekdays;//
@property (nonatomic, copy) NSString *end_date;//活动截止日期
@property (nonatomic, copy) NSString *start_time;//开始时间
@property (nonatomic, copy) NSString *start_date;//开始日期
@property (nonatomic, copy) NSString *end_time;//结束时间
@end

@interface TDEventListTicketsModel : NSObject
@property (nonatomic, assign) NSInteger discount;
@property (nonatomic, assign) NSInteger min_shot;
@property (nonatomic, assign) NSInteger tID;//id
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *start_time;
@property (nonatomic, assign) NSInteger stock;
@property (nonatomic, strong) NSArray<NSNumber *> *pay_types;
@property (nonatomic, assign) NSInteger price;//活动价格
@property (nonatomic, assign) NSInteger item_type;
@property (nonatomic, assign) NSInteger origin_price;
@property (nonatomic, copy) NSString *end_time;
@property (nonatomic, assign) NSInteger max_shot;
@property (nonatomic, assign) NSInteger total_stock;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger status;
@end

