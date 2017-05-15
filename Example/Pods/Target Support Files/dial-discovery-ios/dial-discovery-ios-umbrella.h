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

#import "DeviceDescription.h"
#import "DIALDevice.h"
#import "DIALDeviceDiscoveryTask.h"
#import "DIALDeviceDiscoveryTaskDelegate.h"
#import "DIALGlobals.h"
#import "DIALServiceDiscovery.h"
#import "SSDPService.h"
#import "SSDPServiceDiscovery.h"
#import "SSDPServiceTypes.h"
#import "utils.h"

FOUNDATION_EXPORT double dial_discovery_iosVersionNumber;
FOUNDATION_EXPORT const unsigned char dial_discovery_iosVersionString[];

