//
//  MOTitleView.m
//  爱任信
//
//  Created by 莫瑞伟 on 16/10/18.
//  Copyright © 2016年 moyejin. All rights reserved.
//

#import "MOTitleView.h"

@implementation MOTitleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:CGRectMake(0, 0, self.superview.bounds.size.width, self.superview.bounds.size.height)];
}

@end
