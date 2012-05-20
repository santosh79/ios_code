//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Santosh Kumar on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()
- (void) updateStuffDisplayed:(NSString *)operationOrOperand;
@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize stuffEnteredLabel = _stuffEnteredLabel;
@synthesize programDescription = _programDescription;

- (CalculatorBrain *) brain
{
    if(!_brain) { _brain = [[CalculatorBrain alloc] init]; }
    return _brain;
}

- (void)updateDescription {
    self.programDescription.text = [CalculatorBrain descriptionOfProgram:[self brain].program];
}

- (IBAction)digitPressed:(UIButton *)sender 
{
    NSString *digit = [sender currentTitle];
    NSString *currentDisplayText = [self.display text];
    NSString *newText = [currentDisplayText hasPrefix:@"0"] ? digit : [currentDisplayText stringByAppendingString:digit];

    [self.display setText:newText];
    [self updateDescription];
}

- (IBAction)clearBrainStack:(UIButton *)sender {
    [[self brain] clearStack];
    self.display.text = @"0";
    self.stuffEnteredLabel.text = @" ";
    [self updateDescription];
}

- (IBAction)enterPressed:(UIButton *)sender {
    [self pushOperandAndClearDisplay];
}

- (IBAction)calculatePI:(UIButton *)sender {
    self.display.text = [NSString stringWithFormat:@"%1.2f", [CalculatorBrain calcPI]];
}

- (IBAction)operationPressed:(UIButton *)sender {
    [self pushOperandAndClearDisplay];
    NSString * operation = [sender currentTitle];
    double result = [[self brain] performOperation:operation];
    [self.display setText:[NSString stringWithFormat:@"%1.2f", result]];
    [self updateStuffDisplayed:operation];
    [self updateDescription];
}

- (void) updateStuffDisplayed:(NSString *)operationOrOperand {
    NSString * currentStuffDisplayed = self.stuffEnteredLabel.text;
    
    NSString * newDisplayText = [NSString stringWithFormat:@"%@ %@", currentStuffDisplayed, operationOrOperand];
    self.stuffEnteredLabel.text = newDisplayText;        

}

- (void) pushOperandAndClearDisplay {
    NSNumber * operand = [NSNumber numberWithInt:[self.display.text intValue]];
    [[self brain] pushOperand:operand];
    [self.display setText:@"0"];
    [self updateStuffDisplayed:[operand stringValue]];
}

- (void)viewDidUnload {
    [self setStuffEnteredLabel:nil];
    [self setProgramDescription:nil];
    [super viewDidUnload];
}
@end
