//
//  TDMineHeadView.h
//  TinyDay
//

//  Created by tarena31 on 16/8/18.
//  Copyright © 2016年 Icemelt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TDMineHeadView;
@protocol TDMineHeadViewDelegate <NSObject>
-(void)headBtnClickedInHeaderView:(TDMineHeadView *)headView;
-(void)bgBtnClickedInHeaderView:(TDMineHeadView *)headView;
-(void)editBtnClickedInHeaderView:(TDMineHeadView *)headView;
@end

@interface TDMineHeadView : UICollectionReusableView
@property (nonatomic, weak) id<TDMineHeadViewDelegate> delegate;
@property (nonatomic) UIButton *bgBtn;
@property (nonatomic) UIButton *headBtn;
@property (nonatomic) UILabel *nameLb;
@property (nonatomic) UIButton *editBtn;
@property (nonatomic) BOOL *isLogin;
@end
