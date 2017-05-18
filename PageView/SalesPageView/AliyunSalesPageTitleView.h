//
//  AliyunSalesPageTitleView.h
//  YunFu
//
//  Created by ws on 2017/4/27.
//  Copyright © 2017年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AliyunSalesPageTitleView;

@protocol AliyunSalesPageTitleViewDelegate <NSObject>

- (void)titleView:(AliyunSalesPageTitleView *)titleView didClickIndex:(NSInteger)index;

@end

@interface AliyunSalesPageTitleView : UIView
+ (instancetype)titleViewWithframe:(CGRect)frame titles:(NSArray<NSString *> *)titles;
@property(nonatomic,weak) id<AliyunSalesPageTitleViewDelegate> delegate;

@end
