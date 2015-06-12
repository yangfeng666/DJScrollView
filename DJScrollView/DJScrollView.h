//
//  DJScrollView.h
//  DJScrollIViewDemo
//
//  Created by 杨峰 on 15/5/16.
//  Copyright (c) 2015年 DJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSTimer+Addition.h"

@protocol DJScrollViewDelegate <NSObject>

- (void)didSelectScrollViewWithSelectNumber:(int)selectNumber;

@end

@interface DJScrollView : UIScrollView<UIScrollViewDelegate>

- (id)initWithFrame:(CGRect)frame animationDuration:(NSTimeInterval)animationDuration;

@property (nonatomic, strong) NSArray * adsArray;
@property (nonatomic , strong) NSTimer * animationTimer;

@property (weak) id<DJScrollViewDelegate> djDelegate;

@property (strong, nonatomic) UIPageControl * pageControl;

@end
