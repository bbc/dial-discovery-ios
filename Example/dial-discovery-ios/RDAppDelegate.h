//
//  RDAppDelegate.h
//  dial-discovery-ios
//
//  Created by ramdhany on 12/08/2016.
//  Copyright (c) 2016 ramdhany. All rights reserved.
//

@import UIKit;
#import <dial_discovery_ios/DIALServiceDiscovery.h>

@interface RDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/** A reference to a DIALServiceDiscovery component */
@property (atomic, readwrite)   DIALServiceDiscovery *tvDiscoveryComponent;

@property (strong, nonatomic) DIALDevice *myDevice;


@end
