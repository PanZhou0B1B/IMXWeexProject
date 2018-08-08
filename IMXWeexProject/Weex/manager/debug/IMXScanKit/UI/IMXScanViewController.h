//
//  IMXScanViewController.h
//  IMXScanDemo
//
//  Created by zhoupanpan on 2018/8/1.
//  Copyright © 2018年 zhoupanpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IMXScanViewController : UIViewController
@property (nonatomic, copy) void(^result)(NSString *info);
@end
