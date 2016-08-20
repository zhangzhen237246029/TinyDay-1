//
//  TDFunViewController.m
//  TinyDay
//
//  Created by 臻 曦 on 16/8/11.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDEventViewController.h"
#import "TDEventViewModel.h"
#import "TDBasicCell.h"
#import "TDFootView.h"
#import "TDEventWebViewController.h"

@interface TDEventViewController ()
@property(nonatomic)TDEventViewModel *eventVM;
@property(nonatomic)UIImageView *headView;
@property (nonatomic) TDFootView *footView;
@end

@implementation TDEventViewController
#pragma mark - LazyLoad 懒加载
- (TDEventViewModel *)eventVM {
    if(_eventVM == nil) {
        _eventVM = [[TDEventViewModel alloc] init];
    }
    return _eventVM;
}
- (UIImageView *)headView {
    if(_headView == nil) {
        _headView = [[UIImageView alloc] init];
        _headView.contentMode = UIViewContentModeScaleAspectFill;
        _headView.clipsToBounds = YES;
        _headView.frame = CGRectMake(0, 64, kScreenW, kScreenW * 0.5)
        ;
    }
    _headView.userInteractionEnabled = YES;
    UIControl *headC = [UIControl new];
    [_headView addSubview:headC];
    [headC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    [headC bk_addEventHandler:^(id sender) {
        TDEventWebViewController *webVC = [[TDEventWebViewController alloc]initWithWebURL:[self.eventVM adURL] andIconUrl:[self.eventVM adImageUrl] andTitle:[self.eventVM adTitle]];
        [self.navigationController pushViewController:webVC animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    return _headView;
}
-(TDFootView *)footView{
    if (_footView == nil) {
        _footView = [[TDFootView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 30)];
        _footView.label.text = @"~ END ~";
    }
    return _footView;
}

#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TDBasicCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.tableHeaderView = self.headView;
    
    MJWeakSelf;
    [self.tableView addHeaderRefresh:^{
        [weakSelf.eventVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [weakSelf.tableView reloadData];
            [weakSelf.headView setImageURL:[weakSelf.eventVM headImg]];
            weakSelf.tableView.tableFooterView = weakSelf.footView;
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TablView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _eventVM.cellNum;;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TDBasicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSString *desLb = [NSString stringWithFormat:@"%@ · %@",[_eventVM dateForCell:indexPath.section],[_eventVM typeForCell:indexPath.section]];
    [cell.iconIv setImageURL:[_eventVM imageURLForCell:indexPath.section]];
    cell.titleLb.text = [_eventVM titleForCell:indexPath.section];
    cell.descLb.text = desLb;
    cell.priceLb.text = [_eventVM priceForCell:indexPath.section];
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
    TDEventWebViewController *webVC = [[TDEventWebViewController alloc]initWithWebURL:[_eventVM webURL:indexPath.section] andIconUrl:[_eventVM imageURLForCell:indexPath.section] andTitle:[_eventVM titleForCell:indexPath.section]];
    NSLog(@"URL:%@",[_eventVM webURL:indexPath.section]);
    [self.navigationController pushViewController:webVC animated:YES];
}

@end
