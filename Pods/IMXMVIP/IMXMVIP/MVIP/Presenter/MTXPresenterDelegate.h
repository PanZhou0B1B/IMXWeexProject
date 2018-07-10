//
//  MTXPresenterDelegate.h
//  MVIP
//
//  Created by zhoupanpan on 2017/7/20.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MTXPresenterDelegate <NSObject>
@optional
//render callback
- (void)mtx_presenter:(id)presenter loadData:(id)data;
- (void)mtx_presenter:(id)presenter loadData:(id)data extData:(id)extData extInfo:(id)info;
- (void)mtx_presenter:(id)presenter retAction:(id)data;
@end
