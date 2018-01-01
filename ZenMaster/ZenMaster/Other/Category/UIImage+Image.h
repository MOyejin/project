//
//  UIBarButtonItem+Item.h
//
//
//  Created by apple on 12-3-5.
//  Copyright (c) 2012年 MO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)
// instancetype默认会识别当前是哪个类或者对象调用，就会转换成对应的类的对象
// UIImage *

// 加载最原始的图片，没有渲染
+ (instancetype)imageWithOriginalName:(NSString *)imageName;

+ (instancetype)imageWithStretchableName:(NSString *)imageName;

+ (UIImage *)cleImage:(UIColor *)color;

+ (UIImage*)imageWithSize:(CGSize)size borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth;

+ (instancetype)imageWithIconName:(NSString *)icon borderImage:(NSString *)borderImage border:(int)border;
@end
