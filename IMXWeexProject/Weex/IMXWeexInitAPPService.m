//
//  IMXWeexInitAPPService.m
//  IMXWeexProject
//
//  Created by zhoupanpan on 2018/6/13.
//  Copyright © 2018年 zhoupanpan. All rights reserved.
//

#import "IMXWeexInitAPPService.h"
#import "IMXWeexManager.h"

@implementation IMXWeexInitAPPService
IMX_EXPORT_SERVICE(@"IMX_weexinit")

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [IMXWeexManager registWeex];
    
    [IMXWeexManager registCustomModule:@"IMXTransInfoModule"];
    [IMXWeexManager registCustomComponent:@"IMXCustomComponent"];
    return YES;
}
@end
