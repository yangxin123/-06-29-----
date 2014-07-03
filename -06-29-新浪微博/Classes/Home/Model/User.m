//
//  User.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-7-2.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        _screenName = dict[@"screen_name"];
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"< User : %p, screenName:%@>", self, _screenName];
}

@end
