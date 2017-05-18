//
//  AliyunSalesPageStyle.m
//  YunFu
//
//  Created by ws on 2017/4/27.
//  Copyright © 2017年 alibaba. All rights reserved.
//

#import "AliyunSalesPageStyle.h"

@interface AliyunSalesPageStyle ()
@property(nonatomic,strong) UIColor *normalColor;
@property(nonatomic,strong) UIColor *selectColor;
@property(nonatomic,assign) CGFloat titleHeight;
@property(nonatomic,assign) CGFloat titleMargin;
@property(nonatomic,assign) BOOL titleScrollEnable;
@property(nonatomic,assign) BOOL titleTransitionEnable;

@end

@implementation AliyunSalesPageStyle

static  AliyunSalesPageStyle *_instance = nil;
+ (instancetype)shareInstance {
     return [[AliyunSalesPageStyle alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

- (instancetype)init {
    if (self = [super init]) {
        _normalColor = ALY_COLOR(87.f, 99.f, 105.f);
        _selectColor = ALY_COLOR(54.f, 119.f, 255.f);
        _titleHeight = 44.f;
        _titleMargin = 30.f;
        _titleScrollEnable = NO;
        _titleTransitionEnable = NO;
    }
    return self;
}
@end
