//
//  IMXAPPService.h
//  IMXLauncher
//
//  Created by zhoupanpan on 2017/11/7.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, IMXAppServicePriority) {
    IMXAppServicePriorityDefault = 0,
    IMXAppServicePriorityLow,
    IMXAppServicePriorityHigh,
};
typedef NS_ENUM(NSInteger, IMXAppServiceMode) {
    IMXAppServiceModeAsync = 0,
    IMXAppServiceModeSync,
};

@protocol IMXAPPService <UIApplicationDelegate>

- (NSString *)appServiceName;
- (IMXAppServicePriority)appServicePriority;
- (IMXAppServiceMode)appServiceMode;
@end
