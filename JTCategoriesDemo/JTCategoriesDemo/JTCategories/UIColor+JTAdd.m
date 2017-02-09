//
//  UIColor+JTAdd.m
//  JTKit
//
//  Created by YS-160408B on 17/1/19.
//  Copyright © 2017年 xia. All rights reserved.
//

#import "UIColor+JTAdd.h"

@implementation UIColor (JTAdd)

+ (UIColor *)colorWithHex:(uint32_t)hexColor {
    return [self colorWithHex:hexColor alpha:1.0];
}

+ (UIColor *)colorWithHex:(uint32_t)hexColor alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((hexColor & 0xFF0000) >> 16) / 255.0f
                           green:((hexColor & 0xFF00) >> 8) / 255.0f
                            blue:(hexColor & 0xFF) / 255.0f
                           alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)hexStr {
    return [self colorWithHexString:hexStr alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)hexStr alpha:(CGFloat)alpha {
    
    hexStr = [hexStr uppercaseString];
    
    if([hexStr hasPrefix:@"#"]) {
        hexStr = [hexStr substringFromIndex:1];
    }else if([hexStr hasPrefix:@"0X"]) {
        hexStr = [hexStr substringFromIndex:2];
    }
    
    NSUInteger length = [hexStr length];
    
    if (length != 3 && length != 4 && length != 6 && length != 8) {
        return nil;
    }
    
    CGFloat red = 0.0;
    CGFloat green = 0.0;
    CGFloat blue = 0.0;
    if(length < 5) {
        red = [self scannerWithString:[hexStr substringWithRange:NSMakeRange(0, 1)]] / 255.0f;
        green = [self scannerWithString:[hexStr substringWithRange:NSMakeRange(1, 1)]] / 255.0f;
        blue = [self scannerWithString:[hexStr substringWithRange:NSMakeRange(2, 1)]] / 255.0f;
        if (length == 4) {
            alpha = [self scannerWithString:[hexStr substringWithRange:NSMakeRange(3, 1)]] / 255.0f;
        }
    }else {
        red = [self scannerWithString:[hexStr substringWithRange:NSMakeRange(0, 2)]] / 255.0f;
        green = [self scannerWithString:[hexStr substringWithRange:NSMakeRange(2, 2)]] / 255.0f;
        blue = [self scannerWithString:[hexStr substringWithRange:NSMakeRange(4, 2)]] / 255.0f;
        if (length == 8) {
            alpha = [self scannerWithString:[hexStr substringWithRange:NSMakeRange(6, 2)]] / 255.0f;
        }
    }
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (unsigned)scannerWithString:(NSString *)str {
    unsigned result;
    if ([[NSScanner scannerWithString:str] scanHexInt:&result]) {
        return result;
    }
    return 0;
}

@end
