//
//  UIBarButtonItem+Item.h
//
//
//  Created by apple on 12-3-5.
//  Copyright (c) 2012年 MO. All rights reserved.
//

#import "MOTitleButton.h"
#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)
+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    // btn
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:highImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    btn.tag = 11;
    [btn addTarget:target action:action forControlEvents:controlEvents];
    btn.frame = CGRectMake(0, 0, 18, 20);
    return  [[UIBarButtonItem alloc] initWithCustomView:btn];
}
+ (UIBarButtonItem *)titleButtonItemWithImage:(UIImage *)image withTitle:(NSString *)title target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    // btn
    MOTitleButton *btn = [MOTitleButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn sizeToFit];
    //btn.tag = 11;
    [btn addTarget:target action:action forControlEvents:controlEvents];
    
    return  [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    // btn
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    if (title.length > 2) {
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    //设置靠右显示
    btn.titleLabel.textAlignment = NSTextAlignmentRight;
    CGSize sizes = CGSizeMake(320,200);
    
    CGSize btnsize = [btn.titleLabel.text sizeWithFont:[UIFont systemFontOfSize:15.0f] constrainedToSize:sizes lineBreakMode:0];
    btn.frame = CGRectMake(10, 0, btnsize.width, 44);
    
    [btn addTarget:target action:action forControlEvents:controlEvents];
    
    return  [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
