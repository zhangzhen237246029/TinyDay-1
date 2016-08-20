//
//  LnHeaderNextViewModel.m
//  TinyDay
//



//  Created by tarena46 on 16/8/16.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDFindClassMoreViewModel.h"

@implementation TDFindClassMoreViewModel

- (instancetype)initWithNum:(NSInteger)num{
    self = [super init];
    if (self) {
        _num = num;
    }
    return self;
}

-(void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    self.dataTask = [TDNetManager getFindHeaderNext:self.num CompletionHandler:^(TDFindHeaderNextModel *model, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                self.dataList = nil;
            }
            self.dataList = model.list;
        }
        !completionHandler ?: completionHandler(error);
    }];
}

/******  TableView  ******/
//每个分区有几行
-(NSInteger)numRow{
    return self.dataList.count;
}
-(NSURL *)HeaderIVForRow:(NSInteger)row{
    return self.dataList[row].img.im_URL;
}
-(NSString *)titleLbForRow:(NSInteger)row{
    return self.dataList[row].title;
}
-(NSString *)nameLbForName:(NSString*)name Row:(NSInteger)row{
    NSString *str = [NSString stringWithFormat:@"%@ ·「 %@ 」· ",name,self.dataList[row].name];
    return str;
}
-(NSURL *)dateListForRow:(NSInteger)row{
    return self.dataList[row].share_url.im_URL;    
}

/******  CollectionView  ******/
-(NSInteger)numCollectionCell{
    return self.dataList.count;
}
-(NSURL *)collectionHanderIVForRow:(NSInteger)row{
    return self.dataList[row].img.im_URL;
}
-(NSString *)collectionTitleForRow:(NSInteger)row{
    return self.dataList[row].name;
}

@end
