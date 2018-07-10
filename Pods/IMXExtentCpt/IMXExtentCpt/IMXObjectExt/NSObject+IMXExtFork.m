//
//  NSObject+IMXExtFork.m
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/31.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "NSObject+IMXExtFork.h"

@implementation NSObject (IMXExtFork)
+ (void)imx_mainTread:(void(^)(void))block
{
    if(![NSThread isMainThread])
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            block();
        });
    }
    else
    {
        block();
    }
}
@end
