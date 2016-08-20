//
//  TDFindClassViewController.h
//  TinyDay
//
//  Created by tarena31 on 16/8/20.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDFindClassViewController : UITableViewController
@property (nonatomic) NSInteger num;
-(instancetype)initWithNum:(NSInteger)num;
@property (nonatomic) NSString *name;
@end
