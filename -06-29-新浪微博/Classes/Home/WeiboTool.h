//
//  WeiboTool.h
//  -06-29-新浪微博
//
//  Created by yangxin on 14-7-2.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessBlock)(NSArray *weibos);
typedef void (^FailureBlock)(NSError *error);

@interface WeiboTool : NSObject

+ (void)weiboWithSuccess:(SuccessBlock)succeB failure:(FailureBlock)failB;

@end
