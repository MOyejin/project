//
//  MOBadgeView.m
//
//  Created by user on 16/3/5.
//  Copyright © 2015年 son. All rights reserved.
//

#define MOBadgeViewFont  [UIFont systemFontOfSize:11]

#import "MOBadgeView.h"
#import "UIView+Frame.h"

@implementation MOBadgeView


//init方法
- (instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = NO;
        
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        
        //设置字体的大小
        self.titleLabel.font = MOBadgeViewFont;
        //图片的大小就是按钮的大小
        [self sizeToFit];
        
    }
    return self;
}

//重写属性的set方法
- (void)setBadgeValue:(NSString *)badgeValue{
    _badgeValue = badgeValue;
    
    if (badgeValue == nil || [badgeValue isEqualToString:@""] || [badgeValue isEqualToString:@"0"]) { // 没有badgeValue，或者badgeValue为空，就隐藏
        self.hidden = YES;// 直接返回
        return;
    }else{
        self.hidden = NO;
    }
    
    [self setTitle:badgeValue forState:UIControlStateNormal];
    
    CGFloat titleW = [badgeValue boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : MOBadgeViewFont} context:nil].size.width;
    
    if (titleW > self.width) { // 文字宽度大于按钮宽度
        [self setBackgroundImage:nil forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"new_dot"] forState:UIControlStateNormal];
    }else{
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateNormal];
    }
    
}

@end
