//
//  CalculatorBrain.h
//  calculator
//
//  Created by Drew Bowman on 7/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(void)pushOperand:(double)operand;
-(double)performOperation:(NSString *)operation;
-(void)clear;
@end
