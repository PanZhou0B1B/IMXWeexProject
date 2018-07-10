//
//  IMXLineView.h
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/14.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IMXLineView : UIView

@property (nonatomic, assign)BOOL isDotted;
@property (nonatomic, strong)UIColor *lineColor;
@end


@interface UIView (IMXLineView)

- (NSArray *)addLinesForEdge:(UIRectEdge)edge;

@end
