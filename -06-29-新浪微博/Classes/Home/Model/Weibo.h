//
//  Weibo.h
//  -06-29-新浪微博
//
//  Created by yangxin on 14-7-2.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Weibo : NSObject

@property (nonatomic, copy) NSString *text; // annotate
@property (nonatomic, strong) User *user; // annotate

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
