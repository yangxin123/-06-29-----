//
//  MoreViewCtr.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-6-30.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "MoreViewCtr.h"
#import "UIImage+WeiBo.h"
#import "GroupCell.h"

@interface MoreViewCtr () <UIActionSheetDelegate>
{
    NSArray             *_data;
}
@end

@implementation MoreViewCtr


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /** =====================================
     UI设置
     */
    
    //// 设置导航栏
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:nil];
    self.title = @"更多";
    
    //// 设置tableView
    self.tableView.backgroundColor = [UIColor colorWithRed:226/255.0f green:226/255.0f blue:226/255.0f alpha:1];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 5;
    
    
    //// 添加tableView底部按钮
    UIButton *footer = [[UIButton alloc] initWithFrame:CGRectMake(2, 0, 0, 44)];
    [footer setBackgroundImage:[UIImage reSizeWithImage:@"common_button_big_red.png"] forState:UIControlStateNormal];
    [footer setBackgroundImage:[UIImage reSizeWithImage:@"common_button_big_red_highlighted.png"] forState:UIControlStateHighlighted];
    [footer setTitle:@"退出当前帐号" forState:UIControlStateNormal];
    [footer addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    
    self.tableView.tableFooterView = footer;
    
    // 增加tableView额外滚动区域
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);
    
    /** =====================================
     加载more.plist
     */
    NSURL *url = [[NSBundle mainBundle] URLForAuxiliaryExecutable:@"more.plist"];
    
    _data = [NSArray arrayWithContentsOfURL:url];
}

#pragma mark - Actions

- (void)logout
{
    UIActionSheet *alterView = [[UIActionSheet alloc] initWithTitle:@"确定退出当前帐号吗?" delegate:self cancelButtonTitle:@"不，点错了" destructiveButtonTitle:@"好" otherButtonTitles:nil, nil];
    
    [alterView showInView:self.view];
    
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%i", buttonIndex);
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_data[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    
    GroupCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[GroupCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.tableV = tableView;
    }
    
    cell.textLabel.text = _data[indexPath.section][indexPath.row][@"name"];
    
    cell.indexPath = indexPath;
    
    if (indexPath.section == 2) {
        cell.cellType = CellTypeText;
        cell.rightLabel.text = indexPath.row ? @"经典主题" : @"有图模式";
    } else {
        cell.cellType = CellTypeArrow;
    }
    
    return cell;
}

#pragma mark Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == _data.count - 1) {
        return  10;
    }
    
    return 0;
}


@end
