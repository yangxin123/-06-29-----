//
//  AppDelegate.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-6-29.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "AppDelegate.h"
#import "NewfeatureViewCtr.h"
#import "OauthViewCtr.h"
#import "MianCtr.h"

#import "AccountTool.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // 取得info.plist字典
    NSString *version = [NSBundle mainBundle].infoDictionary[(NSString *)kCFBundleVersionKey];
    
    // 从沙盒取出版本号
    NSString *saveVersion = [[NSUserDefaults standardUserDefaults] objectForKey:version];
    
    if ([saveVersion isEqualToString:version]) { // 同一版本
        
        if ([AccountTool sharedAccountTool].account) {
            self.window.rootViewController = [[MianCtr alloc] init];
            
        } else {
            self.window.rootViewController = [[OauthViewCtr alloc] init];
        }
        
        
    } else { // 不同版本
        // 存储
        [[NSUserDefaults standardUserDefaults] setObject:version forKey:version];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        // 显示新特性
        self.window.rootViewController = [[NewfeatureViewCtr alloc] init];
    }
    
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
