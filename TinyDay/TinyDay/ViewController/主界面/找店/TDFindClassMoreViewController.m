//
//  LNMoreCollectionViewController.m
//  TinyDay
//
//  Created by tarena46 on 16/8/16.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDFindClassMoreViewController.h"
#import "TDFindClassMoreViewModel.h"
#import "TDFindClassMoreCell.h"

@interface TDFindClassMoreViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic) TDFindClassMoreViewModel *LnHeaderNextVM;
@end

@implementation TDFindClassMoreViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [TDFactory addPopBackItemForVC:self];
    
    self.title = @"分类";
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    
    
    [self.collectionView registerClass:[TDFindClassMoreCell class] forCellWithReuseIdentifier:@"cell"];
    
    __weak typeof (self)weakSelf = self;
    [self.collectionView addHeaderRefresh:^{
        [weakSelf.LnHeaderNextVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [weakSelf.collectionView endHeaderRefresh];
            [weakSelf.collectionView reloadData];
        }];
    }];
    [self.collectionView beginHeaderRefresh];
    
    
    
}





#pragma mark <UICollectionViewDataSource>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat width = (long)((kScreenW - 2)/2);
    CGFloat heigth = width * 400 / 640;
    return CGSizeMake(width, heigth);
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 0, 2, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.LnHeaderNextVM.numCollectionCell;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TDFindClassMoreCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.headerIV setImageURL: [self.LnHeaderNextVM collectionHanderIVForRow:indexPath.row]];
    cell.titleLb.text = [self.LnHeaderNextVM collectionTitleForRow:indexPath.row];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>



- (TDFindClassMoreViewModel *)LnHeaderNextVM {
    if(_LnHeaderNextVM == nil) {
        _LnHeaderNextVM = [[TDFindClassMoreViewModel alloc] initWithNum:self.num];
    }
    return _LnHeaderNextVM;
}

@end
