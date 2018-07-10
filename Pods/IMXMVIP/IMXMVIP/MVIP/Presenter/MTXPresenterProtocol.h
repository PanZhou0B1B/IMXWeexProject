//
//  MTXPresenterProtocol.h
//  MVIP
//
//  Created by zhoupanpan on 2017/7/20.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 目前只考虑Interactor<-->Presenter为1对1的情况
 TODO：n对1的情况
 */
@protocol MTXPresenterProtocol <NSObject>
@required
- (void)attachInteractor:(id)interactor;
- (void)detachInteractor;
@end
