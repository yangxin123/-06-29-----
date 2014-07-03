//
//  DockViewController.m
//  -06-30-Dock栏的封装
//
//  Created by yangxin on 14-6-30.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "DockViewController.h"
#import "Dock.h"

@interface DockViewController () <DockDelegate>

@end

@implementation DockViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _dock = [[Dock alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - kDockHeight, 320, kDockHeight)];
    _dock.delegate = self;
    //
    [self.view addSubview:_dock];
}

#pragma mark - dock 的代理方法

- (void)dockItemClick:(Dock *)dock from:(NSInteger)from to:(NSInteger)to
{
    if (to < 0 || to >= self.childViewControllers.count) return;
    
    UIViewController *fromViewCtr = self.childViewControllers[from];
    UIViewController *toViewCtr = self.childViewControllers[to];
    
    CGFloat viewH = self.view.bounds.size.height - kDockHeight;
    CGFloat viewW = self.view.bounds.size.width;
    
    toViewCtr.view.frame = CGRectMake(0, 0, viewW, viewH);
    
    [fromViewCtr.view removeFromSuperview];
    
    [self.view addSubview:toViewCtr.view];
}



@end
