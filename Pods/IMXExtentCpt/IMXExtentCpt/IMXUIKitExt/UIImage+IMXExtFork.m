//
//  UIImage+IMXExtFork.m
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/9/14.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "UIImage+IMXExtFork.h"

@implementation UIImage (IMXExtFork)
+ (UIImage *)imx_imageWithColor:(UIColor *)color size:(CGSize)size{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, size.width, size.height, 8, 4 * size.width, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    UIImage *image = [UIImage imageWithCGImage:imageMasked];
    CGImageRelease(imageMasked);
    return image;
}
+ (UIImage *)imx_stretchedImageFromOriginal:(UIImage *)original capInsets:(UIEdgeInsets)capInsets{
    UIImage *img = [self imx_stretchedImageFromOriginal:original capInsets:capInsets resizeMode:UIImageResizingModeStretch];
    return img;
}
+ (UIImage *)imx_stretchedImageFromOriginal:(UIImage *)original capInsets:(UIEdgeInsets)capInsets resizeMode:(UIImageResizingMode)resizingMode{
    UIImage *img = [original resizableImageWithCapInsets:capInsets resizingMode:resizingMode];
    return img;
}
+ (NSData *)imx_compressImage:(UIImage *)img ToSize:(NSInteger)intSize{
    if (img == nil || ![img isKindOfClass:[UIImage class]]) {
        return nil;
    }
    
    NSData * imageData = UIImageJPEGRepresentation(img,1);
    /// 最终要求的大小和目前大小的比
    double fltBeiShu = [imageData length]/1024.00/intSize;
    
    if (fltBeiShu <1) {
        return imageData;
    }
    /// 压缩的次数
    NSInteger intCount = 0;
    while (fltBeiShu > 1) {
        /// 这次压缩的倍数
        imageData = UIImageJPEGRepresentation(img,1);
        fltBeiShu = [imageData length]/1024.00/intSize;
        CGFloat fltBei = 1.0;
        
        for (int a = 0; a<fltBeiShu+intCount; a++) {
            fltBei = fltBei * 0.9;
        }
        /// 这次压缩的倍数
        fltBeiShu = fltBei;
        NSLog(@"系数:%lf",fltBeiShu);
        
        imageData = UIImageJPEGRepresentation(img,fltBeiShu);
        intCount ++;
        /// 跟新要求的大小和目前大小的比
        fltBeiShu = [imageData length]/(intSize * 1024.00);
        NSLog(@"%lf",[imageData length]/1024.00);
        NSLog(@"%lu第%ld次压缩，压缩后的大小%f",(unsigned long)[imageData length],(long)intCount,fltBeiShu);
        
        /// 压缩次数超过四次就压缩到到最大压缩限度
        if (intCount >4) {
            imageData = UIImageJPEGRepresentation(img,0.005);
            return imageData;
        }
    }
    
    return imageData;
}
@end
