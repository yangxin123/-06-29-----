//
//  UIBarButtonItem+WeiBo.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-6-30.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "UIBarButtonItem+WeiBo.h"

@implementation UIBarButtonItem (WeiBo)

- (instancetype)initWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlightedIcon target:(id)target action:(SEL)action
{
    UIButton *btn = [[UIButton alloc] init];
    
    UIImage *image = [UIImage imageNamed:icon];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highlightedIcon] forState:UIControlStateHighlighted];
    [btn setFrame:(CGRect){CGPointZero, image.size}];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [self initWithCustomView:btn];
}

@end
