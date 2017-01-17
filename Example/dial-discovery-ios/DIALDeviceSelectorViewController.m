//
//  TVSelectorViewController.m
//  TVCompanion
//
//  Created by Rajiv Ramdhany on 12/12/2014.
//  Copyright (c) 2014 BBC RD. All rights reserved.
//

#import "DIALDeviceSelectorViewController.h"
#import "DIALDeviceViewConstants.h"
#import <simple_logger_ios/MWLogging.h>
#import "RDAppDelegate.h"


//------------------------------------------------------------------------------
#pragma mark - DIALDeviceSelectorViewController (Interface Extension)
//------------------------------------------------------------------------------

@interface DIALDeviceSelectorViewController()
{
    
}


@end


//------------------------------------------------------------------------------
#pragma mark - DIALDeviceSelectorViewController implementation
//------------------------------------------------------------------------------

@implementation DIALDeviceSelectorViewController
{
    DIALServiceDiscovery    *dialclient;
    RDAppDelegate           *appDelegate;
  
}

@synthesize devicesTableView = _devicesTableView;
@synthesize parentView = _parentView;
@synthesize titleString = _titleString;
@synthesize segueIdentifier = _segueIdentifier;



//------------------------------------------------------------------------------
#pragma mark - Init, lifecycle methods
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//------------------------------------------------------------------------------
#pragma mark - Setters and Getters
//------------------------------------------------------------------------------

- (void) setTitleString:(NSString *)str
{
    self.titleString = [str copy];
    self.title = self.titleString;
}

//------------------------------------------------------------------------------
#pragma mark - UIViewController methods
//------------------------------------------------------------------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate =  (RDAppDelegate*)[[UIApplication sharedApplication] delegate];
    
    dialclient = appDelegate.tvDiscoveryComponent;
    
    _parentView = self.view;
    self.title = @"TV";
   
    _devicesTableView = [[UITableView alloc] initWithFrame:CGRectMake(_parentView.frame.origin.x, _parentView.frame.origin.y, _parentView.frame.size.width, _parentView.frame.size.height) style:UITableViewStylePlain];
    // customise appearance
    
    
    _devicesTableView.delegate = self;
    _devicesTableView.dataSource = self;
    
    _devicesTableView.backgroundColor = [UIColor colorWithRed:0.11 green:0.11 blue:0.11 alpha:1.0];
    
    [self.view addSubview:_devicesTableView];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tableTapped:)];
    [self.devicesTableView addGestureRecognizer:tap];
    
    // subscribe to events from device discovery component
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DIALServiceDiscoveryNotifcationReceived:) name:kNewDIALDeviceDiscoveryNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DIALServiceDiscoveryNotifcationReceived:) name:kDIALDeviceExpiryNotification object:nil];
    
  
}

//------------------------------------------------------------------------------

- (void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    
}

//------------------------------------------------------------------------------


- (void) viewDidDisappear:(BOOL)animated
{
    
    // remove observer for notifications from DIALDiscovery component
    [[NSNotificationCenter defaultCenter]removeObserver:self name:kNewDIALDeviceDiscoveryNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:kDIALDeviceExpiryNotification object:nil];

    
}

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
#pragma mark - UITapGestureRecognizer callback method
//------------------------------------------------------------------------------

/**
 On tap, select the row tapped
 */
- (void)tableTapped:(UITapGestureRecognizer *)tap
{
    CGPoint location = [tap locationInView:_devicesTableView];
    NSIndexPath *path = [_devicesTableView indexPathForRowAtPoint:location];
    
    if(path)
    {
        // tap was on existing row, so pass it to the delegate method
        [self tableView:_devicesTableView didSelectRowAtIndexPath:path];
    }
    else
    {
        // don't do anything
    }
}

//------------------------------------------------------------------------------
#pragma mark - Notification handlers
//------------------------------------------------------------------------------

/**
 
 Handle RefreshDiscoveredDevicesNotification notification
 
 */
- (void) RefreshDiscoveredDevicesNotificationReceived: (NSNotification*) aNotification
{
    
    [_devicesTableView reloadData];
    
}

//------------------------------------------------------------------------------

/**
 Handle a received DIALServiceDiscoveryNotifcation
 */
- (void) DIALServiceDiscoveryNotifcationReceived: (NSNotification*) aNotification
{
    
    [_devicesTableView reloadData];
    
    
}

//------------------------------------------------------------------------------



//------------------------------------------------------------------------------
#pragma mark - TableView Delegate Methods
//------------------------------------------------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return [dialclient.devices count];
    
}

//------------------------------------------------------------------------------

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    static NSString *deviceTableIdentifier = @"DeviceTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:deviceTableIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:deviceTableIdentifier];
        
    }
    
    DIALDevice* device = [dialclient.devices objectAtIndex:indexPath.row];
    cell.backgroundColor  = [UIColor colorWithRed:0.11 green:0.11 blue:0.11 alpha:1.0];
    cell.textLabel.text =  device.friendlyName;
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    cell.imageView.image = [UIImage imageNamed:@"tv_white_64x64.png"];
    [cell setBackgroundColor:[UIColor clearColor]];
    return cell;
    
}

//------------------------------------------------------------------------------

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    appDelegate.myDevice = [[dialclient.devices objectAtIndex:indexPath.row]copyWithZone:nil];
    
    MWLogDebug(@"%@ master device selected", appDelegate.myDevice.friendlyName);
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    
    [dict setValue:appDelegate.myDevice forKey:kNewDIAL_HbbTV_ServiceSelected];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNewDIAL_HbbTV_ServiceSelected object:nil userInfo:dict];
    
    
    //[self performSegueWithIdentifier:_segueIdentifier sender:self];
    
    
    NSString* devStr = [appDelegate.myDevice description];
    
    
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"You selected"
                                                                   message:devStr
                                                            preferredStyle:UIAlertControllerStyleActionSheet]; // 1
    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"OK"
                                                          style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                              NSLog(@"You pressed OK button");
                                                          }]; // 2
    
    [alert addAction:firstAction]; // 4
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

//------------------------------------------------------------------------------



//------------------------------------------------------------------------------
#pragma mark - Other methods
//------------------------------------------------------------------------------



//------------------------------------------------------------------------------

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    
    
    
    
    
}






@end
