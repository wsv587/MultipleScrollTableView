//
//  AliyunSalesPageViewController.m
//  PageView
//
//  Created by sw on 17/5/4.
//  Copyright © 2017年 ws. All rights reserved.
//

#import "AliyunSalesPageViewController.h"
#import "AliyunSalesPageView.h"

@interface AliyunSalesPageViewController ()

@end

@implementation AliyunSalesPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (instancetype)initWithType:(TitleViewType)type {
    if (self = [super init]) {
        if (type == TitleViewTypeMenuView) {
            
        } else if (type == TitleViewTypeCommonTitle) {
            
        } else if (type == TitleViewTypeSegmentControl) {
            
        }
    }
    return self;
}

//- (instancetype)initWithFrame:(CGRect)frame style:(AliyunSalesPageStyle *)style titles:(NSArray<NSString *> *)titles childVcs:(NSArray<UIViewController *> *)childVcs parentVc:(UIViewController *)parentVc {
//    
//    if (self = [super init]) {
//        AliyunSalesPageView *pageView = [[AliyunSalesPageView alloc] initWithFrame:frame style:style titles:titles childVcs:childVcs parentVc:parentVc];
//
//    }
//    
//    return self;
//}

@end
