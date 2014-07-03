//
//  Account.h
//  -06-29-新浪微博
//
//  Created by yangxin on 14-7-2.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject <NSCoding>

@property (nonatomic, copy) NSString *accessToken; //
@property (nonatomic, copy) NSString *uid; // <#annotate#>

- (instancetype)initWithAccessTocken:(NSString *)accessToken uid:(NSString *)uid;

+ (instancetype)accountWithAccessTocken:(NSString *)accessToken uid:(NSString *)uid;

@end
