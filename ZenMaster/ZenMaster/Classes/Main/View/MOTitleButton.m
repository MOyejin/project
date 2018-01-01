//
//  FCTitleButton.m
//  Free community
//
//  Created by wjn on 15/4/28.
//  Copyright (c) 2015年 Free community. All rights reserved.

#import "UIImage+Image.h"
#import "MOTitleButton.h"
#import "UIView+Frame.h"

@implementation MOTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageWithStretchableName:@""] forState:UIControlStateHighlighted];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.currentImage == nil) return;
    
    // title  改变标题位置，方便在其后面加上图片仍然居中
    self.titleLabel.x = self.titleLabel.x - 10;
    
    // image
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
}

// 重写setTitle方法，扩展计算尺寸功能

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    [self sizeToFit];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    [self sizeToFit];
}

@end
