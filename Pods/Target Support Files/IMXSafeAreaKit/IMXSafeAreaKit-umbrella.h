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

#import "IMXSafeAreaKit.h"
#import "UIView+IMXSafeArea.h"
#import "UIViewController+IMXSafeArea.h"

FOUNDATION_EXPORT double IMXSafeAreaKitVersionNumber;
FOUNDATION_EXPORT const unsigned char IMXSafeAreaKitVersionString[];

