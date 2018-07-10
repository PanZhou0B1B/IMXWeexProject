//
//  NSObject+IMXExtFork.h
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/31.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (IMXExtFork)
+ (void)imx_mainTread:(void(^)(void))block;
@end
