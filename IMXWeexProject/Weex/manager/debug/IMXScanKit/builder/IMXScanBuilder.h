//
//  IMXScanBuilder.h
//  IMXScanDemo
//
//  Created by zhoupanpan on 2018/8/1.
//  Copyright © 2018年 zhoupanpan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol IMXScanBuilderDelegate<NSObject>
@required

@optional
- (CGRect)scanFocusRect;
@end
@interface IMXScanBuilder : NSObject
@property (nonatomic,weak)id<IMXScanBuilderDelegate> delegate;
@property (nonatomic, copy) void(^scanResult)(NSString *info);

- (void)scanSettings:(UIView *)baseView;
- (void)startScanning;
- (void)stopScanning;
@end
