//
//  TinyModel.m
//  TinyDay
//
//  Created by 臻 曦 on 16/8/15.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDTinyModel.h"

@implementation TDTinyModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"head":[TDTinyHeadModel class], @"list":[TDTinyListModel class]};
}
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"date":@"day.date", @"identify":@"day.id", @"like":@"day.like", @"title":@"day.title"};
}
@end


@implementation TDTinyArticlesModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"categories":[TDTinyArticlesCategoriesModel class], @"selected":[TDTinyArticlesSelectedModel class]};
}
@end


@implementation TDTinyArticlesSelectedModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"identify":@"id"};
}
@end


@implementation TDTinyArticlesCategoriesModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"identify":@"id"};
}
@end


@implementation TDTinyHeadModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"identify":@"id"};
}
@end


@implementation TDTinyListModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"identify":@"id",@"sIdentify":@"space.id", @"sName":@"space.name", @"tipsID":@"tips.id", @"tName":@"tips.name", @"tImg":@"tips.img"};
}
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"tips":[TDTinyListModel class]};
}
@end





