//
//  TDSearchTableViewController.m
//  TinyDay
//
//  Created by tarena46 on 16/8/17.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDFindSearchViewController.h"
#import "TDFindSearchViewModel.h"
#import "TDBasicCell.h"
#import "TDFootView.h"
#import "TDLNWebViewController.h"

@interface TDFindSearchViewController ()<UISearchBarDelegate>

@property (nonatomic) TDFindSearchViewModel *searchVM;

@property (nonatomic) TDFootView *footView;

@end

@implementation TDFindSearchViewController


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tableView.tableFooterView.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [UINavigationBar appearance].translucent = NO;
    //设置导航栏颜色
    [UINavigationBar appearance].barTintColor = [UIColor whiteColor];
    self.tableView.backgroundColor = [UIColor colorWithRed:.95 green:.95 blue:.95 alpha:1];
    [self.tableView registerClass:[TDBasicCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    TDFootView *view = [[TDFootView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 44)];
    view.backgroundColor =[UIColor colorWithRed:.9 green:.9 blue:.9 alpha:1];
    self.tableView.tableFooterView = view;
    
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar endEditing:YES];
    if (searchBar.text.length > 0) {
        self.searchVM.keywords = searchBar.text;
       
        
        __weak typeof (self)weakSelf = self;
        [self.tableView addHeaderRefresh:^{
            [weakSelf.searchVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
                [weakSelf.tableView endHeaderRefresh];
                [weakSelf.tableView reloadData];
            }];
        }];
        [self.tableView beginHeaderRefresh];
        
        
    }else{
        [self.view showWarning:@"请输入要搜索的内容"];
    }
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        UISearchBar *bar = [[UISearchBar alloc] init];
        bar.delegate = self;
        bar.placeholder = @"店名,地址";
        [bar becomeFirstResponder];
        self.navigationItem.titleView = bar;
        [TDFactory addSearchItemForVC:self clickedHandler:^{
            [bar endEditing:YES];
            if (bar.text.length > 0) {
                self.searchVM.keywords = bar.text;
               
                 __weak typeof (self)weakSelf = self;
                [self.tableView addHeaderRefresh:^{
                    [weakSelf.searchVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
                        [weakSelf.tableView endHeaderRefresh];
                        [weakSelf.tableView reloadData];
                    }];
                }];
                [self.tableView beginHeaderRefresh];
                
            }else{
                [self.view showWarning:@"请输入搜索内容"];
            }
            
        }];
    }
    return self;
}

#pragma mark - Table view data source
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.searchVM.numRow;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TDBasicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:.9 alpha:1];
    [cell.iconIv setImageURL:[self.searchVM HeaderIVForRow:indexPath.row]];
    cell.titleLb.text = [self.searchVM titleLbForRow:indexPath.row];
    cell.descLb.text = [self.searchVM nameLbForRow:indexPath.row];
    if (indexPath.row > 0) {
        [cell.iconIv mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(3);
        }];
        [self.tableView setNeedsDisplay];
    }
    self.tableView.tableFooterView.hidden = NO;
    
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
    
    WebViewController *wvc = [[WebViewController alloc] initWithURL:[self.searchVM dateURLForRow:indexPath.row]];
    [self.navigationController pushViewController:wvc animated:YES];
    
}


//页面将要消失的时候隐藏键盘
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];

}



- (TDFindSearchViewModel *)searchVM {
	if(_searchVM == nil) {
		_searchVM = [[TDFindSearchViewModel alloc] init];
	}
	return _searchVM;
}





@end
