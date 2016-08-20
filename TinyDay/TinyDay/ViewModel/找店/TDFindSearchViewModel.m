//
//  TDSearchViewModel.m
//  TinyDay
//
                        


//  Created by tarena46 on 16/8/17.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDFindSearchViewModel.h"

@implementation TDFindSearchViewModel
-(void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    self.dataTask = [TDNetManager getSearchDataList:self.keywords CompletionHandler:^(TDFindHeaderNextModel *model, NSError *error) {
        if (!error) {            
            self.dataList = model.list;
        }
        !completionHandler ?: completionHandler(error);
    }];
}

//有几行
-(NSInteger)numRow{
    return self.dataList.count;
}
//cell 里面的 headerIV
-(NSURL *)HeaderIVForRow:(NSInteger)row{
    return self.dataList[row].img.im_URL;
}
-(NSString *)titleLbForRow:(NSInteger)row{
    return self.dataList[row].title;
}
-(NSString *)nameLbForRow:(NSInteger)row{
 NSString *str = [NSString stringWithFormat:@"%@ ·「 %@ 」· ",self.dataList[row].space.name,self.dataList[row].name];
    return str;
}

//点击下一页详情
-(NSURL *)dateURLForRow:(NSInteger)row{
return self.dataList[row].share_url.im_URL;
}



@end
