//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Santosh Kumar on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface CalculatorViewController : UIViewController {
    CalculatorBrain * _brain;
}

@property (weak, nonatomic) IBOutlet UILabel *display;
@property (weak, nonatomic) IBOutlet UILabel *stuffEnteredLabel;
@property (weak, nonatomic) IBOutlet UILabel *programDescription;

@end
