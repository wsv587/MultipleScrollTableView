//
//  AliyunSalesPageStyle.m
//  YunFu
//
//  Created by ws on 2017/4/27.
//  Copyright © 2017年 alibaba. All rights reserved.
//

#import "AliyunSalesPageStyle.h"
#import "Header.h"

@interface AliyunSalesPageStyle ()
//@property(nonatomic,strong) UIColor *normalColor;
//@property(nonatomic,strong) UIColor *selectColor;
//@property(nonatomic,assign) CGFloat titleHeight;
//@property(nonatomic,assign) CGFloat titleMargin;
//@property(nonatomic,assign) BOOL titleScrollEnable;
//@property(nonatomic,assign) BOOL titleTransitionEnable;
//@property(nonatomic,assign) BOOL isCollectionView;
//@property(nonatomic,assign) BOOL pageViewScrollEnable;
//@property(nonatomic,assign) BOOL isTitleViewAsSectionHeaderView;
//@property(nonatomic,assign) CGFloat tableHeaderViewHeight;
//@property(nonatomic,assign) BOOL hasIndicator;
//
//
//@property(nonatomic,assign) UIColor *indicatorColor;
//@property(nonatomic,assign) CGFloat indicatorHeight;
@end

@implementation AliyunSalesPageStyle

static  AliyunSalesPageStyle *_instance = nil;
+ (instancetype)defaultStyle {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[AliyunSalesPageStyle alloc] init];
    });
     return _instance;
}

//+ (instancetype)allocWithZone:(struct _NSZone *)zone {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _instance = [super allocWithZone:zone];
//    });
//    return _instance;
//}

- (instancetype)init {
    if (self = [super init]) {
        _normalColor = ALY_COLOR(87.f, 99.f, 105.f);
        _selectColor = ALY_COLOR(54.f, 119.f, 255.f);
        _titleHeight = 44.f;
        _titleMargin = 30.f;
        _titleScrollEnable = YES;
        _titleTransitionEnable = NO;
        _isCollectionView = YES;
        _pageViewScrollEnable = YES;
        _isTitleViewAsSectionHeaderView = YES;
        _tableHeaderViewHeight = 64.f;
        _hasIndicator = YES;
        _indicatorColor = _selectColor;
        _indicatorHeight = 3.f;
    }
    return self;
}
@end
