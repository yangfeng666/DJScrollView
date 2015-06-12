//
//  ViewController.m
//  DJScrollIViewDemo
//
//  Created by 杨峰 on 15/5/16.
//  Copyright (c) 2015年 DJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DJScrollView * scrollView = [[DJScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width) animationDuration:4.0];
    [self.view addSubview:scrollView];

    self.imagesArray = @[@"tab1.png", @"tab2.png", @"tab3.png", @"tab4.png"];
//    self.imagesArray = @[@"tab1.png"];
//    self.imagesArray = @[@"tab1.png", @"tab2.png"];
    scrollView.adsArray = self.imagesArray;
        // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
