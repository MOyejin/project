//
//  UIBarButtonItem+Item.h
//
//
//  Created by apple on 12-3-5.
//  Copyright (c) 2012年 MO. All rights reserved.
//


#import "UIImage+Image.h"

@implementation UIImage (Image)

+ (instancetype)imageWithOriginalName:(NSString *)imageName
{
   UIImage *image = [UIImage imageNamed:imageName];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


+ (instancetype)imageWithStretchableName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
+ (UIImage *)cleImage:(UIColor *)color
{
    CGRect rect =  CGRectMake(0.0, 0.0, 1.0, 1.0);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ref, color.CGColor);
    CGContextFillRect(ref, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
+ (UIImage*)imageWithSize:(CGSize)size borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [[UIColor clearColor] set];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGFloat lengths[] = { 3, 1 };
    CGContextSetLineDash(context, 0, lengths, 1);
    CGContextMoveToPoint(context, 0.0, 0.0);
    CGContextAddLineToPoint(context, size.width, 0.0);
    CGContextAddLineToPoint(context, size.width, size.height);
    CGContextAddLineToPoint(context, 0, size.height);
    CGContextAddLineToPoint(context, 0.0, 0.0);
    CGContextStrokePath(context);
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
+ (instancetype)imageWithIconName:(NSString *)icon borderImage:(NSString *)borderImage border:(int)border{
    //头像图片
    UIImage * image = [UIImage imageNamed:icon];
    //边框图片
    UIImage * borderImg = [UIImage imageNamed:borderImage];
    //
    CGSize size = CGSizeMake(image.size.width + border, image.size.height + border);
    
    //创建图片上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    //绘制边框的圆
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, CGRectMake(0, 0, size.width, size.height));
    
    //剪切可视范围
    CGContextClip(context);
    
    //绘制边框图片
    [borderImg drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    //设置头像frame
    CGFloat iconX = border / 2;
    CGFloat iconY = border / 2;
    CGFloat iconW = image.size.width;
    CGFloat iconH = image.size.height;
    
    //绘制圆形头像范围
    CGContextAddEllipseInRect(context, CGRectMake(iconX, iconY, iconW, iconH));
    
    //剪切可视范围
    CGContextClip(context);
    
    //绘制头像
    [image drawInRect:CGRectMake(iconX, iconY, iconW, iconH)];
    
    //取出整个图片上下文的图片
    UIImage *iconImage = UIGraphicsGetImageFromCurrentImageContext();
    
    return iconImage;
}
@end
