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

#import "MWLogging.h"

FOUNDATION_EXPORT double simple_logger_iosVersionNumber;
FOUNDATION_EXPORT const unsigned char simple_logger_iosVersionString[];

