//
//  DJScrollView.m
//  DJScrollIViewDemo
//
//  Created by 杨峰 on 15/5/16.
//  Copyright (c) 2015年 DJ. All rights reserved.
//

#import "DJScrollView.h"

@implementation DJScrollView

- (id)initWithFrame:(CGRect)frame animationDuration:(NSTimeInterval)animationDuration{
    self = [self initWithFrame:frame];
    self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:animationDuration
                                                           target:self
                                                         selector:@selector(animationTimerDidFired:)
                                                         userInfo:nil
                                                          repeats:YES];
    [self.animationTimer pauseTimer];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.pagingEnabled = YES;
    }
    return self;
}

- (void)setAdsArray:(NSArray *)adsArray{
    _adsArray = adsArray;
    CGSize contentSize;
    CGPoint startPoint;
    if (adsArray.count > 1) {
        [self.animationTimer resumeTimerAfterTimeInterval:3.0];
        contentSize = CGSizeMake(self.frame.size.width * (adsArray.count + 2), 0);
        for (int i = 0; i < adsArray.count + 2; i ++) {
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
            if (i == 0) {
                imageView.image = [UIImage imageNamed:adsArray[adsArray.count - 1]];
            }else if (i == adsArray.count + 1) {
                imageView.image = [UIImage imageNamed:adsArray[0]];
            }else{
                imageView.image = [UIImage imageNamed:adsArray[i - 1]];
            }
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(contentViewTapAction:)];
            [self addGestureRecognizer:tapGesture];
            [self addSubview:imageView];
        }
        startPoint = CGPointMake(self.frame.size.width, 0);
    }else{
        for (int i = 0; i < adsArray.count; i ++) {
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
            imageView.image = [UIImage imageNamed:adsArray[i]];
            [self addSubview:imageView];
        }
        contentSize = CGSizeMake(self.frame.size.width, 0);
        startPoint = CGPointZero;
    }
    self.contentSize = contentSize;
    [self setContentOffset:startPoint animated:YES];
    
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.numberOfPages = adsArray.count;
    self.pageControl.frame = CGRectMake(0, self.frame.size.height - 15, 320, 10);
    self.pageControl.currentPage = 0;
    self.pageControl.userInteractionEnabled = NO;
    [self.pageControl setPageIndicatorTintColor:[UIColor colorWithRed:199.0 / 255.0 green:199.0 / 255.0 blue:199.0 / 255.0 alpha:0.8]];
    [self.pageControl setCurrentPageIndicatorTintColor:[UIColor colorWithRed:99.0 / 255.0 green:157.0 / 255.0 blue:253.0 / 255.0 alpha:1]];
    [self.superview addSubview:self.pageControl];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x < self.frame.size.width) {
        [self setContentOffset:CGPointMake(self.frame.size.width * (self.adsArray.count + 1), 0) animated:NO];
    }
    if (scrollView.contentOffset.x > self.frame.size.width * (self.adsArray.count + 1)) {
        [self setContentOffset:CGPointMake(self.frame.size.width, 0) animated:NO];
    }
    int pageCount = scrollView.contentOffset.x / self.frame.size.width;
    if (pageCount > self.adsArray.count) {
        pageCount = 0;
    }else if (pageCount == 0){
        pageCount = (int)self.adsArray.count - 1;
    }else{
        pageCount --;
    }
    self.pageControl.currentPage = pageCount;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}

- (void)animationTimerDidFired:(NSTimer *)timer{
    CGPoint newOffset = CGPointMake(self.contentOffset.x  + CGRectGetWidth(self.frame), self.contentOffset.y);
    [self setContentOffset:newOffset animated:YES];
}


- (void)contentViewTapAction:(UITapGestureRecognizer *)tap
{
    NSLog(@"-=-=-=-==%ld", (long)self.pageControl.currentPage);
    [self.djDelegate didSelectScrollViewWithSelectNumber:(int)self.pageControl.currentPage];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
