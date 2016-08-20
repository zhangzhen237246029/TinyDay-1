//
//  LNfounShopModel.m
//  TinyDay
//



//  Created by tarena46 on 16/8/13.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDFindModel.h"

@implementation TDFindModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"themes":[TDFindThemesModel class],@"tags":[TDFindTagsModel class],@"cbds":[TDFindCbdsModel class]};
}
@end


@implementation TDFindCbdsModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}
@end


@implementation TDFindTagsModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}
@end


@implementation TDFindThemesModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
    
}
@end


