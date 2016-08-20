//
//  TDMineViewController.m
//  TinyDay
//
//  Created by 臻 曦 on 16/8/11.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import "TDMineViewController.h"
#import "TDMineHeadView.h"
#import "TDMineFootView.h"

@interface TDMineViewController ()
@property (nonatomic) UIButton *settingBtn;
@property (nonatomic) TDMineHeadView *headView;
@property (nonatomic) TDMineFootView *footView;
@end

@implementation TDMineViewController
- (TDMineHeadView *)headView {
    if(_headView == nil) {
        _headView = [[TDMineHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 50)];
    }
    return _headView;
}
- (TDMineFootView *)footView {
    if(_footView == nil) {
        _footView = [[TDMineFootView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 50)];
        _footView.label.text = @"~ 发现美好生活 ~";
    }
    return _footView;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = kRandomColor;
    return cell;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        return self.headView;
    }
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        return self.footView;
    }
    return nil;
}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    return CGSizeMake(kScreenW, 50);
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = kRGBA(222, 222, 222, 1);
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}





@end
