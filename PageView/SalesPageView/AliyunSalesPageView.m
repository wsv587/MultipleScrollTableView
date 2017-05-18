//
//  AliyunSalesPageView.m
//  YunFu
//
//  Created by ws on 2017/4/28.
//  Copyright © 2017年 alibaba. All rights reserved.
//

#import "AliyunSalesPageView.h"

#import "AliyunSalesPageStyle.h"
#import "AliyunSalesPageTitleView.h"
#import "AliyunSalesPageContentView.h"

@interface AliyunSalesPageView ()
@property(nonatomic,strong) AliyunSalesPageStyle *style;
@property(nonatomic,strong) NSArray<NSString *>  *titles;
@property(nonatomic,strong) NSArray<UIViewController *> *childVcs;
@property(nonatomic,strong) UIViewController *parentVc;

@end

@implementation AliyunSalesPageView

- (instancetype)initWithFrame:(CGRect)frame style:(AliyunSalesPageStyle *)style titles:(NSArray<NSString *> *)titles childVcs:(NSArray<UIViewController *> *)childVcs parentVc:(UIViewController *)parentVc {
    
    if (self = [super initWithFrame:frame]) {
        _style = style;
        _titles = titles;
        _childVcs = childVcs;
        _parentVc = parentVc;
    }
    return self;
}

#pragma mark - UI
- (void)setupUI {

    // titleView
    AliyunSalesPageTitleView *titleView = [AliyunSalesPageTitleView titleViewWithframe:CGRectMake(0.f, 0.f, ALYScreenWidth, 44.f) titles:self.titles];
    titleView.backgroundColor = ALY_COLOR(250.f,250.f,250.f);
    [self addSubview:titleView];
    // contentView
    CGRect contentViewFrame = CGRectMake(0.f, titleView.height, self.bounds.size.width, self.bounds.size.height - titleView.height);
    AliyunSalesPageContentView *contentView = [[AliyunSalesPageContentView alloc] initWithFrame:contentViewFrame childVcs:self.childVcs parentVc:self.parentVc];
    contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:contentView];
    // 互为代理 可交互
    contentView.delegate = titleView;
    titleView.delegate = contentView;
}

@end
