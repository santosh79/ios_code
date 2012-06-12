//
//  HypnosisView.m
//  Hypnosister
//
//  Created by SANTOSH KUMAR on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

- (void) drawRect:(CGRect)rect {
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    CGPoint center;
    center.x = bounds.origin.x + (bounds.size.width / 2.0);
    center.y = bounds.origin.y + (bounds.size.height / 2.0);
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 4.0;
    
    CGContextSetLineWidth(ref, 10);
    CGContextSetRGBStrokeColor(ref, 0.6, 0.6, 0.6, 1.0);
    CGContextAddArc(ref, center.x, center.y, maxRadius, 0.0, M_PI * 2.0, YES);
    CGContextStrokePath(ref);
}

@end
