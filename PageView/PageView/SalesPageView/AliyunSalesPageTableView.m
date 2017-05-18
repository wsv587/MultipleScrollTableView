//
//  AliyunSalesPageTableView.m
//  PageView
//
//  Created by sw on 17/5/2.
//  Copyright © 2017年 ws. All rights reserved.
//

#import "AliyunSalesPageTableView.h"
#import "AliyunSalesPageStyle.h"

@interface AliyunSalesPageTableView ()<UIGestureRecognizerDelegate>

@end

@implementation AliyunSalesPageTableView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    for (UIGestureRecognizer *ges in self.ignoreGes) {
        if (otherGestureRecognizer == ges) {
            return NO;
        }
    }
    return YES;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        // 设置tableHeaderView
        
        AliyunSalesPageHeaderView *pageHeaderView = [[AliyunSalesPageHeaderView alloc] initWithFrame:CGRectMake(0.f, 0.f, frame.size.width, 64.f)];
//        AliyunSalesPageHeaderView *pageHeaderView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([AliyunSalesPageHeaderView class]) owner:nil options:nil].firstObject;
        self.tableHeaderView = pageHeaderView;
        
        AliyunSalesPageStyle *pageStyle = [AliyunSalesPageStyle defaultStyle];
        pageHeaderView.frame = CGRectMake(0.f, 0.f, self.frame.size.width, pageStyle.tableHeaderViewHeight);
    }
    return self;
}


@end
