//
//  BNRItem.h
//  RandomPossessions
//
//  Created by SANTOSH KUMAR on 5/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

+ (id) randomItem;
- (id) initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber;
- (id) initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, strong) BNRItem *containedItem;
@property (nonatomic, weak) BNRItem *container;
@property (nonatomic, readonly, strong) NSDate *dateCreated;

@end
