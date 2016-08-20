//
//  TDTinyViewController.m
//  TinyDay
//
//  Created by 臻 曦 on 16/8/11.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDTinyViewController.h"
#import "TDTinyViewModel.h"
#import "TDTinyHeadView.h"
#import "TDFootView.h"
#import "TDTinySelectedCell.h"
#import "TDBasicCell.h"
#import "TDTinyDateView.h"
#import "TDTinyReadView.h"
#import "TDTinyRankViewController.h"
#import "TDTinyWeekendViewController.h"
#import "TDTinyHeadWebViewController.h"
#import "TDTinySelectedWebViewController.h"
#import "TDTinyListWebViewController.h"

@interface TDTinyViewController () <headViewDelegate,headViewDataSource>
@property (nonatomic) TDTinyViewModel *tinyVM;
@property (nonatomic) TDTinyHeadView *headV;
@property (nonatomic) TDFootView *footView;
@end

@implementation TDTinyViewController
#pragma mark - LazyLoad 懒加载
- (TDTinyViewModel *)tinyVM {
    if(_tinyVM == nil) {
        _tinyVM = [[TDTinyViewModel alloc] init];
    }
    return _tinyVM;
}
- (TDTinyHeadView *)headV {
    if(_headV == nil) {
        _headV = [[TDTinyHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 0)];
        _headV.delegate = self;
        _headV.dataSource = self;
        _headV.duration = 3;
    }
    return _headV;
}
-(TDFootView *)footView{
    if (_footView == nil) {
        _footView = [[TDFootView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 30)];
        _footView.label.text = @"~ END ~";
    }
    return _footView;
}

#pragma mark - HeadView DateSource
- (NSInteger)numberOfItems:(TDTinyHeadView *)headView{
    return self.tinyVM.rowNumber;
}
- (NSURL *)headView:(TDTinyHeadView *)headView iconURLForIndex:(NSInteger)index{
    return [self.tinyVM indexIconUrl:index];
}
- (void)headView:(TDTinyHeadView *)headView didSelsctedItemIndex:(NSInteger)index{
    
    TDTinyHeadWebViewController *vc = [[TDTinyHeadWebViewController alloc] initWithWebURL:[self.tinyVM detialUrl:index] andIconUrl:[self.tinyVM indexIconUrl:index] andTitle:[self.tinyVM indexTitle:index]];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [TDFactory addSendMessageForVc:self clickedHandler:nil];
    [TDFactory addShowCityForVc:self clickedHandler:nil];
    
    MJWeakSelf;
    [self.headV setBtnClicked:^(UIControl *sender) {
        if (sender.tag == 101 ) {
            TDTinyRankViewController *vc = [[TDTinyRankViewController alloc] initWithStyle:UITableViewStylePlain];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
        if (sender.tag == 102) {
            TDTinyWeekendViewController *vc = [[TDTinyWeekendViewController alloc] initWithStyle:UITableViewStyleGrouped];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
    }];
    [self.tableView registerClass:[TDTinySelectedCell class] forCellReuseIdentifier:@"SelectedCell"];
    [self.tableView registerClass:[TDBasicCell class] forCellReuseIdentifier:@"ListCell"];
    [self.tableView addHeaderRefresh:^{
        [weakSelf.tinyVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [weakSelf.tableView reloadData];
            weakSelf.tableView.tableHeaderView = weakSelf.headV;
            weakSelf.tableView.tableHeaderView.backgroundColor = [UIColor whiteColor];
            [weakSelf.headV reloadData];
            weakSelf.tableView.tableFooterView = weakSelf.footView;
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
    self.tableView.sectionHeaderHeight = 10;
    self.tableView.sectionFooterHeight = 0;    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tinyVM.sectionNumber;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.tinyVM.selectedNumber;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        TDTinySelectedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SelectedCell" forIndexPath:indexPath];
        [cell.iconIV setImageURL:[self.tinyVM selectedIconUrl:indexPath.row]];
        cell.titleLb.text = [self.tinyVM selectedTitle:indexPath.row];
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds];
        cell.selectedBackgroundView.backgroundColor = kClearColor;
        return cell;
    }else{
        TDBasicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
        [cell.iconIv setImageURL:[self.tinyVM listIconForSection:indexPath.section]];
        cell.titleLb.text = [self.tinyVM listTitleForSection:indexPath.section];
        cell.descLb.text = [self.tinyVM listDescForSection:indexPath.section];
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds];
        cell.selectedBackgroundView.backgroundColor = kClearColor;
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 130;
    }
    return 280;
}
//分区头高度;
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 100;
    }
    return 10;
}
//分区脚部高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 50;
    }
    return 0;
}
//分区头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        TDTinyDateView *dateView = [[TDTinyDateView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 130)];
        dateView.dateLb.text = [self.tinyVM dayForRow:section];
        dateView.titleLb.text = [self.tinyVM DaytitleForRow:section];
        dateView.backgroundColor = [UIColor whiteColor];
        [dateView setBtnClicked:^(UIButton *sender) {
            NSLog(@"button被点击了");
        }];
        return dateView;
    }
    return nil;
}
//分区脚部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 0) {
        TDTinyReadView *readView = [[TDTinyReadView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 50)];
        readView.backgroundColor = [UIColor whiteColor];
        readView.titleLb.text = @"查看更多";
        readView.iconIv.image = [UIImage imageNamed:@"dailyreading"];
        [readView setBtnClicked:^(UIButton *sender) {
            NSLog(@"button被点击了");
        }];        
        return readView;
    }
    return nil;
}

#pragma mark - TableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        TDTinySelectedWebViewController *vc = [[TDTinySelectedWebViewController alloc] initWithWebURL:[self.tinyVM selectedDetailUrl:indexPath.row] andIconUrl:[self.tinyVM selectedIconUrl:indexPath.row] andTitle:[self.tinyVM selectedTitle:indexPath.row]];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        TDTinyListWebViewController *vc = [[TDTinyListWebViewController alloc] initWithWebURL:[self.tinyVM listDetailForSection:indexPath.section] andIconUrl:[self.tinyVM listIconForSection:indexPath.section] andTitle:[self.tinyVM listTitleForSection:indexPath.section]];
        //initWitURL:[self.tinyVM listDetailForSection:indexPath.section]];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
