#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "IMXMVIP.h"
#import "MTXBaseInteractor.h"
#import "MTXInteractorProtocol.h"
#import "MTXBasePresenter.h"
#import "MTXPresenterDelegate.h"
#import "MTXPresenterProtocol.h"

FOUNDATION_EXPORT double IMXMVIPVersionNumber;
FOUNDATION_EXPORT const unsigned char IMXMVIPVersionString[];

