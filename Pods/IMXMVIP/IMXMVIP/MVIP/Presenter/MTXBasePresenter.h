//
//  MTXBasePresenter.h
//  MVIP
//
//  Created by zhoupanpan on 2017/7/20.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTXPresenterProtocol.h"
@interface MTXBasePresenter : NSObject<MTXPresenterProtocol>
@property (nonatomic,weak)id mtx_interactor;//具体的I,不可通过该类改动
@end
