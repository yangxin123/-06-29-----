//
//  User.h
//  -06-29-新浪微博
//
//  Created by yangxin on 14-7-2.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, copy) NSString *screenName; // <#annotate#>

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
