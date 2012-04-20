//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Santosh Kumar on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController

@synthesize display = _display;

- (CalculatorBrain *) brain
{
    if(!_brain) { _brain = [[CalculatorBrain alloc] init]; }
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender 
{
    NSString *digit = [sender currentTitle];
    NSString *currentDisplayText = [self.display text];
    NSString *newText = [currentDisplayText hasPrefix:@"0"] ? digit : [currentDisplayText stringByAppendingString:digit];

    [self.display setText:newText];
}

- (IBAction)clearBrainStack:(UIButton *)sender {
    [[self brain] clearStack];
    self.display.text = @"0";
}

- (IBAction)enterPressed:(UIButton *)sender {
    [self pushOperand];
}

- (IBAction)calculatePI:(UIButton *)sender {
    self.display.text = [NSString stringWithFormat:@"%1.2f", [[self brain] calcPI]];
}

- (IBAction)operationPressed:(UIButton *)sender {
    [self pushOperand];
    NSString * operation = [sender currentTitle];
    double result = [[self brain] performOperation:operation];
    [self.display setText:[NSString stringWithFormat:@"%1.2f", result]];
}

- (void) pushOperand {
    [[self brain] pushOperand:[self.display text]];
    [self.display setText:@"0"];
}
@end
