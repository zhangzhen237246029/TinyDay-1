//
//  TDListViewModel.m
//  TinyDay
//
//  Created by 臻 曦 on 16/8/18.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDListViewModel.h"

@implementation TDListViewModel
- (NSInteger)rowNumber{
    return self.dataList.count;
}

- (NSURL *)iconForRow:(NSInteger)row{
    return self.dataList[row].img.im_URL;
}
-(NSString *)titleForRow:(NSInteger)row{
    return self.dataList[row].title;
}
- (NSURL *)detailUrlForRow:(NSInteger)row{
    return self.dataList[row].url.im_URL;
}
- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    self.dataTask = [TDNetManager getListCompletionHandler:^(TDListModel *models, NSError *error) {
        if (!error) {
            self.dataList = models.list;
        }
        !completionHandler ?: completionHandler(error);
    }];
}

@end
