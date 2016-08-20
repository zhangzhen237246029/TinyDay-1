//
//  TDFindViewController.m
//  TinyDay
//
//  Created by 臻 曦 on 16/8/11.
//  Copyright © 2016年 Icemelt. All rights reserved.
//


#import "TDFindViewController.h"
#import "TDFindClassCell.h"
#import "TDFindViewModel.h"
#import "TDFindBusinessCell.h"
#import "TDFootView.h"
#import "TDFindClassViewController.h"
#import "TDFindClassMoreViewController.h"
#import "TDFindSearchViewController.h"

@interface TDFindViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic) UITableView *tableview;
@property (nonatomic) UICollectionView *COLV;
@property (nonatomic) UICollectionViewFlowLayout *layout;
@property (nonatomic) TDFindViewModel *FoundShopVM;
@property (nonatomic) TDFootView *tableFooterview;
@property (nonatomic) UIView *searchView;
//@property (nonatomic) UISearchController *searchC;
//@property (nonatomic) UISearchBar *seachBar;


@property (nonatomic) NSArray<TDFindHeaderNextListModel *> *list;
//表头
@property (nonatomic) UIView *headerView;

@end

@implementation TDFindViewController

#pragma mark - 生命周期


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //tableView 创建
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 45, kScreenW, kScreenH) style:UITableViewStyleGrouped];
    
    [self.view addSubview:self.tableview];
    [_tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(45);
    }];
    
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    //collectionview 创建
    self.COLV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 170) collectionViewLayout:self.layout];
    self.COLV.backgroundColor = [UIColor whiteColor];
    self.COLV.delegate = self;
    self.COLV.dataSource = self;
    //创建表头视图
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 178)];
    self.headerView.backgroundColor = [UIColor colorWithRed:.95 green:.95 blue:.95 alpha:1];
    //表头
    self.tableview.tableHeaderView = self.headerView;
    //表尾
    self.tableview.tableFooterView = self.tableFooterview;
    //表头里面加 COLV
    [self.headerView addSubview:self.COLV];
    //ViewModel层的网络请求
    [self.FoundShopVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
        [self.tableview reloadData];
        
        [self.COLV reloadData];
    }];
    
    //取消分割线
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //注册自定义的cell
    [self.COLV registerClass:[TDFindClassCell class] forCellWithReuseIdentifier:@"collectionCell"];
    [self.tableview registerClass:[TDFindBusinessCell class] forCellReuseIdentifier:@"LNBusinessCell"];
    
    //添加导航栏右边深圳 button
    [TDFactory addRightBarButtonForVC:self];
    [TDFactory addShowCityForVc:self clickedHandler:nil];
    [self searchView];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UINavigationBar appearance].translucent = NO;
    self.searchView =nil;
    [self searchView];
}

////头部搜索视图
- (UIView *)searchView {
    if(_searchView == nil) {
        _searchView = [[UIView alloc]init];
        
        [self.view addSubview:_searchView];
        [_searchView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(self.tableview.mas_top).equalTo(0);
            make.width.equalTo(kScreenW);
            make.height.equalTo(45);
            make.centerX.equalTo(0);
            
        }];
        _searchView.backgroundColor = [UIColor whiteColor];
        UIButton *searchBtn = [UIButton  buttonWithType:UIButtonTypeCustom];
        [searchBtn setBackgroundImage:[UIImage imageNamed:@"searchdi"] forState:UIControlStateNormal];
        [searchBtn setBackgroundImage:[UIImage imageNamed:@"searchdi"] forState:UIControlStateHighlighted];
        [searchBtn setImage:[UIImage imageNamed:@"zdsearch"] forState:UIControlStateNormal];
        [searchBtn setTitle:@"店名，地址" forState:UIControlStateNormal];
        [searchBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        searchBtn.titleLabel.font =[UIFont systemFontOfSize:12];
        searchBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_searchView.frame.size.width), 0, 0);
        searchBtn.titleEdgeInsets =UIEdgeInsetsMake(0, -(_searchView.frame.size.width), 0, 0);
        [_searchView addSubview:searchBtn];
        
        [searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            //        make.center.equalTo(0);
            make.left.top.equalTo(5);
            make.right.bottom.equalTo(-5);
        }];
        [searchBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchView;
}



