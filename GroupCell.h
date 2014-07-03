//
//  GroupCell.h
//  -06-29-新浪微博
//
//  Created by yangxin on 14-7-1.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    CellTypeArrow, // 箭头
    CellTypeText,  // 文字
    CellTypeNone   // 无样式
} CellType;

@interface GroupCell : UITableViewCell

@property (nonatomic, readonly) UILabel *rightLabel; // 右边的标签视图

@property (nonatomic, assign) CellType cellType; // 标签视图

@property (nonatomic, weak) UITableView *tableV; //

@property (nonatomic, strong) NSIndexPath *indexPath; // 

@end
