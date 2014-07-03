//
//  OauthViewCtr.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-7-1.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "OauthViewCtr.h"
#import "MianCtr.h"

#import "OauthConfig.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"

#import "AccountTool.h"
#import "HttpTool.h"

#import "BufferView.h"

@interface OauthViewCtr () <UIWebViewDelegate>
{
    UIWebView           *_web;
}
@end

@implementation OauthViewCtr

- (void)viewDidLoad
{
    [super viewDidLoad];

    _web = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _web.delegate = self;
    
    [self.view addSubview:_web];
    NSString *str = [kAuthorizeURL stringByAppendingFormat:@"?client_id=%@&redirect_uri=%@&display=mobile", kAppKey, kRedirectURL];
    WBLog(@"%@", str);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    
    [_web loadRequest:request];
}

#pragma mark - webView 代理

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *redirectStr = request.URL.absoluteString;
    NSRange range = [redirectStr rangeOfString:@"code="];
    if (range.length != 0) {
        NSString *requestToken = [redirectStr substringFromIndex:range.location + range.length];
        
        [HttpTool postWithPath:@"oauth2/access_token"
                   parameters:@{
                             @"client_id" : kAppKey,
                             @"client_secret" : KAppSecret,
                             @"grant_type" : @"authorization_code",
                             @"redirect_uri" : kRedirectURL,
                             @"code" : requestToken
                         }
         success:^(id JSON) {
             
            Account *account = [Account accountWithAccessTocken:JSON[@"access_token"] uid:JSON[@"uid"]];
            [[AccountTool sharedAccountTool] saveAccount:account];
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
            self.view.window.rootViewController = [[MianCtr alloc] init];
             
         }
         failure:^(NSError *error) {
             
             [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
             
         }];
        
        
        
        return NO;
    }
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    // 显示指示器
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"正在加载页面...";
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}



@end
