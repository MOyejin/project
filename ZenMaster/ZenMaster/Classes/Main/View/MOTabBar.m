//
//  MOTabBar.m
//  TheStars
//
//  Created by mo on 16/5/3.
//  Copyright © 2016年 moyejin. All rights reserved.
//

#import "MOTabBar.h"
#import "MOTabBarButton.h"


@interface MOTabBar()

@property (nonatomic, weak) UIButton *selectedButton;

@end

@implementation MOTabBar

- (NSMutableArray *)buttons
{
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
    }
    
    return _buttons;
}

//传递模型
- (void)setItems:(NSArray *)items{
    
    _items = items;
    
    // 遍历模型数组，创建对应tabBarButton
    for (UITabBarItem *item in _items) {
        
        MOTabBarButton *btn = [MOTabBarButton buttonWithType:UIButtonTypeCustom];
        // 给按钮赋值模型，按钮的内容由模型对应决定
        btn.item = item;
        btn.tag = self.buttons.count;
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        if (btn.tag == 0) { // 默认选中第0个
            
            [self btnClick:btn];
            
        }
        
        [self addSubview:btn];
        
        // 把按钮添加到按钮数组
        [self.buttons addObject:btn];
        
    }
}

// 点击tabBarButton调用
-(void)btnClick:(UIButton *)button
{
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;
    // 通知tabBarVc切换控制器，
    if ([_delegate respondsToSelector:@selector(tabBar:didClickButton:)]) {
        [_delegate tabBar:self didClickButton:button.tag];
    }
}

//设置所有tabBarButton的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = w / (self.items.count);
    CGFloat btnH = h;
    
    
    int i = 0;
    for (UIView *tabBarButton in self.buttons) {
        btnX = i * btnW;
        tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
        i++;
    }
    
}


@end
