//
//  WhereamiViewController.h
//  Whereami
//
//  Created by SANTOSH KUMAR on 5/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WhereamiViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate> {
    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
    IBOutlet UISegmentedControl *seg;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;

- (void)findLocation;
- (void)foundLocation:(CLLocation *)loc;

@end

