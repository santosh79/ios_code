//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Santosh Kumar on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"
#include "math.h"

@interface CalculatorBrain()
+ (BOOL) isTwoOperandOperation:(NSString *) operation;
+ (BOOL) isSingleOperandOperation:(NSString *) operation;
+ (double) calcPI;
@end

@implementation CalculatorBrain
@synthesize programStack = _programStack;

- (NSMutableArray *) programStack {
    if (!_programStack) {
        _programStack = [[NSMutableArray alloc] init];
    }
    return _programStack;
}

- (void) pushOperand:(NSNumber *) operand {
    [[self programStack] addObject:operand];
}

- (void) clearStack {
    [self.programStack removeAllObjects];
}

-(double) performOperation:(NSString *) operation {
    [self.programStack addObject:operation];
    return [CalculatorBrain runProgram:self.program];
}

- (id) program {
    return [self.programStack copy];
}

+ (NSString *) descriptionOfProgram:(id)program {
    return @"Implement this in assignment 2";
}

+ (double) popOperandOffStack:(NSMutableArray *)stack {
    double result = 0;
    
    id topOfStack = [stack lastObject];
    if (topOfStack) { [stack removeLastObject]; }
    
    if([topOfStack isKindOfClass:[NSNumber class]]) {
        return [topOfStack doubleValue];
    } else if([topOfStack isKindOfClass:[NSString class]]) {
        NSString * operation = topOfStack;
        if([CalculatorBrain isTwoOperandOperation:operation]) {
            if ([operation isEqualToString:@"+"]) {
                result = [self popOperandOffStack:stack] + [self popOperandOffStack:stack];
            } else if([operation isEqualToString:@"-"]) {
                result = [self popOperandOffStack:stack] - [self popOperandOffStack:stack];
            } else if([operation isEqualToString:@"*"]) {
                result = [self popOperandOffStack:stack] * [self popOperandOffStack:stack];
            } else if([operation isEqualToString:@"*"]) {
                result = [self popOperandOffStack:stack] * [self popOperandOffStack:stack];
            } else {
                result = 0.0;
            }
        } else if([CalculatorBrain isSingleOperandOperation:operation]) {
            if([operation isEqualToString:@"sin"]) {
                result = sin([self popOperandOffStack:stack]);
            } else if([operation isEqualToString:@"cos"]) {
                result = cos([self popOperandOffStack:stack]);
            } else if([operation isEqualToString:@"sqrt"]) {
                result = sqrt([self popOperandOffStack:stack]);
            } else {
                result = 0.0;
            }
        } else if([operation isEqualToString:@"PI"]) {
            result = [self calcPI];
        }
    }
    return result;
}

+ (double) runProgram:(id)program {
    NSMutableArray * stack;
    if([program isKindOfClass:[NSArray class]]) {
        stack = [program mutableCopy];
    }
    return [self popOperandOffStack:stack];
}

+ (NSSet *)variablesUsedInProgram:(id)program {
    return nil;
}

+ (double)runProgram:(id)program usingVariableValues:(NSDictionary *)variableValues {
    return 0.0;
}

+ (BOOL) isTwoOperandOperation:(NSString *) operation {
    return ([operation isEqualToString:@"+"] || [operation isEqualToString:@"-"] || [operation isEqualToString:@"*"] || [operation isEqualToString:@"/"]);
}

+ (BOOL) isSingleOperandOperation:(NSString *) operation {
    return ([operation isEqualToString:@"sin"] || [operation isEqualToString:@"cos"] || [operation isEqualToString:@"sqrt"]);
}

+ (double) calcPI {
    return 3.14;
}

@end
