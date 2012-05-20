//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Santosh Kumar on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

@property (nonatomic) NSMutableArray * programStack;
-(double) performOperation:(NSString *) operation;
- (void) pushOperand:(NSNumber*) operand;
- (void) clearStack;
+ (double) calcPI;

@property (readonly) id program;
+ (double)runProgram:(id)program;
+ (double)runProgram:(id)program usingVariableValues:(NSDictionary *)variableValues;
+ (NSSet *)variablesUsedInProgram:(id)program;
+ (NSString *)descriptionOfProgram:(id)program;
@end
