//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Santosh Kumar on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"
#include "math.h"

@implementation CalculatorBrain
@synthesize programStack = _programStack;

- (NSMutableArray *) programStack
{
    if (!_programStack) {
        _programStack = [[NSMutableArray alloc] init];
    }
    return _programStack;
}

- (void) pushOperand:(NSString*) operand
{
    [[self programStack] addObject:operand];
}

- (void) clearStack {
    [self.programStack removeAllObjects];
}

-(double) performOperation:(NSString *) operation
{
    double result;
    if([self isTwoOperandOperation:operation]) {
        result = [self performTwoOperandOperation:operation];
    } else if([self isSingleOperandOperation:operation]) {
        result = [self performSingleOperandOperation:operation];
    } else if([operation isEqualToString:@"PI"]) {
        result = [self calcPI];
    }
    return result;
}

- (BOOL) isTwoOperandOperation:(NSString *) operation {
    return ([operation isEqualToString:@"+"] || [operation isEqualToString:@"-"] || [operation isEqualToString:@"*"] || [operation isEqualToString:@"/"]);
}

- (BOOL) isSingleOperandOperation:(NSString *) operation {
    return ([operation isEqualToString:@"sin"] || [operation isEqualToString:@"cos"] || [operation isEqualToString:@"sqrt"]);
}

- (double) calcPI {
    return 3.14;
}

- (double) performSingleOperandOperation:(NSString *) operation {
    NSString * mostRecentOperand = [self.programStack lastObject]; [self.programStack removeLastObject];
    if(!mostRecentOperand) { return 0.0; }
    double result;
    
    if ([operation isEqualToString:@"sin"]) {
        result = sin([mostRecentOperand doubleValue]);
    } else if ([operation isEqualToString:@"cos"]) {
        result = cos([mostRecentOperand doubleValue]);        
    } else if ([operation isEqualToString:@"sqrt"]) {
        result = sqrt([mostRecentOperand doubleValue]);        
    } else {
        result = 0.0;
    }
    
    return result;
}

- (double) performTwoOperandOperation:(NSString *) operation {
    NSString * secondOperand = [self.programStack lastObject]; [self.programStack removeLastObject];
    NSString * firstOperand = [self.programStack lastObject]; [self.programStack removeLastObject];
    
    double result;
    if ([operation isEqualToString:@"+"]) {
        result = [firstOperand doubleValue] + [secondOperand doubleValue];
    } else if ([operation isEqualToString:@"-"]) {
        result = [firstOperand doubleValue] - [secondOperand doubleValue];
    } else if ([operation isEqualToString:@"*"]) {
        result = [firstOperand doubleValue] * [secondOperand doubleValue];
    } else if ([operation isEqualToString:@"/"]) {
        result = [firstOperand doubleValue] / [secondOperand doubleValue];
    } else {
        result = 0.0;
    }
    return result;
}
@end
