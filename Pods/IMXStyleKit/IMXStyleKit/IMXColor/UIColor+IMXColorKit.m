//
//  UIColor+IMXColorKit.m
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/1.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "UIColor+IMXColorKit.h"

@implementation UIColor (IMXColorKit)
+ (UIColor *)imxColorWithHex:(int)rgb {
    return [UIColor imxColorWithHex:rgb alpha:1.0];
}

+ (UIColor *)imxColorWithHex:(int)rgb alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((rgb & 0xFF0000) >> 16) / 255.0f
                           green:((rgb & 0xFF00) >> 8) / 255.0f
                            blue:((rgb & 0xFF)) / 255.0f
                           alpha:alpha];
}
+ (UIColor *)imxColorWithR:(CGFloat)red G:(CGFloat)green  B:(CGFloat)blue  A:(CGFloat)alpha
{
    CGFloat redF    = red/255.0;
    CGFloat greenF    = green/255.0;
    CGFloat blueF    = blue/255.0;
    CGFloat alphaF    = alpha/1.0;
    return [UIColor colorWithRed:redF green:greenF blue:blueF alpha:alphaF];
}
+ (UIColor *)imxRandomColor{
    return [UIColor colorWithRed:(random() % 256) / 255.0
                           green:(random() % 256) / 255.0
                            blue:(random() % 256) / 255.0
                           alpha:1.0];

}
@end
