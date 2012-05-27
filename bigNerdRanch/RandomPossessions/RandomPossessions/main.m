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
        for (int i = 0; i < 10; i++) {
            BNRItem *p = [BNRItem randomItem];
            NSLog(@"%@", p);            
        }
        
    }
    return 0;
}

