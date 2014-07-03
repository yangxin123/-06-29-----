//
//  WeiboTool.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-7-2.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "WeiboTool.h"

#import "HttpTool.h"



#import "Weibo.h"

@interface WeiboTool()
{
    NSMutableArray              *_weibos;
}
@end

@implementation WeiboTool

+ (void)weiboWithSuccess:(SuccessBlock)succeB failure:(FailureBlock)failB
{
    
    [HttpTool getWithPath:@"2/statuses/friends_timeline.json" parameters:nil
     success:^(id JSON) {
        NSLog(@"%@", JSON);
         if (succeB == nil) return ;

         
        NSMutableArray *weibos = [NSMutableArray array];
        NSArray *data = JSON[@"statuses"];
        for (NSDictionary *dict in data) {
            Weibo *weibo = [[Weibo alloc] initWithDict:dict];
            
            [weibos addObject:weibo];
        }
        
        succeB(weibos);
    } failure:^(NSError *error) {
        if (failB == nil) return ;

        
        failB(error);
    }];
}


@end
