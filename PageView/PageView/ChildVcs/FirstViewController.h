//
//  FirstViewController.h
//  PageView
//
//  Created by sw on 17/5/2.
//  Copyright © 2017年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AliyunSalesScrollViewDelegate.h"

@interface FirstViewController : UITableViewController

@property(nonatomic,weak) id<AliyunSalesScrollViewDelegate> delegate;
@end