-(void)clickAction:sender{
    TDFindSearchViewController *vc = [TDFindSearchViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Table view data source

//tableview分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.FoundShopVM.sectionNum;
}
//tableview分区行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.FoundShopVM RowForSection:section];
}

//tableview cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TDFindBusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LNBusinessCell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        [cell.headerIV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
        }];
    }else{
        [cell.headerIV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-3);
        }];
    }
    [self.tableview setNeedsDisplay];
    
    [cell.headerIV setImageURL:[self.FoundShopVM headerIVForSection:indexPath.section Row:indexPath.row]];
    cell.titleLb.text = [self.FoundShopVM titleLbForSection:indexPath.section Row:indexPath.row];
    cell.nameLb.text = [self.FoundShopVM nameLbForSection:indexPath.section Row:indexPath.row];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds];
    cell.selectedBackgroundView.backgroundColor = kClearColor;
    
    return cell;
    
}

//tableview 分区头的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
    
}

//每行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    CGFloat heightFrist = kScreenW * 468 / 750;
    CGFloat height = kScreenW * 400 / 640;
    
    if (self.FoundShopVM.CbdsArr != nil) {
        return indexPath.section == 0 ? 180 : height;
    }else{
        return height;
    }
    
}


//tableview 分区尾的高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
    
}

//分区头添加视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *sectionView = [UIView new];
    sectionView.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [UILabel new];
    [sectionView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(28);
        make.left.mas_equalTo(10);
    }];
    UIView *line = [UIView new];
    [sectionView addSubview:line];
    line.backgroundColor = [UIColor blackColor];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label.mas_bottom).mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(15, 2));
    }];
    
    if (self.FoundShopVM.CbdsArr != nil) {
        if (section == 0) {
            label.text = @"商圈";
        }else{
            label.text = @"专题";
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            [sectionView addSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(label);
                make.right.mas_equalTo(-10);
                make.width.mas_equalTo(60);
            }];
            [button setTitle:@"全部 ＞" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:12];
        }
        
    }else{
        label.text = @"专题";
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [sectionView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.right.mas_equalTo(-10);
            make.width.mas_equalTo(60);
        }];
        [button setTitle:@"全部 ＞" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        
        
    }
    return sectionView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.FoundShopVM.CbdsArr != nil) {
        if (indexPath.section == 0) {
            TDFindClassViewController *vc = [[TDFindClassViewController alloc] initWithNum:100];
            vc.name = @"南山区";
            vc.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else{
        
    }
    
    
    
}


#pragma mark - Collectionview data source
//collectionview 有几个 cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.FoundShopVM.rowCollectionNum;
}
//collectionview cell 的样子
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TDFindClassCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    if (indexPath.row == 7) {
        [cell.imageview setImage:[UIImage imageNamed:@"shopmore"]];
        cell.label.text = @"更多";
        
    }else{
        [cell.imageview setImageURL:[self.FoundShopVM imageViewForRow:indexPath.row]];
        cell.label.text = [self.FoundShopVM labelForRow:indexPath.row];
    }
    return cell;
}

//点击 collectionview 调转到下一页面
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row != 7) {
        TDFindClassViewController *vc = [[TDFindClassViewController alloc] initWithNum:indexPath.row];
        vc.name = [self.FoundShopVM labelForRow:indexPath.row];
        vc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        
        TDFindClassMoreViewController *vc = [[TDFindClassMoreViewController alloc] initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
        vc.num = indexPath.row;
        
        vc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}

#pragma mark - VM 懒加载
- (TDFindViewModel *)FoundShopVM {
    if(_FoundShopVM == nil) {
        _FoundShopVM = [[TDFindViewModel alloc] init];
    }
    return _FoundShopVM;
}

#pragma mark - 布局 collectionview
- (UICollectionViewFlowLayout *)layout {
    if(_layout == nil) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.minimumLineSpacing = 10;
        _layout.minimumInteritemSpacing = 0;
        _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        _layout.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0);
        CGFloat width = kScreenW / 4;
        CGFloat height = 70;
        _layout.itemSize = CGSizeMake(width, height);
    }
    return _layout;
}

- (TDFootView *)tableFooterview {
    if(_tableFooterview == nil) {
        _tableFooterview = [[TDFootView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 44)];
        _tableFooterview.label.text = @"+++++++++";
    }
    return _tableFooterview;
}

@end
