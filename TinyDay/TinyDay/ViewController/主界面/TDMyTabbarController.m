//
//  TDMyTabbarController.m
//  TinyDay
//
//  Created by 臻 曦 on 16/8/11.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDMyTabbarController.h"
#import "TDTinyViewController.h"
#import "TDEventViewController.h"
#import "TDFindViewController.h"
#import "TDMineViewController.h"



@interface TDMyTabbarController ()
/******  四个子界面  ******/
@property (nonatomic) TDTinyViewController *tvc;
@property (nonatomic) TDEventViewController *evc;
@property (nonatomic) TDFindViewController *fvc;
@property (nonatomic) TDMineViewController *mvc;
@end

@implementation TDMyTabbarController
#pragma mark - LazyLoad 懒加载
- (TDTinyViewController *)tvc {
    if(_tvc == nil) {
        _tvc = [[TDTinyViewController alloc] init];
        _tvc.title = @"小日子";
        _tvc.tabBarItem.image = [UIImage imageNamed:@"life_1"];
        _tvc.tabBarItem.selectedImage = [UIImage imageNamed:@"life_2"];
    }
    return _tvc;
}

- (TDEventViewController *)evc {
    if(_evc == nil) {
        _evc = [[TDEventViewController alloc] initWithStyle:UITableViewStyleGrouped];
        _evc.title = @"好玩";
        _evc.tabBarItem.image = [UIImage imageNamed:@"fun_1"];
        _evc.tabBarItem.selectedImage = [UIImage imageNamed:@"fun_2"];
    }
    return _evc;
}

- (TDFindViewController *)fvc {
    if(_fvc == nil) {
        _fvc = [[TDFindViewController alloc] init];
        _fvc.title = @"找店";
        _fvc.tabBarItem.image = [UIImage imageNamed:@"fstore_1"];
        _fvc.tabBarItem.selectedImage = [UIImage imageNamed:@"fstore_2"];
    }
    return _fvc;
}

- (TDMineViewController *)mvc {
    if(_mvc == nil) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 1;
        CGFloat width = (kScreenW - 2)/2;
        CGFloat height = width/370*200;
        layout.itemSize = CGSizeMake(width, height);
        _mvc = [[TDMineViewController alloc] initWithCollectionViewLayout:layout];
        _mvc.title = @"我的";
        _mvc.tabBarItem.image = [UIImage imageNamed:@"my_1"];
        _mvc.tabBarItem.selectedImage = [UIImage imageNamed:@"my_2"];
    }
    return _mvc;
}


#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /******  全局tabbar和navigationbar视图属性  ******/
    [UITabBar appearance].translucent = NO;
    [UITabBar appearance].tintColor = kRGBA(28, 28, 28, 1);
    [UINavigationBar appearance].translucent = NO;
    [UINavigationBar appearance].barStyle = UIBarStyleBlack;
    [UINavigationBar appearance].barTintColor = kRGBA(28, 28, 28, 1);
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    
    UINavigationController *navi0 = [[UINavigationController alloc] initWithRootViewController:self.tvc];
    UINavigationController *navi1 = [[UINavigationController alloc] initWithRootViewController:self.evc];
    UINavigationController *navi2 = [[UINavigationController alloc] initWithRootViewController:self.fvc];
    UINavigationController *navi3 = [[UINavigationController alloc] initWithRootViewController:self.mvc];
    self.viewControllers = @[navi0, navi1, navi2, navi3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
