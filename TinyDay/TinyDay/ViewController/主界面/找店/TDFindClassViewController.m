//
//  LNHeaderNextTableViewController.m
//  TinyDay
//
//  Created by tarena46 on 16/8/16.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDFindClassViewController.h"
#import "TDFindClassMoreViewModel.h"
#import "TDBasicCell.h"
#import "TDLNWebViewController.h"
#import "TDFootView.h"

@interface TDFindClassViewController ()

@property (nonatomic) TDFindClassMoreViewModel *LnHeaderNextVM;

@end

@implementation TDFindClassViewController

- (instancetype)initWithNum:(NSInteger)num
{
    self = [super init];
    if (self) {
        _num = num;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [TDFactory addPopBackItemForVC:self];
    
    self.title = self.name;
    
    __weak typeof (self)weakSelf = self;
    [self.tableView addHeaderRefresh:^{
        [weakSelf.LnHeaderNextVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [weakSelf.tableView endHeaderRefresh];
            [weakSelf.tableView reloadData];
        }];
    }];
    [self.tableView beginHeaderRefresh];
    
    
    
    [self.tableView registerClass:[TDBasicCell class] forCellReuseIdentifier:@"cell"];
    TDFootView *view = [[TDFootView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 44)];
    view.backgroundColor =[UIColor colorWithRed:.9 green:.9 blue:.9 alpha:1];
    self.tableView.tableFooterView = view;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.LnHeaderNextVM.numRow;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TDBasicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell.iconIv setImageURL: [self.LnHeaderNextVM HeaderIVForRow:indexPath.row]];
    cell.descLb.text = [self.LnHeaderNextVM nameLbForName:self.name Row:indexPath.row];
    cell.titleLb.text = [self.LnHeaderNextVM titleLbForRow:indexPath.row];
    cell.contentView.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:.9 alpha:1];
    
    
    return cell;
}

//cell 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat height = kScreenW * 400 / 640 + 54;
    
    return height;
    
}

//点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    WebViewController *wvc = [[WebViewController alloc] initWithURL:[self.LnHeaderNextVM dateListForRow:indexPath.row]];
    [self.navigationController pushViewController:wvc animated:YES];
    
}

- (TDFindClassMoreViewModel *)LnHeaderNextVM {
    if(_LnHeaderNextVM == nil) {
        _LnHeaderNextVM = [[TDFindClassMoreViewModel alloc] initWithNum:self.num];
        
    }
    return _LnHeaderNextVM;
}

@end
