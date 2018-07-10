//
//  UIFont+IMXFontKit.m
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/15.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "UIFont+IMXFontKit.h"

#define imxfont_ios_version ([[UIDevice currentDevice] systemVersion].floatValue)
#undef imxfont_iOS_version_equal_later
#define imxfont_iOS_version_equal_later(_version) \
(imxfont_ios_version >= [@ #_version floatValue])

@implementation UIFont (IMXFontKit)

#pragma mark ======  font size  ======
+ (CGFloat)imx_fontSize_T1 {
    return 20.0f;
}
+ (CGFloat)imx_fontSize_T2 {
    return 18.0f;
}
+ (CGFloat)imx_fontSize_T3 {
    return 16.0f;
}
+ (CGFloat)imx_fontSize_T4 {
    return 14.0f;
}
+ (CGFloat)imx_fontSize_T5 {
    return 12.0f;
}
+ (CGFloat)imx_fontSize_T6 {
    return 10.0f;
}
+ (CGFloat)imx_fontSize_T7 {
    return 8;
}
#pragma mark ======  system font  ======
+ (UIFont *)imx_font_T1 {
    return [UIFont systemFontOfSize:[self imx_fontSize_T1]];
}
+ (UIFont *)imx_font_T2 {
    return [UIFont systemFontOfSize:[self imx_fontSize_T2]];
}
+ (UIFont *)imx_font_T3 {
    return [UIFont systemFontOfSize:[self imx_fontSize_T3]];
}
+ (UIFont *)imx_font_T4 {
    return [UIFont systemFontOfSize:[self imx_fontSize_T4]];
}
+ (UIFont *)imx_font_T5 {
    return [UIFont systemFontOfSize:[self imx_fontSize_T5]];
}
+ (UIFont *)imx_font_T6 {
    return [UIFont systemFontOfSize:[self imx_fontSize_T6]];
}
+ (UIFont *)imx_font_T7 {
    return [UIFont systemFontOfSize:[self imx_fontSize_T7]];
}
+ (UIFont *)imx_font:(CGFloat)size {
    return [UIFont systemFontOfSize:size];
}
#pragma mark ======  system bold font  ======
+ (UIFont *)imx_boldFont_T1 {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability"
    if (imxfont_iOS_version_equal_later(8.2)) {
        return [UIFont systemFontOfSize:[self imx_fontSize_T1] weight:UIFontWeightMedium];
    } else {
        return [UIFont boldSystemFontOfSize:[self imx_fontSize_T1]];
    }
#pragma clang diagnostic pop
}
+ (UIFont *)imx_boldFont_T2 {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability"
    if (imxfont_iOS_version_equal_later(8.2)) {
        return [UIFont systemFontOfSize:[self imx_fontSize_T2] weight:UIFontWeightMedium];
    } else {
        return [UIFont boldSystemFontOfSize:[self imx_fontSize_T2]];
    }
#pragma clang diagnostic pop
}
+ (UIFont *)imx_boldFont:(CGFloat)size {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability"
    if (imxfont_iOS_version_equal_later(8.2)) {
        return [UIFont systemFontOfSize:size weight:UIFontWeightMedium];
    } else {
        return [UIFont boldSystemFontOfSize:size];
    }
#pragma clang diagnostic pop
}
#pragma mark ======  system thin font  ======
+ (UIFont *)imx_thinFont_T1 {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability"
    if (imxfont_iOS_version_equal_later(8.2)) {
        return [UIFont systemFontOfSize:[self imx_fontSize_T1] weight:UIFontWeightThin];
    } else {
        return [UIFont fontWithName:@"HelveticaNeue-Thin" size:[self imx_fontSize_T1]];
    }
#pragma clang diagnostic pop
}
+ (UIFont *)imx_thinFont:(CGFloat)size {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability"
    if (imxfont_iOS_version_equal_later(8.2)) {
        return [UIFont systemFontOfSize:size weight:UIFontWeightThin];
    } else {
        return [UIFont fontWithName:@"HelveticaNeue-Thin" size:size];
    }
#pragma clang diagnostic pop
}
#pragma mark ======  helveticaNeue font  ======
+ (UIFont *)imx_helNeueFont:(CGFloat)size {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability"
    return [self fontWithName:@"HelveticaNeue" size:size];
    if (imxfont_iOS_version_equal_later(8.2)) {
        return [UIFont systemFontOfSize:size weight:UIFontWeightThin];
    } else {
        return [UIFont fontWithName:@"HelveticaNeue-Thin" size:size];
    }
#pragma clang diagnostic pop
}
+ (UIFont *)imx_boldHelNeueFont:(CGFloat)size {
    
    return [self fontWithName:@"HelveticaNeue-Bold" size:size];
}
+ (UIFont *)imx_thinHelNeueFont:(CGFloat)size {
    
    return [self fontWithName:@"HelveticaNeue-Thin" size:size];
}
#pragma mark ======  original  ======
+ (UIFont *)imx_fontWithName:(NSString *)name size:(CGFloat)size{
    return [UIFont fontWithName:name size:size];
}
@end
