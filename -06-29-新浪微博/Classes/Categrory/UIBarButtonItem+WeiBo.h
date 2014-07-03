//
//  UIBarButtonItem+WeiBo.h
//  -06-29-新浪微博
//
//  Created by yangxin on 14-6-30.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (WeiBo)

- (instancetype)initWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlightedIcon target:(id)target action:(SEL)action;

@end
