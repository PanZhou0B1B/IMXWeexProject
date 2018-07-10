//
//  IMXIconfont.m
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/1.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "IMXIconfont.h"
#import <CoreText/CoreText.h>

@implementation IMXIconfont

#pragma mark ======  get font  ======
+ (UIFont *)mainIconFontWithSize:(CGFloat)size {
//    NSDictionary *dic = [[NSBundle mainBundle] infoDictionary];
//    NSString *projName = dic[@"CFBundleDisplayName"];
    NSString *projName = @"iconfont";
    UIFont *font = [UIFont fontWithName:projName size:size];
    if (font == nil) {
        NSURL *fontFileUrl = [[NSBundle mainBundle] URLForResource:projName withExtension:@"ttf"];
        [self registerFontWithURL:fontFileUrl];
        font = [UIFont fontWithName:@"iconfont" size:size];
        NSAssert(font, @"UIFont object should not be nil, check if the font file is added to the application bundle and you're using the correct font name.");
    }
    return font;
    
}
#pragma mark ======  public ======
+ (NSString *)stringWithCode:(NSString *)code {
    return [self _charStringFromHexString:code];
}
+ (UILabel *)labelWithCode:(NSString *)code tintColor:(UIColor *)color fontSize:(CGFloat)size {
    UILabel *label = [[UILabel alloc] init];
    label.font = [self mainIconFontWithSize:size];
    label.textColor = color;
    label.text = [self _charStringFromHexString:code];
    return label;
}
+ (UIButton *)buttonWithCode:(NSString *)code tintColor:(UIColor *)color fontSize:(CGFloat)size {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [self mainIconFontWithSize:size];
    button.titleLabel.textColor = color;
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitle:[self _charStringFromHexString:code] forState:UIControlStateNormal];
    return button;
}
+ (UIImage *)imageWithCode:(NSString *)code tintColor:(UIColor *)color size:(CGSize)size {
    return [self imageWithCode:code tintColor:color size:size fontSize:MIN(size.width, size.height)];
}

+ (UIImage *)imageWithCode:(NSString *)code tintColor:(UIColor *)color size:(CGSize)size fontSize:(CGFloat)fontSize {
    
    UIFont *font = [self mainIconFontWithSize:fontSize];
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    NSString *iconString = [self _charStringFromHexString:code];
    [iconString drawInRect:CGRectMake(0, 0, size.width, size.height) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color}];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
#pragma mark ======  private  ======
+ (void)registerFontWithURL:(NSURL *)url {
    NSAssert([[NSFileManager defaultManager] fileExistsAtPath:[url path]], @"Font file doesn't exist");
    CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)url);
    CGFontRef newFont = CGFontCreateWithDataProvider(fontDataProvider);
    CGDataProviderRelease(fontDataProvider);
    CTFontManagerRegisterGraphicsFont(newFont, nil);
    CGFontRelease(newFont);
}
//TODO:需要优化
+ (UIFont *)iconFontWithSize:(CGFloat)size {
    NSDictionary *dic = [[NSBundle mainBundle] infoDictionary];
    NSString *projName = dic[@"CFBundleDisplayName"];
    NSString *fontName = [self fontNameCharge:projName];
    return [UIFont fontWithName:fontName size:size];
    
}
+ (NSString *)fontNameCharge:(NSString *)fontName{
    NSString *fullName = [NSString stringWithFormat:@"%@.ttf",fontName];
    
    NSDictionary *dic = [[NSBundle mainBundle] infoDictionary];
    NSArray *fonts = dic[@"UIAppFonts"];
    NSString *retName = nil;
    for(NSString *font in fonts){
        if([font isEqualToString:fullName]){
            retName = font;
            break;
        }
    }
    return retName;
}
+ (NSString *)_charStringFromHexString:(NSString *)string {
    if (![string length]) {
        return nil;
    }
    unsigned int result = 0;
    NSScanner *scanner = [NSScanner scannerWithString:string];
    
    [scanner setScanLocation:0];
    [scanner scanHexInt:&result];
    
    NSString *retString = [NSString stringWithFormat:@"%C", (unichar)result];
    return retString;
}


@end
