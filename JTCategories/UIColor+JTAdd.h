//
//  UIColor+JTAdd.h
//  JTKit
//
//  Created by YS-160408B on 17/1/19.
//  Copyright © 2017年 xia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (JTAdd)

+ (nullable UIColor *)colorWithHex:(uint32_t)hexColor;
+ (nullable UIColor *)colorWithHex:(uint32_t)hexColor alpha:(CGFloat)alpha;

+ (nullable UIColor *)colorWithHexString:(NSString *)hexStr;
+ (nullable UIColor *)colorWithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
