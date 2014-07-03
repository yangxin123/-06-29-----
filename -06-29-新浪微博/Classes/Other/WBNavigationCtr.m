//
//  WBNavigationCtr.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-6-30.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "WBNavigationCtr.h"

@interface WBNavigationCtr ()

@end

@implementation WBNavigationCtr



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置导航栏背景风格
    UINavigationBar *bar = [UINavigationBar appearance];
    
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background@2x.png"] forBarMetrics:UIBarMetricsDefault];
    [bar setTitleTextAttributes:@{
                                  NSFontAttributeName : [UIFont systemFontOfSize:21],
                                  NSForegroundColorAttributeName : [UIColor blackColor],
                                  }];
    
    
    // 设置有文字按钮的外观
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    [item setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [item setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background_pushed.png"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    [item setTitleTextAttributes:@{
                                   NSFontAttributeName : [UIFont systemFontOfSize:17],
                                   NSForegroundColorAttributeName : [UIColor darkGrayColor]
                                   } forState:UIControlStateNormal];
}


@end
