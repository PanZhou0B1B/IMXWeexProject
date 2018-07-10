//
//  MTXBasePresenter.m
//  MVIP
//
//  Created by zhoupanpan on 2017/7/20.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "MTXBasePresenter.h"

@implementation MTXBasePresenter
- (void)attachInteractor:(id)interactor{
    self.mtx_interactor = interactor;
}
- (void)detachInteractor{
    self.mtx_interactor = nil;
}
@end
