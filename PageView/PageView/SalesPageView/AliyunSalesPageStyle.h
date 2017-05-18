//
//  AliyunSalesPageStyle.h
//  YunFu
//
//  Created by ws on 2017/4/27.
//  Copyright © 2017年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AliyunSalesPageStyle : NSObject
+ (instancetype)defaultStyle;

@property(nonatomic,strong) UIColor *normalColor;
@property(nonatomic,strong) UIColor *selectColor;
@property(nonatomic,assign) CGFloat titleHeight;
@property(nonatomic,assign) CGFloat titleMargin;
/**
 * 头部标题是否滚动居中
 */
@property(nonatomic,assign) BOOL titleScrollEnable;
/**
 * 头部标题是否支持过渡动画 包括titleLabel的颜色渐变、指示器长度渐变、遮罩阴影渐变
 */
@property(nonatomic,assign) BOOL titleTransitionEnable;
/** 
 * 容器视图是UICollectionView还是UIScrollView
 */
@property(nonatomic,assign) BOOL isCollectionView;
/**
 * pageView垂直方向是否可以滚动
 */
@property(nonatomic,assign) BOOL pageViewScrollEnable;
/**
 * titleView是否作为pageTableView的组头视图
 * 如果pageViewScrollEnable是YES，那么有可能需要设置这个属性为YES
 */
@property(nonatomic,assign) BOOL isTitleViewAsSectionHeaderView;

/**
 * tableHeaderView的高度
 */
@property(nonatomic,assign) CGFloat tableHeaderViewHeight;

/**
 * titleView 是否有指示器
 */
@property(nonatomic,assign) BOOL hasIndicator;
@property(nonatomic,assign) UIColor *indicatorColor;
@property(nonatomic,assign) CGFloat indicatorHeight;


@end
