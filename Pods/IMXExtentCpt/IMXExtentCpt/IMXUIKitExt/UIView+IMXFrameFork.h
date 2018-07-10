//
//  UIView+IMXFrameFork.h
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/1.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (IMXFrameFork)

@property (nonatomic) CGFloat imxLeft;
@property (nonatomic) CGFloat imxTop;
@property (nonatomic) CGFloat imxRight;
@property (nonatomic) CGFloat imxBottom;
@property (nonatomic) CGFloat imxWidth;
@property (nonatomic) CGFloat imxHeight;
@property (nonatomic) CGPoint imxOrigin;
@property (nonatomic) CGSize imxSize;
@property (nonatomic) CGFloat imxCenterX;
@property (nonatomic) CGFloat imxCenterY;

@end
