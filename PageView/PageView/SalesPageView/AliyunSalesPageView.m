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
#import "AliyunSalesPageTableView.h"

#import "AliyunSalesScrollViewDelegate.h"
#import "Header.h"

@interface AliyunSalesPageView ()<UITableViewDataSource,UITableViewDelegate,AliyunSalesScrollViewDelegate>
{
    CGFloat offsetY;
    CGFloat childOffset;
}

@property(nonatomic,strong) AliyunSalesPageStyle *style;
@property(nonatomic,strong) NSArray<NSString *>  *titles;
@property(nonatomic,strong) NSArray<UIViewController *> *childVcs;
@property(nonatomic,strong) UIViewController *parentVc;

@property(nonatomic,strong) AliyunSalesPageTitleView *titleView;
@property(nonatomic,strong) AliyunSalesPageContentView *contentView;

@property(nonatomic,strong) AliyunSalesPageTableView *pageTableView;

@property(nonatomic,assign) MyTitleViewType titleViewType;

@end

@implementation AliyunSalesPageView

- (instancetype)initWithFrame:(CGRect)frame titleViewType:(MyTitleViewType)titleViewType style:(AliyunSalesPageStyle *)style titles:(NSArray<NSString *> *)titles childVcs:(NSArray<UIViewController *> *)childVcs parentVc:(UIViewController *)parentVc {
    
    if (self = [super initWithFrame:frame]) {
        _style = style;
        _titles = titles;
        _childVcs = childVcs;
        _parentVc = parentVc;
        _titleViewType = titleViewType;
        [self setupUI];
    }
    return self;
}

#pragma mark - AliyunSalesScrollViewDelegate
- (void)scrollView:(UIScrollView *)scrollView didScrollWithOffset:(CGFloat)childOffsetY {
    AliyunSalesPageStyle *style = [AliyunSalesPageStyle defaultStyle];
    CGFloat topOffsetY = style.tableHeaderViewHeight - 64.f;
    
    if (offsetY < topOffsetY) {
        scrollView.contentOffset = CGPointMake(0.f, 0.f);
    } else {
        childOffset = childOffsetY;
    }
    
    [self.pageTableView.ignoreGes addObject:self.contentView.collectionView.panGestureRecognizer];
}

#pragma mark - UI

- (void)setupUI {
    // style
    AliyunSalesPageStyle *style = [AliyunSalesPageStyle defaultStyle];

    // titleView
    AliyunSalesPageTitleView *titleView = [AliyunSalesPageTitleView titleViewWithframe:CGRectMake(0.f, 0.f, ALYScreenWidth, style.titleHeight) type:self.titleViewType titles:self.titles];
    titleView.backgroundColor = ALY_COLOR(250.f,250.f,250.f);
    self.titleView = titleView;

    // contentView
    CGFloat contentViewY = 0.f;
    if (style.pageViewScrollEnable) {
        contentViewY = 0.f;
    } else {
        contentViewY = titleView.frame.size.height;
    }
    CGRect contentViewFrame = CGRectMake(0.f, contentViewY, self.bounds.size.width, self.bounds.size.height - titleView.frame.size.height);
    AliyunSalesPageContentView *contentView = [[AliyunSalesPageContentView alloc] initWithFrame:contentViewFrame childVcs:self.childVcs parentVc:self.parentVc];
    contentView.backgroundColor = [UIColor whiteColor];
    self.contentView = contentView;
    
    // 垂直方向是否可以滚动
    // 如果pageView在垂直方向要支持滚动，那么需要给pageView添加一个UITableView。
    // 如果pageView不需要支持垂直方向滚动，那么直接把titleView、contentView添加到pageView上
    if (style.pageViewScrollEnable) {
        [self addSubview:self.pageTableView];
    } else {
        [self addSubview:titleView];
        [self addSubview:contentView];
    }
    // 互为代理 可交互
    contentView.delegate = titleView;
    titleView.delegate = contentView;
}

#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"contentCellId"];
    [cell.contentView addSubview:self.contentView];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.titleView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    AliyunSalesPageStyle *style = [AliyunSalesPageStyle defaultStyle];
    
    return style.titleHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    AliyunSalesPageStyle *style = [AliyunSalesPageStyle defaultStyle];
    return tableView.frame.size.height - style.tableHeaderViewHeight - style.titleHeight;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    offsetY = scrollView.contentOffset.y;

    AliyunSalesPageStyle *style = [AliyunSalesPageStyle defaultStyle];
    // offsetY初始值（最小值）是-64
    // offsetY最大值是tableHeaderViewHeight - 64
    // 如果tableHeaderViewHeight == 64 那么 style.tableHeaderViewHeight - 64.f == 0
    
    CGFloat bottomOffsetY = -64.f;
    CGFloat topOffsetY = style.tableHeaderViewHeight - 64.f;
    if (childOffset == 0.f) {
        if (offsetY <= bottomOffsetY) {
            // 向下滚动临界 titleView刚好滚动到最开始的状态（即tableHeaderView全部露出）
            scrollView.contentOffset = CGPointMake(0.f, bottomOffsetY);
        } else if (offsetY >= topOffsetY) {
            // 向上滚动临界 titleView刚好滚动到导航栏下面（即titleView刚好悬停）
            scrollView.contentOffset = CGPointMake(0.f, topOffsetY);
        }
    } else {
        scrollView.contentOffset = CGPointMake(0.f, topOffsetY);
    }
 
    [self changeNavTitleWithOffset:scrollView.contentOffset.y];
    NSLog(@"parent ：%f",scrollView.contentOffset.y);
}

- (void)changeNavTitleWithOffset:(CGFloat)offset {
    AliyunSalesPageStyle *style = [AliyunSalesPageStyle defaultStyle];
    CGFloat height = style.tableHeaderViewHeight;
    if (offset < 0) {
        offset = -offset;
    }
    
    UINavigationController *rootNav = [UIApplication sharedApplication].keyWindow.rootViewController;
    rootNav.navigationItem;
    if (height / 2 > offset) {
        // 显示客户ID
        rootNav.navigationItem.title = @"ws";

        //                             (32 - 30) / 32

        rootNav.navigationBar.alpha = (height / 2 - (offset / 2)) / (height / 2);
    } else {
        // 隐藏title
//        rootNav.navigationBar.alpha = (height / 2 )
    }
}

#pragma mark - lazy
- (AliyunSalesPageTableView *)pageTableView {
    if (!_pageTableView) {
        _pageTableView = [[AliyunSalesPageTableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _pageTableView.dataSource = self;
        _pageTableView.delegate = self;
    }
    return _pageTableView;
}
@end
