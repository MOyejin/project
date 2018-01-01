//
//  MOTabBarButton.m
//  TheStars
//
//  Created by mo on 16/5/3.
//  Copyright © 2016年 moyejin. All rights reserved.
//

#import "MOTabBarButton.h"
#import "MOBadgeView.h"
#import "UIView+Frame.h"

@interface MOTabBarButton()

@property (nonatomic,weak) MOBadgeView *badgeView;

@end

@implementation MOTabBarButton

//重写setHighlighted,取消高亮做的事情
- (void)setHighlighted:(BOOL)highlighted{}

//懒加载MOBadgeView
- (MOBadgeView *)badgeView{
    
    if(!_badgeView) {
        MOBadgeView *btn = [MOBadgeView buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        _badgeView = btn;
    }
    return _badgeView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        // 设置字体颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        self.backgroundColor = [UIColor whiteColor];
        // 图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        // 文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 设置文字字体
        self.titleLabel.font = [UIFont systemFontOfSize:13];
       
        
    }
    return  self;
}

// 传递UITabBarItem给tabBarButton,给tabBarButton内容赋值
- (void)setItem:(UITabBarItem *)item{
    _item = item;
    
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    //KVO:时刻监听一个对象的属性有没有改变
    //给谁添加观察者
    //Observer:按钮
    
    [self setTitle:_item.title forState:UIControlStateNormal];
    [self setImage:_item.image forState:UIControlStateNormal];
    [self setImage:_item.selectedImage forState:UIControlStateSelected];
    self.badgeView.badgeValue = @"1";
    
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
}

//只要监听的属性一有新值,就会调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    [self setTitle:_item.title forState:UIControlStateNormal];
    [self setImage:_item.image forState:UIControlStateNormal];
    [self setImage:_item.selectedImage forState:UIControlStateSelected];
    self.badgeView.badgeValue = @"1";

    
}


//修改按钮内部子控件的frame
- (void)layoutSubviews{
    [super layoutSubviews];
    
    //图片
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height *0.7;
    
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    //文字
    CGFloat titleX = 0;
    CGFloat titleY = imageH - 3;
    CGFloat titleW = self.bounds.size.width;
    CGFloat titleH = self.bounds.size.height - imageH;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    // 设置badgeView尺寸
    self.badgeView.x = self.width - self.badgeView.width - 16;
    
    self.badgeView.y = 0;
    
    
}
- (void)dealloc
{
    [self removeFromSuperview];
    
    //销毁的时候移除kvo监听
    [_item removeObserver:self forKeyPath:@"title" context:nil];
    [_item removeObserver:self forKeyPath:@"image" context:nil];
    [_item removeObserver:self forKeyPath:@"selectedImage" context:nil];
    [_item removeObserver:self forKeyPath:@"badgeValue" context:nil];

}



@end
