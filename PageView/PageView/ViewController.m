//
//  ViewController.m
//  PageView
//
//  Created by ws on 2017/4/28.
//  Copyright © 2017年 ws. All rights reserved.
//

#import "ViewController.h"
#import "AliyunSalesPageStyle.h"
#import "AliyunSalesPageView.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *titles = @[@"热播12345678",@"最新2345678",@"关注123456789",@"我的123456789",@"精彩回顾"];

    AliyunSalesPageStyle *style = [AliyunSalesPageStyle defaultStyle];
//    NSMutableArray *childVcs = [NSMutableArray arrayWithCapacity:titles.count];
    
    FirstViewController *firstVc = [[FirstViewController alloc] initWithStyle:UITableViewStylePlain];
    SecondViewController *secondVc = [[SecondViewController alloc] initWithStyle:UITableViewStylePlain];
    ThirdViewController *thirdVc = [[ThirdViewController alloc] initWithStyle:UITableViewStylePlain];
    FourthViewController *fourthVc = [[FourthViewController alloc] initWithStyle:UITableViewStylePlain];
    FifthViewController *fifthVc = [[FifthViewController alloc] initWithStyle:UITableViewStylePlain];
    NSMutableArray *childVcs = [NSMutableArray arrayWithObjects:firstVc,secondVc,thirdVc,fourthVc,fifthVc, nil];

//    self.automaticallyAdjustsScrollViewInsets = NO;

    
    AliyunSalesPageView *pageView = [[AliyunSalesPageView alloc] initWithFrame:self.view.bounds titleViewType:MyTitleViewTypeScrollBar style:style titles:titles childVcs:[childVcs copy] parentVc:self];
    
    // pageView 成为子控制器的delegate
    // pageView 实现协议方法，子控制器的tableView发生滚动直接调用delegate的协议方法
    firstVc.delegate = pageView;
    
    [self.view addSubview:pageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
