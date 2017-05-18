//
//  AliyunSalesPageViewController.h
//  PageView
//
//  Created by sw on 17/5/4.
//  Copyright © 2017年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AliyunSalesPageStyle;

typedef NS_ENUM(NSUInteger, TitleViewType) {
    TitleViewTypeSegmentControl,
    TitleViewTypeMenuView,
    TitleViewTypeCommonTitle,
};

@interface AliyunSalesPageViewController : UIViewController
//@property(nonatomic,assign) TitleViewType type;

//- (instancetype)initWithFrame:(CGRect)frame style:(AliyunSalesPageStyle *)style titles:(NSArray<NSString *> *)titles childVcs:(NSArray<UIViewController *> *)childVcs parentVc:(UIViewController *)parentVc;

@end
