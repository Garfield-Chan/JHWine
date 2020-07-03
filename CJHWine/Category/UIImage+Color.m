//
//  UIImage+Color.m
//  CJHWine
//
//  Created by Garfield on 2020/7/2.
//  Copyright © 2020 Garfield. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+ (UIImage *)jh_imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [color CGColor]);
    CGContextFillRect(ctx, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
