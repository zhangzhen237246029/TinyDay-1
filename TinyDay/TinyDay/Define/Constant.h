//
//  Constant.h
//  TRProject
//
//  Created by yingxin on 16/7/19.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

/******  sdk  ******/
#define kEMKey @""
#define kSMSKey @"15fd1dc4be6b0"
#define kSMSSecret @"ffa58e62a36319da8436d3fc84bcb14d"
#define kShareKey @"15fd2e606bf7f"
#define kShareSecret @"665c1be6a8d2b1a462bc5578aafd572d"
#define kQQAppId @"1105629374"//41E690BE
#define kQQAppKey @"XDRBnUnYuKpD1ZxT"
#define kSinaWeiboAppKey @"4145223938"
#define kSinaWeiboAppSecret @"7f9b2bc7d8f5aa5e585dfae323a8db1a"
#define kWeChatAppKey @"wx061f535650d8f5c9"
#define kWeChatAppSecret @"88ec5020975ebbc542ee6523755d0e12"

/******  appdelegate指针  ******/
#define kAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

/******  屏幕点宽高  ******/
#define kScreenW ([UIScreen mainScreen].bounds.size.width)
#define kScreenH ([UIScreen mainScreen].bounds.size.height)
#define kScreenBounds ([UIScreen mainScreen].bounds)
#define kScreenNativeH ([UIScreen mainScreen].nativeBounds.size.height)
#define kScreenNativeW ([UIScreen mainScreen].nativeBounds.size.width)

/******  去掉cell分隔线的左边距  ******/
#define kRemoveLeftSeparator(cell) \
cell.separatorInset = UIEdgeInsetsZero;\
cell.layoutMargins = UIEdgeInsetsZero;\
cell.preservesSuperviewLayoutMargins = NO;\

/******  设置随机颜色  ******/
#define kRandomColor ([UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0])
/******  设置RGB/RGBA颜色  ******/
#define kRGBA(r,g,b,a) ([UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a])
/******  clear背景颜色  ******/
#define kClearColor ([UIColor clearColor])

/******  测试用NSLog  ******/
#ifdef DEBUG
#define kLOG(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define kLOG(...)
#endif

/******  弱引用/强引用  ******/
#define kWEAKSELF(type)  __weak typeof(type) weak##type = type;
#define kSTRONGSELF(type)  __strong typeof(type) type = weak##type;

/******  设置view圆角和边框  ******/
#define kViewBorderRadius(View, Radius, Width, Color)\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

/******  沙盒目录文件  ******/
//获取temp
#define kTEMP NSTemporaryDirectory()
//获取沙盒 Document
#define kDOCUMENT [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kCACHE [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

/******  归档解档  ******/
#define kCodingDesc \
-(void)encodeWithCoder:(NSCoder *)aCoder{\
[self modelEncodeWithCoder:aCoder];\
}\
-(instancetype)initWithCoder:(NSCoder *)aDecoder{\
self = [super init];\
return [self modelInitWithCoder:aDecoder];\
}\
-(NSString *)description{\
return [self modelDescription];\
}

#endif









