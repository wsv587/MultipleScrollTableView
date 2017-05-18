//
//  AliyunSalesPageTitleView.h
//  YunFu
//
//  Created by ws on 2017/4/27.
//  Copyright © 2017年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AliyunSalesPageTitleView;

typedef NS_ENUM(NSUInteger, MyTitleViewType) {
    MyTitleViewTypeScrollBar,
    MyTitleViewTypeListView,
    MyTitleViewTypeSegmentControl,
};

@protocol AliyunSalesPageTitleViewDelegate <NSObject>

- (void)titleView:(AliyunSalesPageTitleView *)titleView didClickIndex:(NSInteger)index;

@end

@interface AliyunSalesPageTitleView : UIView
+ (instancetype)titleViewWithframe:(CGRect)frames type:(MyTitleViewType)type titles:(NSArray<NSString *> *)titles;
@property(nonatomic,weak) id<AliyunSalesPageTitleViewDelegate> delegate;

@end
