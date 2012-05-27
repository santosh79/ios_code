//
//  QuizViewController.m
//  Quiz
//
//  Created by SANTOSH KUMAR on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@end

@implementation QuizViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        questions = [[NSMutableArray alloc] initWithObjects:@"What is 7 + 7?", @"What is the capital of Vermont?", @"From what is cognac made?", nil];
        answers = [[NSMutableArray alloc] initWithObjects:@"14", @"Montpellier", @"Grapes", nil];
        
    }
    return self;
}

- (IBAction)showQuestion:(id)sender {
    currentQuestionsIndex = (currentQuestionsIndex + 1 >= [questions count]) ? 0 : (currentQuestionsIndex + 1);
    NSString * question = [questions objectAtIndex:currentQuestionsIndex];
    
    questionField.text = question;
}

-(IBAction)showAnswer:(id)sender {
    answerField.text = [answers objectAtIndex:currentQuestionsIndex];
}
@end
