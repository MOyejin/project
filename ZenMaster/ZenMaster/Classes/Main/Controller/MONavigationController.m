    //
    //  MONavigationController.m
    //  TheStars
    //
    //  Created by mo on 16/5/3.
    //  Copyright © 2016年 moyejin. All rights reserved.
    //

#import "MONavigationController.h"
#import "MOTabBar.h"
#import "UIBarButtonItem+Item.h"
//#import "CRNavigationBar.h"

@interface MONavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation MONavigationController


- (void)viewDidLoad {
    
    [super viewDidLoad];


    //自定义返回按钮  (全局设置)
    
//    UIImage *backButtonImage = [[UIImage imageNamed:@"back-arrow"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
//    
//    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
//    //将返回按钮的文字position设置不在屏幕上显示
//    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];

    self.delegate = self;
    
    
}



- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName : [UIFont boldSystemFontOfSize:18] };
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count) { // 不是根控制器
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIBarButtonItem *left = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"back-arrow"] highImage:[UIImage imageNamed:@"back-arrow"] target:self action:@selector(popToPre) forControlEvents:UIControlEventTouchUpInside];
        // 设置导航条的按钮
        viewController.navigationItem.leftBarButtonItem = left;
        
    }
    
    [super pushViewController:viewController animated:animated];
    
}

- (void)popToPre
{
    //返回上一个导航控制器
    [self popViewControllerAnimated:YES];
}

    //导航控制器即将显示新的控制器的时候调用
    //从另一个控制器直接跳到根控制器的时候一定要从新移除系统的tabBar
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
         NSLog(@"%@+++",[[UIApplication sharedApplication].keyWindow.subviews[0] class]);

        if ([[UIApplication sharedApplication].keyWindow.rootViewController isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tabBarVc = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
            // 删除系统自带的tabBarButton
            for (UIView *tabBarButton in tabBarVc.tabBar.subviews) {
                if (![tabBarButton isKindOfClass:[MOTabBar class]]) {
                    [tabBarButton removeFromSuperview];
    
                    NSLog(@"111111111111111");
    
    
                }
            }
        }
    
}

    //导航控制器跳转完成的时候调用
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if(viewController == self.viewControllers[0]) {
            //显示根控制器
        self.interactivePopGestureRecognizer.delegate = nil;
        
        self.interactivePopGestureRecognizer.enabled = NO;
        
    }else{
            //关闭系统侧滑返回功能
        self.interactivePopGestureRecognizer.enabled = YES;
        
        
    }
}



@end
