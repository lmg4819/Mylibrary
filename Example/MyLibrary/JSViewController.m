//
//  JSViewController.m
//  MyLibrary
//
//  Created by lmg on 09/17/2018.
//  Copyright (c) 2018 lmg. All rights reserved.
//

#import "JSViewController.h"
#import <MyLibrary/SDCycleScrollView.h>
#import <MyLibrary/UIView+SDExtension.h>

@interface JSViewController ()<SDCycleScrollViewDelegate>

@end

@implementation JSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:0.99];
    
    NSArray *imageNames = @[@"h1.jpg",
                            @"h2.jpg",
                            @"h3.jpg",
                            @"h4.jpg",
                            @"h7.png" // 本地图片请填写全名
                            ];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSString *tempStr in imageNames) {
        NSString *imagePath = [SDCycleScrollView getImagePathWithImageName:tempStr];
        [tempArray addObject:imagePath];
    }
    
   
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, self.view.sd_width, 180) shouldInfiniteLoop:YES imageNamesGroup:tempArray];
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    [self.view addSubview:cycleScrollView];
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
}

#pragma mark -SDCycleScrollViewDelegate
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"------%ld------",(long)index);
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    NSLog(@"======%ld======",(long)index);
}

@end
