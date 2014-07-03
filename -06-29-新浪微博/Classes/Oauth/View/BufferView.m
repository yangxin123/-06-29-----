//
//  BufferView.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-7-2.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "BufferView.h"

@interface BufferView()
{
    UILabel         *_label;
}
@end

@implementation BufferView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setBackgroundColor:[UIColor blackColor]];
        [self setAlpha:0.5];
        
        //// 创建activityIndicatorView
        
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
        [_activityIndicator setTransform:CGAffineTransformMakeScale(1.5, 1.5)];
        [_activityIndicator setCenter:CGPointMake(self.center.x, self.center.y - 30)];
        [_activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
        [self addSubview:_activityIndicator];
        [_activityIndicator startAnimating];
        
        //// 创建label
        
        CGFloat activityIndicatorMaxY = CGRectGetMaxY(_activityIndicator.frame);
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, activityIndicatorMaxY + 5, 320, 50)];
        
        label.textColor = [UIColor darkGrayColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"正在加载..";
        _label = label;
        [self addSubview:_label];
    }
    
    return self;
}

- (void)setLabelText:(NSString *)labelText
{
    _labelText = labelText;
    _label.text = _labelText;
}


@end
