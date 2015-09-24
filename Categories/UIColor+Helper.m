//
//  UIColor+Helper.m
//  
//
//  Created by hustlzp on 15/8/17.
//
//

#import "UIColor+Helper.h"

@implementation UIColor (Helper)

+ (UIColor *)colorWithRGBA:(NSUInteger)color
{
    return [UIColor colorWithRed:((color >> 24) & 0xFF) / 255.0f
                           green:((color >> 16) & 0xFF) / 255.0f
                            blue:((color >> 8) & 0xFF) / 255.0f
                           alpha:((color) & 0xFF) / 255.0f];
}

+ (UIColor *)ConstantColor
{
    return [self colorWithRGBA:0xEEEEEEFF];
}

@end
