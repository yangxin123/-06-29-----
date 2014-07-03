//
//  NewfeatureViewCtr.m
//  -06-29-新浪微博
//
//  Created by yangxin on 14-6-29.
//  Copyright (c) 2014年 yangxin. All rights reserved.
//  版本新特性界面

#import "NewfeatureViewCtr.h"
#import "UIImage+WeiBo.h"
#import "MianCtr.h"
#import "OauthViewCtr.h"

#import "AccountTool.h"

#define kImgCount 4

@interface NewfeatureViewCtr() <UIScrollViewDelegate>
{
    UIPageControl           *_pageCtr;
    UIScrollView            *_scrollView;
}

@end




@implementation NewfeatureViewCtr

#pragma mark - lifeCycle

- (void)loadView
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage fullScreen:@"new_feature_background.png"]];
    imageView.frame = [UIScreen mainScreen].applicationFrame;
    imageView.userInteractionEnabled = YES;
    self.view = imageView;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self addScrollView];
    
    [self addPageControl];
}

#pragma mark - UI界面初始化
#pragma mark 添加scrollView
- (void)addScrollView
{
    // 1.添加scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    _scrollView = scrollView;
    // 2.添加图片
    
    [self addScrollViewImages];
    
}

#pragma mark 添加图片
- (void)addScrollViewImages
{
    CGSize imgSize = _scrollView.frame.size;
    _scrollView.contentSize = CGSizeMake(kImgCount * imgSize.width, 0);
    for (int i = 0; i < kImgCount; i++) {
        
        UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage fullScreen:[NSString stringWithFormat:@"new_feature_%i.png", i + 1]]];
        
        imageV.frame = CGRectMake(imgSize.width * i, 0, imgSize.width, imgSize.height);
        
        [_scrollView addSubview:imageV];
        
        if (i == kImgCount - 1) {
            imageV.userInteractionEnabled = YES;
            // 立即体验
            UIImage *grokImage = [UIImage imageNamed:@"new_feature_finish_button.png"];
            
            UIButton *grok = [[UIButton alloc] init];
            [grok setBackgroundImage:grokImage forState:UIControlStateNormal];
            [grok setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted.png"] forState:UIControlStateHighlighted];
            [grok addTarget:self action:@selector(grokClick:) forControlEvents:UIControlEventTouchUpInside];
            grok.center = CGPointMake(imgSize.width * 0.5, imgSize.height * 0.8);
            grok.bounds = (CGRect){CGPointZero, grokImage.size};
            
            [imageV addSubview:grok];
            
            // 分享
            UIImage *shareImage = [UIImage imageNamed:@"new_feature_share_true.png"];
            
            UIButton *share = [[UIButton alloc] init];
            [share setBackgroundImage:shareImage forState:UIControlStateNormal];
            [share setBackgroundImage:[UIImage imageNamed:@"new_feature_share_false.png"] forState:UIControlStateSelected];
            [share addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
            share.center = CGPointMake(grok.center.x, imgSize.height * 0.7);
            share.bounds = (CGRect){CGPointZero, shareImage.size};
            share.adjustsImageWhenHighlighted = NO;
            [imageV addSubview:share];
        }
    }

}

#pragma mark 添加pageControl
- (void)addPageControl
{
    CGSize imgSize = self.view.frame.size;
    // 3.添加pageControl
    UIPageControl *pageCtr = [[UIPageControl alloc] init];
    pageCtr.frame = CGRectMake(0, 0, 150, 0);
    pageCtr.center = CGPointMake(imgSize.width * 0.5, imgSize.height - 40);
    pageCtr.numberOfPages = kImgCount;
    pageCtr.currentPageIndicatorTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"new_feature_pagecontrol_checked_point"]];
    pageCtr.pageIndicatorTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"new_feature_pagecontrol_point"]];
    
    [self.view addSubview:pageCtr];
    
    _pageCtr = pageCtr;
}

#pragma mark - scorllView代理

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _pageCtr.currentPage = scrollView.contentOffset.x / self.view.bounds.size.width;
}

#pragma mark - actions

#pragma mark 点击立即体验
- (void)grokClick:(UIButton *)btn
{
    //  跳转到主界面
    self.view.window.rootViewController = [[OauthViewCtr alloc] init];
    
}

#pragma mark 点击分享微博给好友
- (void)shareClick:(UIButton *)btn
{
     btn.selected = !btn.selected;
    //  跳转到主界面
    NSLog(@"321");
}

@end
