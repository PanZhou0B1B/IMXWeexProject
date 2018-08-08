//
//  IMXScanUtil.h
//  IMXScanDemo
//
//  Created by zhoupanpan on 2018/8/1.
//  Copyright © 2018年 zhoupanpan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define IMX_SCAN_SCREEN_HEIGHT                              [[UIScreen mainScreen] bounds].size.height
#define IMX_SCAN_SCREEN_WIDTH                                [[UIScreen mainScreen] bounds].size.width

@interface IMXScanUtil : NSObject
+ (void)cameraStatusCheck:(void(^)(void))handler;
+ (void)libraryStatusCheck:(void(^)(void))handler;
@end
