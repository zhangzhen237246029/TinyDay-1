//
//  TDWeekendViewController.m
//  TinyDay
//
//  Created by 臻 曦 on 16/8/19.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDTinyWeekendViewController.h"
#import "TDBasicCell.h"
#import "TDEventViewModel.h"
#import "TDFootView.h"
#import "TDEventWebViewController.h"

@interface TDTinyWeekendViewController ()
@property (nonatomic) TDEventViewModel *weekendVM;
@property (nonatomic) TDFootView *footView;
@end

@implementation TDTinyWeekendViewController
#pragma mark - Init 初始化
-(TDFootView *)footView{
    if (_footView == nil) {
        _footView = [[TDFootView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 30)];
        _footView.label.text = @"~ END ~";
    }
    return _footView;
}
- (TDEventViewModel *)weekendVM {
    if(_weekendVM == nil) {
        _weekendVM = [[TDEventViewModel alloc] init];
    }
    return _weekendVM;
}

#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"周末";
    [TDFactory addPopBackItemForVC:self];
    [self.tableView registerClass:[TDBasicCell class] forCellReuseIdentifier:@"Cell"];
    MJWeakSelf;
    [self.tableView addHeaderRefresh:^{
        [weakSelf.weekendVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [weakSelf.tableView reloadData];
            weakSelf.tableView.tableFooterView = weakSelf.footView;
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.weekendVM.cellNum;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TDBasicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSString *desLb = [NSString stringWithFormat:@"%@ · %@",[_weekendVM dateForCell:indexPath.section],[_weekendVM typeForCell:indexPath.section]];
    [cell.iconIv setImageURL:[_weekendVM imageURLForCell:indexPath.section]];
    cell.titleLb.text = [_weekendVM titleForCell:indexPath.section];
    cell.descLb.text = desLb;
    cell.priceLb.text = [_weekendVM priceForCell:indexPath.section];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds];
    cell.selectedBackgroundView.backgroundColor = kClearColor;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 280;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

#pragma mark - tableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TDEventWebViewController *webVC = [[TDEventWebViewController alloc]initWithWebURL:[_weekendVM webURL:indexPath.section] andIconUrl:[_weekendVM imageURLForCell:indexPath.section] andTitle:[_weekendVM titleForCell:indexPath.section]];    
    [self.navigationController pushViewController:webVC animated:YES];
}

@end
