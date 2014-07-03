//
//  MianCtr.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-6-29.
//  Copyright (c) 2014年 yangxin. All rights reserved.
// 主界面

#import "MianCtr.h"
#import "Dock.h"

#import "HomeViewCtr.h"
#import "MoreViewCtr.h"
#import "MessageViewCtr.h"

#import "WBNavigationCtr.h"

@interface MianCtr() <DockDelegate>
{
    
}
@end

@implementation MianCtr

- (void)viewDidLoad
{
    [super viewDidLoad];

    [UIApplication sharedApplication].statusBarHidden = NO;
    
    // =======================================================================
    // 1.添加其它控制器的view
    HomeViewCtr *home = [[HomeViewCtr alloc] init];
    WBNavigationCtr *nav1 = [[WBNavigationCtr alloc] initWithRootViewController:home];
    
    MessageViewCtr *message = [[MessageViewCtr alloc] init];
    WBNavigationCtr *nav2 = [[WBNavigationCtr alloc] initWithRootViewController:message];
    
    UIViewController *me = [[UIViewController alloc] init];
    me.view.backgroundColor = [UIColor grayColor];
    WBNavigationCtr *nav3 = [[WBNavigationCtr alloc] initWithRootViewController:me];
    
    UIViewController *square = [[UIViewController alloc] init];
    square.view.backgroundColor = [UIColor blueColor];
    WBNavigationCtr *nav4 = [[WBNavigationCtr alloc] initWithRootViewController:square];
    
    MoreViewCtr *more = [[MoreViewCtr alloc] initWithStyle:UITableViewStyleGrouped];
    WBNavigationCtr *nav5 = [[WBNavigationCtr alloc] initWithRootViewController:more];
    
    [self addChildViewController:nav1];
    [self addChildViewController:nav2];
    [self addChildViewController:nav3];
    [self addChildViewController:nav4];
    [self addChildViewController:nav5];

    // =======================================================================
    // 2.添加dock
    [_dock setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background.png"]]];
    
    [_dock addItemWithTitle:@"首页" icon:@"tabbar_home.png" seletedIcon:@"tabbar_home_selected.png"];
    [_dock addItemWithTitle:@"消息" icon:@"tabbar_message_center.png" seletedIcon:@"tabbar_message_center_selected.png"];
    [_dock addItemWithTitle:@"我" icon:@"tabbar_profile.png" seletedIcon:@"tabbar_profile_selected.png"];
    [_dock addItemWithTitle:@"广场" icon:@"tabbar_discover.png" seletedIcon:@"tabbar_discover_selected.png"];
    [_dock addItemWithTitle:@"更多" icon:@"tabbar_more.png" seletedIcon:@"tabbar_more_selected.png"];
 
}



@end
