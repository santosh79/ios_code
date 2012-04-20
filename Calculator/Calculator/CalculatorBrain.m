//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Santosh Kumar on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain

- (NSMutableArray *) operandStack
{
    if (!_operandStack) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

- (void) pushOperand:(NSString*) operand
{
    [[self operandStack] addObject:operand];
}

-(double) performOperation:(NSString *) operation
{
    NSString * secondOperand = [_operandStack lastObject]; [_operandStack removeLastObject];
    NSString * firstOperand = [_operandStack lastObject]; [_operandStack removeLastObject];
    
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
