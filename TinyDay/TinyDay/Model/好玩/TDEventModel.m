//
//  EventModel.m
//  TinyDay
//
//  Created by tarena30 on 16/8/15.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDEventModel.h"

@implementation TDEventModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{

    return @{@"list":[TDEventListModel class],@"head":[TDEventHeadModel class]};
}
@end


@implementation TDEventHeadModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"hID":@"id"};
}
@end


@implementation TDEventListModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"tickets":[TDEventListTicketsModel class],@"time_list":[TDEventListTimeListModel class]};
}
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"time_list":@"date.time_list",@"time_type":@"date.time_type",@"name":@"business.name",@"busID":@"business.id",@"head_photo":@"business.head_photo"};
}
@end

@implementation TDEventListTicketsModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"tID":@"id"};
}
@end



@implementation TDEventListTimeListModel

@end


