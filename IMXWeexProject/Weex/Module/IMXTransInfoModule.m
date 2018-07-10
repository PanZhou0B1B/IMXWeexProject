//
//  IMXTransInfoModule.m
//  IMXWeexProject
//
//  Created by zhoupanpan on 2018/7/10.
//  Copyright © 2018年 zhoupanpan. All rights reserved.
//

#import "IMXTransInfoModule.h"

@implementation IMXTransInfoModule
@synthesize weexInstance;

WX_EXPORT_METHOD(@selector(printInfo:))
WX_EXPORT_METHOD_SYNC(@selector(printInfoSync:))

- (void)printInfo:(NSString *)info{
    NSLog(@"%@",info);
}
- (void)printInfoSync:(NSString *)info{
    NSLog(@"%@",info);
}
@end
