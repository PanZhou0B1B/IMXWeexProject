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
#import "IMXWeexRegistUtil.h"

@implementation IMXWeexManager

- (void)dealloc{
}
#pragma mark ======  public  ======
+ (void)registWeex{
    //business configuration
    [WXAppConfiguration setAppGroup:@"DHGT"];
    [WXAppConfiguration setAppName:@"DHGT"];
    [WXAppConfiguration setAppVersion:@"1.0.0"];
    
    //init sdk environment
    [WXSDKEngine initSDKEnvironment];
    
    [WXSDKEngine registerHandler:[WXImgLoaderDefaultImpl new] withProtocol:@protocol(WXImgLoaderProtocol)];
    
    [IMXWeexRegistUtil registCustomExtends];
#ifdef DEBUG
    [WXDebugTool setDebug:YES];
    [WXLog setLogLevel:WXLogLevelLog];
    
#else
    [WXDebugTool setDebug:NO];
    [WXLog setLogLevel:WXLogLevelError];
#endif
}
+ (void)registCustomModule:(NSString *)moduleName{
    Class clz = NSClassFromString(moduleName);
    if(!clz){
        return;
    }
    [WXSDKEngine registerModule:moduleName withClass:clz];
}
+ (void)registCustomComponent:(NSString *)cptName{
    Class clz = NSClassFromString(cptName);
    if(!clz){
        return;
    }
    [WXSDKEngine registerComponent:cptName withClass:clz];
}
+ (void)registCustomHandler:(NSString *)handlerName protocol:(Protocol *)proto{
    Class clz = NSClassFromString(handlerName);
    if(!clz){
        return;
    }
    [WXSDKEngine registerHandler:[clz new] withProtocol:proto];
}
#pragma mark ======  life cycle  ======

#pragma mark ======  delegate  ======

#pragma mark ======  event  ======

#pragma mark ======  private  ======

#pragma mark ======  getter & setter  ======


@end
