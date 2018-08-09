//
//  UIViewController+IMXSafeArea.h
//  IMXBaseCpt
//
//  Created by zhoupanpan on 2017/12/1.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (IMXSafeArea)
//基于Ctrl:self.view 获取安全区域，并设置本地存取功能
/**
 将当前self.view的安全区域存储至本地

 @return 并将insets返回
 */
- (UIEdgeInsets)imx_safeArea2Cache;
/**
 添加扩展的安全区域
 
 检测变动：
 UIViewController：
 - (void)viewSafeAreaInsetsDidChange;
 UIView：
 - (void)viewSafeAreaInsetsDidChange；
 
 @param insets safeArea
 */
- (void)addCustomSafeArea:(UIEdgeInsets)insets;
/**
 获取存储在本地的insets

 @return 返回
 */
- (UIEdgeInsets)imx_safeAreaFromCache;
//获取self.view除去安全区域之外的content展示区域
/**
 !!!
 注：此处仅限于非约束配置下情况
 !!!
 **/

/**
 获取self.view的内容区域

 @return retValue
 */
- (CGRect)imx_safeContent;
/**
 基于缓存，获取数据
 */
- (CGRect)imx_safeContentFromCache;

/**
 获取本地缓存的insets
（获取本地存储的安全区域，策略：先获取自身的，若不存在则获取本地的。（适用于self.view））
 */
- (CGFloat)imx_safeTopFromCache;
- (CGFloat)imx_safeBottomFromCache;
- (CGFloat)imx_safeLeftFromCache;
- (CGFloat)imx_safeRightFromCache;
@end
