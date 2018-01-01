//
//  UIBarButtonItem+Item.h
//
//
//  Created by apple on 12-3-5.
//  Copyright (c) 2012年 MO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)


+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
+ (UIBarButtonItem *)titleButtonItemWithImage:(UIImage *)image withTitle:(NSString *)title target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
@end
