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

#import "IMXAPPLauncherKit.h"
#import "IMXAPPService.h"
#import "IMXAPPServiceManager.h"
#import "IMXEntryAPPDelegate.h"
#import "IMXRootUIAPPService.h"

FOUNDATION_EXPORT double IMXLauncherVersionNumber;
FOUNDATION_EXPORT const unsigned char IMXLauncherVersionString[];

