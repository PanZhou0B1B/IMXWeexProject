//
//  UIImage+IMXExtFork.h
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/9/14.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (IMXExtFork)
+ (UIImage *)imx_imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)imx_stretchedImageFromOriginal:(UIImage *)original capInsets:(UIEdgeInsets)capInsets;
+ (UIImage *)imx_stretchedImageFromOriginal:(UIImage *)original capInsets:(UIEdgeInsets)capInsets resizeMode:(UIImageResizingMode)resizingMode;
//压缩图片
+ (NSData *)imx_compressImage:(UIImage *)img ToSize:(NSInteger)intSize;
@end
