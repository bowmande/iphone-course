//
//  CalculatorViewController.m
//  calculator
//
//  Created by Drew Bowman on 7/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic,strong) CalculatorBrain *brain;
@end


@implementation CalculatorViewController
@synthesize display = _display;
@synthesize brainDisplay = _brainDisplay;
@synthesize userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

- (CalculatorBrain *)brain 
{
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}


- (IBAction)digitPressed:(UIButton *)sender 
{   
    NSRange range = [self.display.text rangeOfString:@"."];
    BOOL dotPressed = [sender.currentTitle isEqualToString:@"."];
    if (!dotPressed || (dotPressed && range.location == NSNotFound))
    {
        if (self.userIsInTheMiddleOfEnteringANumber) 
        {
            self.display.text = [self.display.text stringByAppendingString: sender.currentTitle];   
        } 
        else 
        {
            self.display.text = sender.currentTitle;
            self.userIsInTheMiddleOfEnteringANumber = YES;
        }
    }
}

- (IBAction)enterPressed 
{
    self.brainDisplay.text = [self.brainDisplay.text stringByAppendingFormat:@"%@ ",self.display.text];
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)operatorPressed:(UIButton *)sender 
{
    if (self.userIsInTheMiddleOfEnteringANumber) {
        [self enterPressed];
    }
    
    self.brainDisplay.text = [self.brainDisplay.text stringByAppendingFormat:@"%@ ",sender.currentTitle];
    double result = [self.brain performOperation:sender.currentTitle];
    
    self.display.text = [NSString stringWithFormat:@"%g", result];
}

- (IBAction)clearPressed 
{
    [self.brain clear];
    self.display.text = @"0";
    self.brainDisplay.text = @"";
    self.userIsInTheMiddleOfEnteringANumber = NO;
}


- (void)viewDidUnload {
    [self setBrainDisplay:nil];
    [super viewDidUnload];
}
@end
