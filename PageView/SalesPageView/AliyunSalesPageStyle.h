//
//  AliyunSalesPageStyle.h
//  YunFu
//
//  Created by ws on 2017/4/27.
//  Copyright © 2017年 alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AliyunSalesPageStyle : NSObject
+ (instancetype)shareInstance;

@property(nonatomic,strong,readonly) UIColor *normalColor;
@property(nonatomic,strong,readonly) UIColor *selectColor;
@property(nonatomic,assign,readonly) CGFloat titleHeight;
@property(nonatomic,assign,readonly) CGFloat titleMargin;
@property(nonatomic,assign,readonly) BOOL titleScrollEnable;
@property(nonatomic,assign,readonly) BOOL titleTransitionEnable;


@end
