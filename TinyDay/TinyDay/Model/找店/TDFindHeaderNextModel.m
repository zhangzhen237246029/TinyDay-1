//
//  LnHeaderNextModel.m
//  TinyDay
//
                        


//  Created by tarena46 on 16/8/16.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDFindHeaderNextModel.h"

@implementation TDFindHeaderNextModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[TDFindHeaderNextListModel class]};
}
@end


@implementation TDFindHeaderNextListModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"tips":[TDFindHeaderNextTipsModel class]};
}
@end


@implementation TDFindHeaderNextSpaceModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}
@end

@implementation TDFindHeaderNextShopOwnerModel
@end


@implementation TDFindHeaderNextRecommendUserModel
@end


@implementation TDFindHeaderNextTipsModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}
@end


