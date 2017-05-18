//
//  AliyunSalesPageView.h
//  YunFu
//
//  Created by ws on 2017/4/28.
//  Copyright © 2017年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AliyunSalesPageTitleView.h"

@class AliyunSalesPageStyle;

@interface AliyunSalesPageView : UIView
- (instancetype)initWithFrame:(CGRect)frame titleViewType:(MyTitleViewType)titleViewType style:(AliyunSalesPageStyle *)style titles:(NSArray<NSString *> *)titles childVcs:(NSArray<UIViewController *> *)childVcs parentVc:(UIViewController *)parentVc;
@end
