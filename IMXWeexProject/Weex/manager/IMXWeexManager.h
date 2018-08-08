//
//  IMXWeexManager.h
//  IMXWeexProject
//
//  Created by zhoupanpan on 2018/6/13.
//  Copyright © 2018年 zhoupanpan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMXWeexManager : NSObject
+ (void)registWeex;
+ (void)registCustomModule:(NSString *)moduleName;
+ (void)registCustomComponent:(NSString *)cptName;
+ (void)registCustomHandler:(NSString *)handlerName protocol:(Protocol *)proto;
@end
