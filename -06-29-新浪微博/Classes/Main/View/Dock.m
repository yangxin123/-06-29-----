//
//  Dock.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-6-30.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "Dock.h"
#import "DockItem.h"



@interface Dock()
{
    int                 count;
    UIButton            *currentBtn;
}
@end

@implementation Dock

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
       
    }
    return self;
}

- (void)addItemWithTitle:(NSString *)title icon:(NSString *)icon seletedIcon:(NSString *)seletedIcon
{
    DockItem *item = [[DockItem alloc] init];
    [item setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:seletedIcon] forState:UIControlStateSelected];
    [item setTitle:title forState:UIControlStateNormal];
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:item];
    
    count = self.subviews.count;
    
    [self adjustDockItemFrame];
    
    
}

- (void)adjustDockItemFrame
{
    CGFloat itemH = kDockHeight;
    CGFloat itemW = self.frame.size.width / count;
    
    if (count == 1) {
        [self itemClick:self.subviews[0]];
    }
    
    for (int i = 0; i < count; i++) {
        DockItem *item = self.subviews[i];
        item.frame = CGRectMake(itemW * i, 0, itemW, itemH);
        
        item.tag = i;
    }
}

- (void)itemClick:(UIButton *)item
{
    currentBtn.selected = NO;
    item.selected = YES;
    
    [_delegate dockItemClick:self from:currentBtn.tag to:item.tag];
    
    currentBtn = item;
}

@end
