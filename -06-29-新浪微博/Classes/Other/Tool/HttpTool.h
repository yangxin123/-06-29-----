//
//  HttpTool.h
//  -06-29-新浪微博
//
//  Created by yangxin on 14-7-2.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^successBock)(id JSON);
typedef void (^failureBock)(NSError *error);

@interface HttpTool : NSObject

+ (void)postWithPath:(NSString *)path parameters:(NSDictionary *)parameters success:(successBock)block failure:(failureBock)failure;

+ (void)getWithPath:(NSString *)path parameters:(NSDictionary *)parameters success:(successBock)block failure:(failureBock)failure;

@end
