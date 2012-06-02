//
//  Whereami.m
//  Whereami
//
//  Created by SANTOSH KUMAR on 6/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BNRMapPoint.h"

@implementation BNRMapPoint
@synthesize coordinate = _coordinate;
@synthesize title = _title;

+ (NSString *)constructTitle:(NSString *)t {
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
    }
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    return [NSString stringWithFormat:@"%@ - created: %@", t, [dateFormatter stringFromDate:[NSDate date]]];
}

- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t {
    self = [super init];
    if (self) {
        _coordinate = c;
        _title = [BNRMapPoint constructTitle:t];
    }
    return self;
}

- (id) init {
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Hometown"];
}

- (CLLocationCoordinate2D) coordinate {
    return _coordinate;
}

@end
