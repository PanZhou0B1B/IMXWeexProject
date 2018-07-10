//
//  UIView+IMXFrameFork.m
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/1.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "UIView+IMXFrameFork.h"

@implementation UIView (IMXFrameFork)

- (CGPoint)imxOrigin {
    return self.frame.origin;
}
- (void)setImxOrigin:(CGPoint)imxOrigin {
    CGRect frame = self.frame;
    frame.origin = imxOrigin;
    self.frame = frame;
}

- (CGSize)imxSize {
    return self.frame.size;
}
- (void)setImxSize:(CGSize)imxSize {
    CGRect frame = self.frame;
    frame.size = imxSize;
    self.frame = frame;
}

//width,height
- (CGFloat)imxWidth {
    return self.frame.size.width;
}
- (void)setImxWidth:(CGFloat)imxWidth {
    CGRect frame = self.frame;
    frame.size.width = imxWidth;
    self.frame = frame;
}

- (CGFloat)imxHeight {
    return self.frame.size.height;
}
- (void)setImxHeight:(CGFloat)imxHeight{
    if(imxHeight == self.imxHeight){
        return;
    }
    
    CGRect frame = self.frame;
    frame.size.height = imxHeight;
    self.frame = frame;
}

//x,y
- (CGFloat)imxLeft {
    return self.frame.origin.x;
}
- (void)setImxLeft:(CGFloat)imxLeft {
    CGRect frame = self.frame;
    frame.origin.x = imxLeft;
    self.frame = frame;
}
- (CGFloat)imxTop {
    return self.frame.origin.y;
}
- (void)setImxTop:(CGFloat)imxTop {
    CGRect frame = self.frame;
    frame.origin.y = imxTop;
    self.frame = frame;
}

- (CGFloat)imxRight {
    return self.imxLeft + self.imxWidth;
}
- (void)setImxRight:(CGFloat)imxRight {
    if(imxRight == self.imxRight){
        return;
    }
    CGRect frame = self.frame;
    frame.origin.x = imxRight - frame.size.width;
    self.frame = frame;
}
- (CGFloat)imxBottom {
    return self.imxTop + self.imxHeight;
}
- (void)setImxBottom:(CGFloat)imxBottom{
    if(imxBottom == self.imxBottom){
        return;
    }
    
    CGRect frame = self.frame;
    frame.origin.y = imxBottom - frame.size.height;
    self.frame = frame;
}
//center
- (CGFloat)imxCenterX {
    return self.center.x;
}
- (void)setImxCenterX:(CGFloat)imxCenterX {
    self.center = CGPointMake(imxCenterX, self.center.y);
}

- (CGFloat)imxCenterY {
    return self.center.y;
}
- (void)setImxCenterY:(CGFloat)imxCenterY {
    self.center = CGPointMake(self.center.x, imxCenterY);
}
@end
