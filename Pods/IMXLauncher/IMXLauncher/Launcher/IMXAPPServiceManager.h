//
//  IMXAPPServiceManage.h
//  IMXLauncher
//
//  Created by zhoupanpan on 2017/11/7.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMXAPPService.h"

#define IMX_EXPORT_SERVICE_FULL(name,priority,mode) \
+ (void)load {[[IMXAPPServiceManager sharedInstance] registerService:[self new]];} \
- (NSString *)appServiceName { return @#name; }\
- (IMXAppServicePriority)appServicePriority { return priority;  }\
- (IMXAppServiceMode)appServiceMode { return mode; }

#define IMX_EXPORT_SERVICE(name) \
IMX_EXPORT_SERVICE_FULL(name,IMXAppServicePriorityDefault,IMXAppServiceModeSync)
#define IMX_EXPORT_SERVICE_High(name) \
IMX_EXPORT_SERVICE_FULL(name,IMXAppServicePriorityHigh,IMXAppServiceModeSync)
#define IMX_EXPORT_SERVICE_Low(name) \
IMX_EXPORT_SERVICE_FULL(name,IMXAppServicePriorityLow,IMXAppServiceModeSync)

NS_ASSUME_NONNULL_BEGIN

@interface IMXAPPServiceManager : NSObject
+ (IMXAPPServiceManager *)sharedInstance;
- (void)registerService:(id<IMXAPPService>)service;
- (id<IMXAPPService>)serviceForName:(NSString *)serviceName;

- (BOOL)proxyCanResponseToSelector:(SEL)aSelector;
- (void)proxyForwardInvocation:(NSInvocation *)anInvocation;

@end
NS_ASSUME_NONNULL_END
