//
//  MOTabBar.h
//  TheStars
//
//  Created by mo on 16/5/3.
//  Copyright © 2016年 moyejin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MOTabBar;

@protocol MOTabBarDelegate <NSObject>

@optional

- (void)tabBar:(MOTabBar *)tabBar didClickButton:(NSInteger)index;

@end

@interface MOTabBar : UIView

// items:保存每一个按钮对应tabBarItem模型
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, weak) id<MOTabBarDelegate> delegate;

@property (nonatomic, strong) NSMutableArray *buttons;

-(void)btnClick:(UIButton *)button;

@end
