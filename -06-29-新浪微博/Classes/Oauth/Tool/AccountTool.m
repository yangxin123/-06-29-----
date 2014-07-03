//
//  AccountTool.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-7-2.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "AccountTool.h"

#define kFile [docDirPath stringByAppendingPathComponent:@"account.data"]



@implementation AccountTool

singleton_Implementation(AccountTool)

- (void)saveAccount:(Account *)account
{
    _account = account;
    
    [NSKeyedArchiver archiveRootObject:account toFile:kFile];
}

- (id)init
{
    if (self = [super init]) {
        _account = [NSKeyedUnarchiver unarchiveObjectWithFile:kFile];
    }
    
    return self;
}





@end
