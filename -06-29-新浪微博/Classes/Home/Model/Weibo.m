//
//  Weibo.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-7-2.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "Weibo.h"

@implementation Weibo

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        _text = dict[@"text"];
        
        User *u = [[User alloc] initWithDict:dict[@"user"]];
        _user = u;
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"< Weibo : %p>, text : %@, user : %@", self, _text, _user];
}

@end
