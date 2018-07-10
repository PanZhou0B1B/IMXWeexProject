//
//  IMXRootUIAPPService.m
//  IMXLauncher
//
//  Created by zhoupanpan on 2017/11/8.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "IMXRootUIAPPService.h"
#import "IMXAPPServiceManager.h"
@implementation IMXRootUIAPPService

// IMX_EXPORT_SERVICE(@"IMX_rootUI")

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    application.delegate.window = window;
    
    UIViewController* dvc = [[UIViewController alloc] init];
    dvc.view.backgroundColor = [UIColor whiteColor];
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:dvc];
    window.rootViewController = nav;
    [window makeKeyAndVisible];
     */
    return YES;
}
@end
