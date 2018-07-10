//
//  IMXWeexManager.m
//  IMXWeexProject
//
//  Created by zhoupanpan on 2018/6/13.
//  Copyright © 2018年 zhoupanpan. All rights reserved.
//

#import "IMXWeexManager.h"
#import <WeexSDK/WeexSDK.h>
#import "WXImgLoaderDefaultImpl.h"

@implementation IMXWeexManager

+ (void)registWeex{
    //business configuration
    [WXAppConfiguration setAppGroup:@"weexDemo"];
    [WXAppConfiguration setAppName:@"WeexDemo"];
    [WXAppConfiguration setAppVersion:@"1.0.0"];
    
    //init sdk environment
    [WXSDKEngine initSDKEnvironment];
    
    //register custom module and component，optional
//    [WXSDKEngine registerComponent:@"MyView" withClass:[MyViewComponent class]];
//    [WXSDKEngine registerModule:@"event" withClass:[WXEventModule class]];
    
    //register the implementation of protocol, optional
    //[WXSDKEngine registerHandler:[WXNavigationDefaultImpl new] withProtocol:@protocol(WXNavigationProtocol)];
    [WXSDKEngine registerHandler:[WXImgLoaderDefaultImpl new] withProtocol:@protocol(WXImgLoaderProtocol)];

#ifdef DEBUG
    [WXDebugTool setDebug:YES];
    [WXLog setLogLevel:WXLogLevelLog];
    
#else
    [WXDebugTool setDebug:NO];
    [WXLog setLogLevel:WXLogLevelError];
#endif
}
- (void)initConfig{
    
}
@end
