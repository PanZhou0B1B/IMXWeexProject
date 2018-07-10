//
//  IMXBaseTableViewCell.h
//  IMXBaseCpt
//
//  Created by zhoupanpan on 2017/12/4.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IMXBaseTableViewCell : UITableViewCell
+ (NSString *)IMXReuseID;

- (void)showTopLine:(UIEdgeInsets)insets;
- (void)hideTopLine;
- (void)showBottomLine:(UIEdgeInsets)insets;
- (void)hideBottomLine;

- (CGFloat)singleCellHeight;
+ (CGFloat)cellHeight;
@end
