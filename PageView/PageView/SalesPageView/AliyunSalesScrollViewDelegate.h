//
//  AliyunSalesScrollViewDelegate.h
//  PageView
//
//  Created by sw on 17/5/2.
//  Copyright © 2017年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AliyunSalesScrollViewDelegate <NSObject>
- (void)scrollView:(UIScrollView *)scrollView didScrollWithOffset:(CGFloat)offsetY;
@end
