//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Santosh Kumar on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

@property (nonatomic) NSMutableArray * operandStack;
-(double) performOperation:(NSString *) operation;
- (void) pushOperand:(NSString*) operand;
- (void) clearStack;
- (double) calcPI;
@end
