//
//  IMXWRootUIAPPService.m
//  IMXWeexProject
//
//  Created by zhoupanpan on 2018/6/13.
//  Copyright © 2018年 zhoupanpan. All rights reserved.
//

#import "IMXWRootUIAPPService.h"
#import "IMXWRootViewController.h"

@interface IMXWRootUIAPPService()
@property (nonatomic,strong)IMXWRootViewController *rootCtrl;
@property (nonatomic,strong)UINavigationController *rootNavi;
@end

@implementation IMXWRootUIAPPService

IMX_EXPORT_SERVICE(@"IMX_rootUI")

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
     UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
     application.delegate.window = window;
     
    self.rootCtrl = [[IMXWRootViewController alloc] init];
    self.rootNavi = [[UINavigationController alloc] initWithRootViewController:self.rootCtrl];
    application.delegate.window.rootViewController = self.rootNavi;
    
     [window makeKeyAndVisible];
    
     
    return YES;
}

@end
