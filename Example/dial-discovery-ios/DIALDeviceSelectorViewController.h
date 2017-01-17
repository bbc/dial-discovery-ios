//
//  Created by Rajiv Ramdhany on 12/12/2014.
//  Copyright (c) 2014 BBC RD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <dial_discovery_ios/DIALServiceDiscovery.h>

//------------------------------------------------------------------------------
#pragma mark - DIALDeviceSelectorViewController
//------------------------------------------------------------------------------
/**
 
 A ViewController for diplaying devices that were discovered using the DIAL protocol on the network. It creates a table view within a parent view (it automatically rezises to fit within the bounds of the parent view) and populates it with the discovered devices. It obtains the list of discovered DIAL devices from an instance
 of the DIALServiceDiscovery component.  
 
 */

@interface DIALDeviceSelectorViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

//------------------------------------------------------------------------------
#pragma mark - Properties
//------------------------------------------------------------------------------

/** A table view for discovered devices */
@property (strong, nonatomic) UITableView *devicesTableView;

/** The table view's parent view */
@property (weak, nonatomic) UIView *parentView;


/** A title for this view */
@property (strong, nonatomic, setter=setTitleString:) NSString *titleString;


@property (strong, nonatomic) NSString *segueIdentifier;

//------------------------------------------------------------------------------





@end
