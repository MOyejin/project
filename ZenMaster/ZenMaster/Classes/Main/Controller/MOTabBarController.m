//
//  MOTabBarController.m
//  TheStars
//
//  Created by mo on 16/5/3.
//  Copyright © 2016年 moyejin. All rights reserved.
//

#import "MOTabBarController.h"
#import "MONavigationController.h"
#import "MOHomeViewController.h"
#import "MOTheYardViewController.h"
#import "MOMusicViewController.h"
#import "MOMyViewController.h"

#import "MOTabBar.h"
#import "UIImage+Image.h"


#import <AudioToolbox/AudioToolbox.h>
#import "AppDelegate.h"
@interface MOTabBarController ()<MOTabBarDelegate,UITabBarControllerDelegate, UITextFieldDelegate>

@property (nonatomic,assign) NSInteger selectTag;

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation MOTabBarController

- (NSMutableArray *)items{
    
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.opaque = YES;
    
    self.delegate = self;
    
    //添加所有的子控制器
    [self setAllChildViewController];
    
    [self setTabBar];
   

}

- (void)setAllChildViewController{
    

    
    MOHomeViewController *homeVC = [[MOHomeViewController alloc] init];

    [self setUpOneChildViewController:homeVC image:[UIImage imageWithOriginalName:@"tab_personal_nol"] selectedImage:[UIImage imageWithOriginalName:@"tab_personal_sel"] title:@"修行" tag:0];
    
    MOTheYardViewController *theYardVC = [[MOTheYardViewController alloc] init];
    
    [self setUpOneChildViewController:theYardVC image:[UIImage imageWithOriginalName:@"tab_personal_nol"] selectedImage:[UIImage imageWithOriginalName:@"tab_personal_sel"] title:@"寺院" tag:1];
    
    MOMusicViewController *musicVC = [[MOMusicViewController alloc] init];
    
    [self setUpOneChildViewController:musicVC image:[UIImage imageWithOriginalName:@"tab_personal_nol"] selectedImage:[UIImage imageWithOriginalName:@"tab_personal_sel"] title:@"梵音" tag:2];
    
    MOMyViewController *myVC = [[MOMyViewController alloc] init];
    
    [self setUpOneChildViewController:myVC image:[UIImage imageWithOriginalName:@"tab_personal_nol"] selectedImage:[UIImage imageWithOriginalName:@"tab_personal_sel"] title:@"本人" tag:3];
    
    
}


#pragma mark 添加一个子控制器
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title tag:(int)tag{
    
    
    
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    vc.title = title;
    vc.tabBarItem.tag = tag;
    vc.view.backgroundColor = [UIColor whiteColor];
    MONavigationController *nav = [[MONavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
    [self.items addObject:vc.tabBarItem];
}

- (void)setTabBar
{
    // 自定义tabBar
    MOTabBar *tabBar = [[MOTabBar alloc] initWithFrame:self.tabBar.bounds];
    // 设置代理
    tabBar.delegate = self;
    
    // 给tabBar传递tabBarItem模型
    tabBar.items = self.items;
    
    // 添加自定义tabBar
    [self.tabBar addSubview:tabBar];
}


#pragma mark - 当点击tabBar上的按钮调用 (代理方法)
- (void)tabBar:(MOTabBar *)tabBar didClickButton:(NSInteger)index{
    
    self.selectedIndex = index;
    self.selectTag = index;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}
@end
