//
//  NSString+Weibo.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-6-30.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "NSString+Weibo.h"

@implementation NSString (Weibo)

- (NSString *)fileByAppending:(NSString *)appendStr
{
    NSString *str;
    
    NSString *extension = [self pathExtension];
    
    str = [self stringByDeletingPathExtension];
    
    str = [str stringByAppendingString:appendStr];
    
    str = [str stringByAppendingPathExtension:extension];
    
    return str;
}

@end
