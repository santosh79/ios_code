//
//  main.m
//  RandomPossessions
//
//  Created by SANTOSH KUMAR on 5/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        BNRItem *backpack = [[BNRItem alloc] init];
        [backpack setItemName:@"- Backpack"];
        
        BNRItem *calculator = [[BNRItem alloc] init];
        [calculator setItemName:@"Calculator"];
        
        [backpack setContainedItem:calculator];
        backpack = nil;
        
        NSLog(@"Calculator container %@", [calculator container]);
        calculator = nil;
        
    }
    return 0;
}

