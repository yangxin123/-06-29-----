//
//  HomeViewCtr.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-6-30.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "HomeViewCtr.h"
#import "NSString+Weibo.h"
#import "UIBarButtonItem+WeiBo.h"


#import "WeiboTool.h"

#import "Weibo.h"

@interface HomeViewCtr ()
{
    NSMutableArray          *_weibos;
}
@end

@implementation HomeViewCtr

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ////////////////////////////////////////////////////
    
    // UI界面设置
    self.title = @"首页";

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithIcon:@"navigationbar_compose.png" highlightedIcon:@"navigationbar_compose_highlighted.png" target:self action:@selector(editWeibo)];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithIcon:@"navigationbar_pop.png" highlightedIcon:@"navigationbar_pop_highlighted.png" target:self action:@selector(open)];
    
    // 数据层
    [self loadWeiboData];
 
}

- (void)loadWeiboData
{
    _weibos = [NSMutableArray array];
    
    [WeiboTool weiboWithSuccess:^(NSArray *weibos) {
        
        
        [_weibos addObjectsFromArray:weibos];
        
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        WBLog(@"%@", error.localizedDescription);
    }];
    
    
    
}

- (void)editWeibo
{
    WBLog(@"123");
}

- (void)open
{
    WBLog(@"124");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _weibos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    Weibo *w = _weibos[indexPath.row];
    
    cell.textLabel.text = w.text;
    cell.detailTextLabel.text = w.user.screenName;
    
    return cell;
}


@end
