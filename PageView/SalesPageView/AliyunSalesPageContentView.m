//
//  AliyunSalesPageContentView.m
//  YunFu
//
//  Created by ws on 2017/4/28.
//  Copyright © 2017年 alibaba. All rights reserved.
//

#import "AliyunSalesPageContentView.h"
#import "AliyunSalesPageTitleView.h"


@interface AliyunSalesPageContentView ()<UIScrollViewDelegate,AliyunSalesPageTitleViewDelegate>

@property(nonatomic,strong) NSArray *childVcs;
@property(nonatomic,strong) UIViewController *parentVc;
@property(nonatomic,strong) UIScrollView *scrollView;

@end

@implementation AliyunSalesPageContentView

- (instancetype)initWithFrame:(CGRect)frame childVcs:(NSArray<UIViewController *> *)childVcs parentVc:(UIViewController *)parentVc {
    if (self = [super initWithFrame:frame]) {
        _childVcs = childVcs;
        _parentVc = parentVc;
        [self addSubview:self.scrollView];
    }
    return self;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (decelerate) {
        return;
    }
    // 直接拖拽到指定页，没有减速滑动
    [self scrollViewDidEndScroll:scrollView];
}

// 减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScroll:scrollView];
}

#pragma mark - AliyunSalesPageTitleViewDelegate
- (void)titleView:(AliyunSalesPageTitleView *)titleView didClickIndex:(NSInteger)index {
    CGFloat offsetX = self.width * index;
    CGPoint offset = CGPointMake(offsetX, 0);
    self.scrollView.contentOffset = offset;
    [self.scrollView setContentOffset:offset animated:NO];
}

#pragma mark - private
- (void)scrollViewDidEndScroll:(UIScrollView *)scrollView {
    NSInteger index = (NSInteger)(scrollView.contentOffset.x / scrollView.bounds.size.width);
    if (self.delegate && [self.delegate respondsToSelector:@selector(contentView:didScrollToIndex:)]) {
        [self.delegate contentView:self didScrollToIndex:index];
    }
}

#pragma mark - lazy
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.backgroundColor = [UIColor salesBackViewColor];
        _scrollView.contentSize = CGSizeMake(self.bounds.size.width * self.childVcs.count, 0);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}
@end
