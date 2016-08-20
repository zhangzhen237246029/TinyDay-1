//
//  LNFoundShopViewModel.m
//  TinyDay
//



//  Created by tarena46 on 16/8/13.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDFindViewModel.h"

@implementation TDFindViewModel

-(void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    self.dataTask = [TDNetManager getFindCompletionHandler:^(TDFindModel *model, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                self.tagArr = model.tags;
                if (model.cbds != nil) {
                    self.CbdsArr = model.cbds;
                }
                self.themesArr = model.themes;
            }
            if (model.cbds != nil) {
                self.CbdsArr = model.cbds;
            }
            self.tagArr = model.tags;        
            self.themesArr = model.themes;
        }
        !completionHandler ?: completionHandler(error);
    }];
}

/******  collectionview  ******/
-(NSInteger)rowCollectionNum{
    return 8;
}
-(NSURL *)imageViewForRow:(NSInteger)row{
    return self.tagArr[row].icon.im_URL;
}
-(NSString *)labelForRow:(NSInteger)row{
    return self.tagArr[row].name;
}

/******  tableview  ******/
//多少个分区
-(NSInteger)sectionNum{
    return self.CbdsArr != nil ? 2 : 1;
}
//每个分区有几行
-(NSInteger)RowForSection:(NSInteger)section{
    if (self.CbdsArr != nil) {
        return section == 0 ? self.CbdsArr.count :self.themesArr.count;
    }else{
        return self.themesArr.count;
    }
}
//cell中的图片
-(NSURL *)headerIVForSection:(NSInteger)section Row:(NSInteger)row{
    if (self.CbdsArr != nil) {
        if (section == 0) {
            return self.CbdsArr[row].img.im_URL;
        }else{
            return self.themesArr[row].img.im_URL;
        }
    }else{
        return self.themesArr[row].img.im_URL;
    }
}
-(NSString *)titleLbForSection:(NSInteger)section Row:(NSInteger)row{
    if (self.CbdsArr != nil) {
        if (section == 0) {
            return nil;
        }else{
            return self.themesArr[row].title;
        }
    }else{
        return self.themesArr[row].title;
    }
}
-(NSString *)nameLbForSection:(NSInteger)section Row:(NSInteger)row{
    NSString *str = self.themesArr[row].tag;
    NSString *string = nil;
    if ([str containsString:@","]) {
        string = [str stringByReplacingOccurrencesOfString:@"," withString:@" #"];
    }
    if (self.CbdsArr != nil) {
        if (section == 0) {
            return nil;
        }else{
            
            if ([str containsString:@","]) {
                return [NSString stringWithFormat:@"#%@",string];
            }else{
                return [NSString stringWithFormat:@"#%@",str];
            }            
        }
    }else{
        if ([str containsString:@","]) {
            return [NSString stringWithFormat:@"#%@",string];
        }else{
            return [NSString stringWithFormat:@"#%@",str];
        }
    }
}
@end
