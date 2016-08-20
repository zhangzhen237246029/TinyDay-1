//
//  NetManager.m
//  TinyDay
//



//  Created by tarena31 on 16/8/13.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDNetManager.h"

@implementation TDNetManager
+ (id)getTinyCompletionHandler:(void (^)(TDTinyModel *, NSError *))completionHandler{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"SmallDay" ofType:nil];
    return [self GET:path parameters:nil completionHandler:^(id repsonseObj, NSError *error) {
        !completionHandler ?: completionHandler([TDTinyModel parse:repsonseObj],error);
    }];
}
+ (id)getListCompletionHandler:(void (^)(TDListModel *, NSError *))completionHandler{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"List" ofType:nil];
    return [self GET:path parameters:nil completionHandler:^(id repsonseObj, NSError *error) {
        !completionHandler ?: completionHandler([TDListModel parse:repsonseObj],error);
    }];
    
}

+(id)getEventCompletionHandler:(void (^)(TDEventModel *, NSError *))completionHandler{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Experience" ofType:nil];
    return [self GET:path parameters:nil completionHandler:^(id repsonseObj, NSError *error) {
        !completionHandler ?: completionHandler([TDEventModel parse:repsonseObj],error);
    }];
}

+(id)getFindCompletionHandler:(void (^)(TDFindModel *, NSError *))completionHandler{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"lookShop" ofType:nil];
    return [self GET:path parameters:nil completionHandler:^(id repsonseObj, NSError *error) {
        !completionHandler ?: completionHandler([TDFindModel parse:repsonseObj],error);
    }];
}

+(id)getFindHeaderNext:(NSInteger)Num CompletionHandler:(void (^)(TDFindHeaderNextModel *, NSError *))completionHandler{
    NSString *path = nil;
    switch (Num) {
        case 0:
            path = [[NSBundle mainBundle] pathForResource:@"Study" ofType:nil];
            break;
        case 1:
            path = [[NSBundle mainBundle] pathForResource:@"Cafe" ofType:nil];
            break;
        case 2:
            path = [[NSBundle mainBundle] pathForResource:@"meal" ofType:nil];
            break;
        case 3:
            path = [[NSBundle mainBundle] pathForResource:@"tea" ofType:nil];
            break;
        case 4:
            path = [[NSBundle mainBundle] pathForResource:@"museum" ofType:nil];
            break;
        case 5:
            path = [[NSBundle mainBundle] pathForResource:@"workRoom" ofType:nil];
            break;
        case 6:
            path = [[NSBundle mainBundle] pathForResource:@"hand" ofType:nil];
            break;
        case 7:
            path = [[NSBundle mainBundle] pathForResource:@"more" ofType:nil];
            break;
        case 100:
            path = [[NSBundle mainBundle] pathForResource:@"nanshan" ofType:nil];
            break;
        default:
            break;
    }
    return [self GET:path parameters:nil completionHandler:^(id repsonseObj, NSError *error) {
        !completionHandler ?: completionHandler([TDFindHeaderNextModel parse:repsonseObj],error);
    }];
}
+(id)getSearchDataList:(NSString *)name CompletionHandler:(void (^)(TDFindHeaderNextModel *, NSError *))completionHandler{
    NSString *Path = [[NSBundle mainBundle] pathForResource:@"coffe" ofType:nil];
    return [self GET:Path parameters:nil completionHandler:^(id repsonseObj, NSError *error) {
        !completionHandler ?: completionHandler([TDFindHeaderNextModel parse:repsonseObj],error);
    }];
    
}
@end
