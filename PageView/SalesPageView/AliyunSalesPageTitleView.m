//
//  AliyunSalesPageTitleView.m
//  YunFu
//
//  Created by ws on 2017/4/27.
//  Copyright © 2017年 alibaba. All rights reserved.
//

#import "AliyunSalesPageTitleView.h"
#import "AliyunSalesPageStyle.h"
#import "AliyunSalesPageContentView.h"

@interface AliyunSalesPageTitleView ()<AliyunSalesPageContentViewDelegate>
@property(nonatomic,copy) NSArray *titleLabels;
@property(nonatomic,assign) NSInteger currentIndex;
@property(nonatomic,strong) UIScrollView *scrollView;

@end

@implementation AliyunSalesPageTitleView

+ (instancetype)titleViewWithframe:(CGRect)frame titles:(NSArray<NSString *> *)titles {
    
    AliyunSalesPageTitleView *titleView = [[AliyunSalesPageTitleView alloc] initWithFrame:frame];
    
    [titleView addTitleLabelWithTitles:titles];
    return titleView;
}

- (void)addTitleLabelWithTitles:(NSArray<NSString *> *)titles {
    if (!titles.count) {
        return;
    }
    // 添加滚动视图
    [self addSubview:self.scrollView];

    // 添加label
    AliyunSalesPageStyle *style = [AliyunSalesPageStyle shareInstance];
    NSMutableArray *titleLabelsM = [NSMutableArray array];
    for (int i = 0; i < titles.count; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.userInteractionEnabled = YES;
        label.text = [titles objectAtIndex:i];
        label.tag = i;
        label.tag == 0 ? label.textColor = style.selectColor : style.normalColor;
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickTitleLabel:)];
        [label addGestureRecognizer:tapGes];
        [self.scrollView addSubview:label];
        [titleLabelsM addObject:label];
    }
    self.titleLabels = [titleLabelsM copy];
    // 设置label frame
    CGFloat titleH = style.titleHeight;
    CGFloat titleY = 0.f;
    CGFloat titleW = 0.f;
    CGFloat titleX = 0.f;
    
    for (int i = 0; i < self.titleLabels.count; i++) {
        UILabel *label = [self.titleLabels objectAtIndex:i];
        if (style.titleScrollEnable) {
            // 可以滚动
            NSString *title = [titles objectAtIndex:i];
            titleW = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, 0.f) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : label.font} context:nil].size.width;
            UILabel *lastLabel = (UILabel *)self.titleLabels[i - 1];
            titleX = label.tag == 0 ? style.titleMargin * 0.5f : CGRectGetMaxX(lastLabel.frame) + style.titleMargin;
            
        } else {
            // 不可以滚动
            titleW = self.frame.size.width / self.titleLabels.count;
            titleX = titleW * i;
        }
        label.frame = CGRectMake(titleX, titleY, titleW, titleH);
    }
    
    // 如果titleView可以滚动还需要设置滚动范围
    if (style.titleScrollEnable) {
        UILabel *lastLabel = self.titleLabels.lastObject;
        self.scrollView.contentSize = CGSizeMake(CGRectGetMaxX(lastLabel.frame) + style.titleMargin * 0.5f, 0.f);
    }
}

- (void)didClickTitleLabel:(UITapGestureRecognizer *)tapGes {
    id view = tapGes.view;
    if (!view || ![view isKindOfClass:[UILabel class]]) {
        return;
    }
    UILabel *currentLabel = (UILabel *)view;
    // 点击了同一个标签
    if (currentLabel.tag == self.currentIndex) {
        return;
    }
    // 修改上一个标签
    AliyunSalesPageStyle *style = [AliyunSalesPageStyle shareInstance];
    UILabel *lastLabel = [self.titleLabels objectAtIndex:self.currentIndex];
    lastLabel.textColor = style.normalColor;
    // 修改当前标签
    currentLabel.textColor = style.selectColor;
    // 更新currentindex
    self.currentIndex = currentLabel.tag;
    
    // 调整当前标签
    if (style.titleScrollEnable) {
        [self adjustPositionFor:currentLabel];
    }
    ALYLog(@"点击了第%ld个titlelabel",currentLabel.tag);
}

- (void)adjustPositionFor:(UILabel *)label {
    CGFloat offsetX = label.center.x - self.bounds.size.width * 0.5f;
    // 2.临界值的判断
    if (offsetX < 0.f) {
        offsetX = 0.f;
    }
    if (offsetX > self.scrollView.contentSize.width - self.scrollView.bounds.size.width) {
        offsetX = self.scrollView.contentSize.width - self.scrollView.bounds.size.width;
    }
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0.f) animated:YES];
}

#pragma mark - AliyunSalesPageContentViewDelegate
- (void)contentView:(AliyunSalesPageContentView *)contentView didScrollToIndex:(NSInteger)index {
    AliyunSalesPageStyle *style = [AliyunSalesPageStyle shareInstance];
    // 如果titleView支持滚动
    if (style.titleScrollEnable) {
        [self adjustPositionFor:self.titleLabels[index]];
    }
    
    // 如果titleView支持渐变
    if (style.titleTransitionEnable) {
        
    } else {
    // 如果titleView不支持渐变
        UILabel *lastLabel = [self.titleLabels objectAtIndex:self.currentIndex];
        UILabel *currentLabel = [self.titleLabels objectAtIndex:index];
        lastLabel.textColor = style.normalColor;
        currentLabel.textColor = style.selectColor;
    }
    self.currentIndex = index;
}

#pragma mark - lazy
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.scrollsToTop = NO;
        _scrollView.backgroundColor = [UIColor cyanColor];
    }
    return _scrollView;
}

@end
