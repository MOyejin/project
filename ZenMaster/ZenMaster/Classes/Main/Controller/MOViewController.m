//
//  MOViewController.m
//  ZenMaster
//
//  Created by mo on 2017/12/29.
//  Copyright © 2017年 momo. All rights reserved.
//

#import "MOViewController.h"
#import <UINavigationController+FDFullscreenPopGesture.h>

@interface MOViewController ()

@end

@implementation MOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
}

- (void)setNavView{
    
    self.fd_prefersNavigationBarHidden = YES;
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 64)];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((width - 45) * 0.5, (44 - 13)* 0.5 + 20, 45, 15)];
    label.text = self.title_main;
    [view addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:view];
    
    UIView *line_View = [[UIView alloc] initWithFrame:CGRectMake(0, 63, width, 1)];
    line_View.backgroundColor = [UIColor colorWithRed:229 / 255.0 green:229 / 255.0 blue:229 / 255.0 alpha:1];
    [view addSubview:line_View];
    
}

@end
