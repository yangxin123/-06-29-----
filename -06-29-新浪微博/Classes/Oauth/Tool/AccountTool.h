

//
//  AccountTool.h
//  -06-29-新浪微博
//
//  Created by yangxin on 14-7-2.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import "Account.h"

@interface AccountTool : NSObject

- (void)saveAccount:(Account *)account;


singleton_Interface(AccountTool)

@property (nonatomic, readonly) Account *account; // <#annotate#>

@end
