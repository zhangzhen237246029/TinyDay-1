//
//  TDTinyListController.m
//  TinyDay
//
//  Created by 臻 曦 on 16/8/18.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDTinyRankViewController.h"
#import "TDListViewModel.h"
#import "TDTinyListCell.h"
#import "TDFootView.h"

#import "TDTinyRankDetailWebViewController.h"


@interface TDTinyRankViewController ()
@property (nonatomic) TDListViewModel *listVM;
@property (nonatomic) TDFootView *footView;

@end

@implementation TDTinyRankViewController
#pragma mark - LazyLoad 懒加载;
- (TDListViewModel *)listVM {
    if(_listVM == nil) {
        _listVM = [[TDListViewModel alloc] init];
    }
    return _listVM;
}

-(TDFootView *)footView{
    if (_footView == nil) {
        _footView = [[TDFootView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 30)];
        _footView.label.text = @"~ END ~";
    }
    return _footView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"榜单";
    MJWeakSelf;
    [TDFactory addPopBackItemForVC:self];
    [self.tableView addHeaderRefresh:^{
        [weakSelf.listVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [weakSelf.tableView reloadData];
            weakSelf.tableView.tableFooterView = weakSelf.footView;
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
    [self.tableView registerClass:[TDTinyListCell class] forCellReuseIdentifier:@"ListCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TDTinyListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
    [cell.iconView setImageURL:[self.listVM iconForRow:indexPath.row]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = kScreenW * 468 / 750;
    return height + 10;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TDTinyRankDetailWebViewController *vc = [[TDTinyRankDetailWebViewController alloc] initWithWebURL:[self.listVM detailUrlForRow:indexPath.row] andIconUrl:[self.listVM iconForRow:indexPath.row] andTitle:[self.listVM titleForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
