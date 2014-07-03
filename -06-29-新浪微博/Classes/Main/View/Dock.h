//
//  Dock.h
//  -06-29-新浪微博
//
//  Created by yangxin on 14-6-30.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kDockHeight 44

@class Dock;

@protocol DockDelegate <NSObject>

@optional
- (void)dockItemClick:(Dock *)dock from:(NSInteger)from to:(NSInteger)to;

@end

@interface Dock : UIView

@property (nonatomic, weak) id<DockDelegate> delegate; // <#annotate#>

- (void)addItemWithTitle:(NSString *)title icon:(NSString *)icon seletedIcon:(NSString *)seletedIcon;

@end
