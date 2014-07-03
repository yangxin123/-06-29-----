//
//  DockItem.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-6-30.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "DockItem.h"

#define kTitleScale 0.3
#define kDockItemClicked @"tabbar_slider.png"

@implementation DockItem

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        
        self.imageView.contentMode = UIViewContentModeCenter;
        
        [self setBackgroundImage:[UIImage imageNamed:kDockItemClicked] forState:UIControlStateSelected];
    }
    
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0;
    CGFloat imageH = contentRect.size.height * (1 - kTitleScale);
    CGFloat imageY = 0;
    CGFloat imageW = contentRect.size.width;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleH = contentRect.size.height * kTitleScale;
    CGFloat titleY = contentRect.size.height - titleH - 3;
    CGFloat titleW = contentRect.size.width;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)setHighlighted:(BOOL)highlighted {}

@end
