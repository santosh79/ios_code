//
//  BNRItem.m
//  RandomPossessions
//
//  Created by SANTOSH KUMAR on 5/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem
@synthesize itemName;
@synthesize serialNumber, valueInDollars, containedItem, container, dateCreated;

+ (id) randomItem {
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy", @"Rusty", @"Shiny", nil];
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear", @"Spork", @"Mac", nil];
    
    int randomAdjIdx = rand() % [randomAdjectiveList count];
    NSString *randomAdj = [randomAdjectiveList objectAtIndex:randomAdjIdx];
    int randomNounIdx = rand() % [randomNounList count];
    NSString *randomNoun = [randomNounList objectAtIndex:randomNounIdx];
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", randomAdj, randomNoun];
    
    int randomValue = rand() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c", '0' + rand() % 10, 'A' + rand() % 26, '0' + rand() % 10, 'A' + rand() % 26, '0' + rand() % 10];
    
    return [[BNRItem alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
}

- (id) init {
    return [self initWithItemName:@"Item" valueInDollars:0 serialNumber:@""];
}

- (id) initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber {
    return [self initWithItemName:name valueInDollars:0 serialNumber:sNumber];
}

- (id) initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber {
    self = [super init];
    if (self) {
        itemName = name;
        valueInDollars = value;
        serialNumber = sNumber;
        dateCreated = [[NSDate alloc] init];
    }
    return self;
}

- (NSString *) description {
    return [NSString stringWithFormat:@"%@ (%@): With $%d, recorded on %@", itemName, serialNumber, valueInDollars, dateCreated];
}

- (void) setContainedItem:(BNRItem *)i {
  containedItem = i;
  [i setContainer:self];
}

- (void) dealloc {
    NSLog(@"Destroyed %@", self);
}
@end
