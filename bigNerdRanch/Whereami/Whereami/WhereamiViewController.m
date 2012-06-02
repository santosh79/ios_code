//
//  WhereamiViewController.m
//  Whereami
//
//  Created by SANTOSH KUMAR on 5/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WhereamiViewController.h"
#import "BNRMapPoint.h"
@interface WhereamiViewController ()

@end

@implementation WhereamiViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [locationManager setDistanceFilter:50];
        [worldView setDelegate:self];
    }
    return self;
}

- (void) satTypeChanged:(id)sender {
    NSString *satType = [[NSArray arrayWithObjects:@"standard", @"satellite", @"hybrid", nil] objectAtIndex:[seg selectedSegmentIndex]];
    if ([satType isEqualToString:@"standard"]) {
        [worldView setMapType:MKMapTypeStandard];
    } else if ([satType isEqualToString:@"satellite"]) {
        [worldView setMapType:MKMapTypeSatellite];
    } else {
        [worldView setMapType:MKMapTypeHybrid];
    }
}

- (void) viewDidLoad {
    [worldView setShowsUserLocation:YES];
    [seg addTarget:self action:@selector(satTypeChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];  
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    if (t < -180) {
        return;
    }
    [self foundLocation:newLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    NSLog(@"%@", newHeading);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Could not find location %@", error);
}

- (void)findLocation {
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

- (void)foundLocation:(CLLocation *)loc {
    CLLocationCoordinate2D loc2d = [loc coordinate];
    BNRMapPoint *p = [[BNRMapPoint alloc] initWithCoordinate:loc2d title:[locationTitleField text]];
    [worldView addAnnotation:p];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc2d, 250, 250);
    [worldView setRegion:region animated:YES];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self findLocation];
    [textField resignFirstResponder];
    return YES;
}

- (void)dealloc {
    [locationManager setDelegate:nil];
}

@end
