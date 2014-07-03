//
//  GroupCell.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-7-1.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "GroupCell.h"
#import "UIImage+WeiBo.h"

@interface GroupCell()
{
    UIImageView         *_bg;
    UIImageView         *_selBg;
}
@end

@implementation GroupCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        ////// 取出背景视图
        _bg = [[UIImageView alloc] init];
        self.backgroundView = _bg;
        
        _selBg = [[UIImageView alloc] init];
        self.selectedBackgroundView = _selBg;
        
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

- (void)setCellType:(CellType)cellType
{
    _cellType = cellType;
    
    if (_cellType == CellTypeArrow) {
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_icon_arrow.png"]];
    } else if (_cellType == CellTypeText) {
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, 0, 100, 44);
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [UIColor darkGrayColor];
        NSLog(@"%p", label);
        self.accessoryView = label;
        
        _rightLabel = label;

    } else if (_cellType == CellTypeNone) {
        self.accessoryView = nil;
    }
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    
    _bg = (UIImageView *)self.backgroundView;
    _selBg = (UIImageView *)self.selectedBackgroundView;

    int count = [_tableV numberOfRowsInSection:indexPath.section];
    
    if (count == 1) { // 如果只有一组 显示四个圆角的图片
        _bg.image = [UIImage reSizeWithImage:@"common_card_background.png"];
        _selBg.image = [UIImage reSizeWithImage:@"common_card_background_highlighted.png"];
    } else if (indexPath.row == 0) {// 本组的第一张
        _bg.image = [UIImage reSizeWithImage:@"common_card_top_background.png"];
        _selBg.image = [UIImage reSizeWithImage:@"common_card_top_background_highlighted.png"];
    } else if (indexPath.row == count - 1) {// 本组的第末张
        _bg.image = [UIImage reSizeWithImage:@"common_card_bottom_background.png"];
        _selBg.image = [UIImage reSizeWithImage:@"common_card_bottom_background_highlighted.png"];
    } else { // 其它行
        _bg.image = [UIImage reSizeWithImage:@"common_card_middle_background.png"];
        _selBg.image = [UIImage reSizeWithImage:@"common_card_middle_background_highlighted.png"];
    }
}


@end
