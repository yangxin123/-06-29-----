//
//  HttpTool.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-7-2.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking.h"
#import "OauthConfig.h"

#import "AccountTool.h"

@implementation HttpTool

+ (void)requestWithPath:(NSString *)path parameters:(NSDictionary *)parameters success:(successBock)block failure:(failureBock)failure method:(NSString *)method

{
    // 1.创建post请求
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:kBaseBaseURL]];
    
    
    
    NSMutableDictionary *allParams = [NSMutableDictionary dictionary];
    
    if (parameters) {
        [allParams setDictionary:parameters];
    }
    
    NSString *token = [AccountTool sharedAccountTool].account.accessToken;
    
    if (token) {
        [allParams setObject:token forKey:@"access_token"];
    }
    
    NSURLRequest *request = [client requestWithMethod:method path:path parameters:allParams];
    
    // 2.创建AFJSONRequestOperation对象
    NSOperation *op = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        if (block == nil) return ;
        block(JSON);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        if (failure == nil) return ;
        
        failure(error);
    }];
    
    [op start];
    
    
}

+ (void)postWithPath:(NSString *)path parameters:(NSDictionary *)parameters success:(successBock)block failure:(failureBock)failure
{
    [self requestWithPath:path parameters:parameters success:block failure:failure method:@"POST"];
}

+ (void)getWithPath:(NSString *)path parameters:(NSDictionary *)parameters success:(successBock)block failure:(failureBock)failure
{
    [self requestWithPath:path parameters:parameters success:block failure:failure method:@"GET"];
}

@end
