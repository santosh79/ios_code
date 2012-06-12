//
//  HypnosisView.m
//  Hypnosister
//
//  Created by SANTOSH KUMAR on 6/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView
@synthesize circleColor = _circleColor;

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColor:[UIColor lightGrayColor]];
    }
    return self;
}

- (BOOL) canBecomeFirstResponder {
    return YES;
}

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        NSArray * colors = [NSArray arrayWithObjects:[UIColor blueColor], [UIColor brownColor], [UIColor redColor], [UIColor blackColor], [UIColor greenColor], [UIColor orangeColor], nil];
        UIColor *nextColor = [colors objectAtIndex:(rand() % (colors.count - 1))];
        while (nextColor == self.circleColor) {
            nextColor = [colors objectAtIndex:(rand() % (colors.count - 1))];
        }
        self.circleColor = nextColor;
        [self setCircleColor:self.circleColor];
        [self setNeedsDisplay];        
    }
}

- (void) drawRect:(CGRect)rect {
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    CGContextSetLineWidth(ref, 10);
    [[self circleColor] setStroke];

    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        CGContextAddArc(ref, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        CGContextStrokePath(ref);
    }
    
    
    NSString *text = @"You are getting sleepy.";
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    CGRect textRect;
    textRect.size = [text sizeWithFont:font];
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    [[UIColor blackColor] setFill];

    
    CGSize offset = CGSizeMake(4, 1);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(ref, offset, 2.0, color);
    
    [text drawInRect:textRect withFont:font];
}

@end
