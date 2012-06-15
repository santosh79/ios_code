//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by SANTOSH KUMAR on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnosisView.h"

@interface HypnosisterAppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate> {
    HypnosisView *view;
}

@property (strong, nonatomic) UIWindow *window;


@end
