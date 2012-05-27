//
//  QuizViewController.h
//  Quiz
//
//  Created by SANTOSH KUMAR on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController {
    int currentQuestionsIndex;
    
    NSMutableArray *questions;
    NSMutableArray *answers;
    
    IBOutlet UILabel *questionField;
    IBOutlet UILabel *answerField;
}

- (IBAction)showQuestion:(id)sender;
-(IBAction)showAnswer:(id)sender;

@end
