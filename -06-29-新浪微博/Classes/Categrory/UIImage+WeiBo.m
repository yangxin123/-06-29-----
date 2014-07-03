//
//  UIImage+WeiBo.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-6-29.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//

#import "UIImage+WeiBo.h"
#import "NSString+Weibo.h"

@implementation UIImage (WeiBo)

+ (UIImage *)reSizeWithImage:(NSString *)imgName
{
    UIImage *image = [UIImage imageNamed:imgName];
    
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    //image resizableImageWithCapInsets:UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>) resizingMode:UIImageResizingModeStretch
    
    return image;
}

+ (UIImage *)fullScreen:(NSString *)fileName
{
    // 如果是iphone5
    if (isIphone5) {
        fileName = [fileName fileByAppending:@"-568h@2x"];
    }
    
    return [self imageNamed:fileName];
}

@end
