//
//  BufferView.h
//  -06-29-新浪微博
//
//  Created by yangxin on 14-7-2.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BufferView : UIView

@property (nonatomic, copy) NSString *labelText; // <#annotate#>
@property (nonatomic, readonly) UIActivityIndicatorView *activityIndicator;
@end
