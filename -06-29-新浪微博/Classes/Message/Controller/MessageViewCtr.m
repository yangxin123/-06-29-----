//
//  MessageViewCtr.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-6-30.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "MessageViewCtr.h"

@interface MessageViewCtr ()

@end

@implementation MessageViewCtr


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发私信" style:UIBarButtonItemStylePlain target:self action:nil];
        
}


@end
