//
//  NSArray+Log.m
//  移动词海
//
//  Created by 刘凡 on 14-1-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithFormat:@"%d (\n", self.count];

    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];

    [strM appendString:@")\n"];

    return strM;
}

@end
