//
//  AliyunSalesPageContentView.h
//  YunFu
//
//  Created by ws on 2017/4/28.
//  Copyright © 2017年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AliyunSalesPageContentView;

@protocol AliyunSalesPageContentViewDelegate <NSObject>

- (void)contentView:(AliyunSalesPageContentView *)contentView didScrollToIndex:(NSInteger)index;

@end

@interface AliyunSalesPageContentView : UIView
- (instancetype)initWithFrame:(CGRect)frame childVcs:(NSArray<UIViewController *> *)childVcs parentVc:(UIViewController *)parentVc;
@property(nonatomic,weak) id<AliyunSalesPageContentViewDelegate> delegate;
@end
