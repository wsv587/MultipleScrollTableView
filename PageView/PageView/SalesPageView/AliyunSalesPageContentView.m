//
//  AliyunSalesPageContentView.m
//  YunFu
//
//  Created by ws on 2017/4/28.
//  Copyright © 2017年 alibaba. All rights reserved.
//

#import "AliyunSalesPageContentView.h"
#import "AliyunSalesPageTitleView.h"
#import "AliyunSalesPageStyle.h"

@interface AliyunSalesPageContentView ()<UIScrollViewDelegate,AliyunSalesPageTitleViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong) NSArray *childVcs;
@property(nonatomic,strong) UIViewController *parentVc;
@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) UICollectionView *collectionView;

@end

@implementation AliyunSalesPageContentView

- (instancetype)initWithFrame:(CGRect)frame childVcs:(NSArray<UIViewController *> *)childVcs parentVc:(UIViewController *)parentVc {
    if (self = [super initWithFrame:frame]) {
        _childVcs = childVcs;
        _parentVc = parentVc;
        
        AliyunSalesPageStyle *style = [AliyunSalesPageStyle defaultStyle];
        if (style.isCollectionView) {
            [self addSubview:self.collectionView];
        } else {
            [self addSubview:self.scrollView];
        }
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
    if (self.collectionView.superview) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    } else {
        CGFloat offsetX = self.frame.size.width * index;
        CGPoint offset = CGPointMake(offsetX, 0);
        self.scrollView.contentOffset = offset;
        [self.scrollView setContentOffset:offset animated:NO];
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.childVcs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellId = @"cellId";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    for (UIView *subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    
//    if (!cell.contentView.subviews.count) {
        UIView *contentView = [[self.childVcs objectAtIndex:indexPath.row] view];
        contentView.frame = cell.contentView.bounds;
        [cell.contentView addSubview:contentView];
//    }
    return cell;
}

#pragma mark - private
- (void)scrollViewDidEndScroll:(UIScrollView *)scrollView {
    NSInteger index = (NSInteger)(scrollView.contentOffset.x / scrollView.bounds.size.width);
    if (self.delegate && [self.delegate respondsToSelector:@selector(contentView:didScrollToIndex:)]) {
        [self.delegate contentView:self didScrollToIndex:index];
    }
}



#pragma mark - lazy
//- (UIScrollView *)scrollView {
//    if (!_scrollView) {
//        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
//        _scrollView.backgroundColor = [UIColor whiteColor];
//        _scrollView.contentSize = CGSizeMake(self.bounds.size.width * self.childVcs.count, 0);
//        _scrollView.showsHorizontalScrollIndicator = NO;
//        _scrollView.delegate = self;
//        _scrollView.pagingEnabled = YES;
//    }
//    return _scrollView;
//}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsZero;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0.f;
        layout.minimumInteritemSpacing = 0.f;
        layout.itemSize = self.bounds.size;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.scrollsToTop = NO;
        _collectionView.bounces = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
        
    }
    return _collectionView;
}
@end
