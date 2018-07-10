//
//  MTXBaseInteractor.m
//  MVIP
//
//  Created by zhoupanpan on 2017/7/20.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "MTXBaseInteractor.h"

@interface MTXBaseInteractor ()

@end
@implementation MTXBaseInteractor
- (void)attachView:(id)view{
    self.mtx_view = view;
}
- (void)detachView{
    self.mtx_view = nil;
}
@end
