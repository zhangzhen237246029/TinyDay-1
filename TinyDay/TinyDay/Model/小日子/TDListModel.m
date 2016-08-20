//
//  TDListModel.m
//  TinyDay
//
//  Created by 臻 曦 on 16/8/18.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDListModel.h"

@implementation TDListModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[TDListListModel class]};
}
@end
@implementation TDListListModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"identify":@"id"};
}

@end


