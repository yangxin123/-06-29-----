//
//  Account.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-7-2.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "Account.h"

@implementation Account

- (instancetype)initWithAccessTocken:(NSString *)accessToken uid:(NSString *)uid
{
    if (self = [super init]) {
        _accessToken = accessToken;
        _uid = uid;
    }
    
    return self;
}

+ (instancetype)accountWithAccessTocken:(NSString *)accessToken uid:(NSString *)uid
{
    return [[self alloc] initWithAccessTocken:accessToken uid:uid];
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_accessToken forKey:@"accessToken"];
    [aCoder encodeObject:_uid forKey:@"uid"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        _accessToken = [aDecoder decodeObjectForKey:@"accessToken"];
        _uid = [aDecoder decodeObjectForKey:@"uid"];
    }
    
    return self;
}


@end
