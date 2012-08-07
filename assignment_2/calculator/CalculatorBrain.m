//
//  CalculatorBrain.m
//  calculator
//
//  Created by Drew Bowman on 7/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()

@property (nonatomic,strong) NSMutableArray *programStack;

@end

@implementation CalculatorBrain

@synthesize programStack = _programStack;

-(NSMutableArray *)programStack
{
    if (!_programStack) _programStack = [[NSMutableArray alloc] init];
    return _programStack;
}

-(void)pushOperand:(double)operand
{
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
}
-(void)pushVariable:(NSString *)operand
{
    [self.programStack addObject:operand];
}
-(id)program
{
    return [self.programStack copy];
}
+ (NSSet *)variablesUsedInProgram:(id)program
{
    NSSet *result = [[NSSet alloc] init];
    for (id item in program)
    {
        if ([item isKindOfClass:[NSString class]]   ) {
            
        }
    }
    return result;
}

+ (NSString *) descriptionOfProgram:(id)program 
{
    return @"Implement this in assignment 2";
}

+ (double) popOperandOffStack:(NSMutableArray *) stack
{
    double result = 0;
    
    id topOfStack = [stack lastObject];
    if(topOfStack) [stack removeLastObject];
    
    if ([topOfStack isKindOfClass:[NSNumber class]]) {
        result = [topOfStack doubleValue];
    } else if ([topOfStack isKindOfClass:[NSString class]]) {
        NSString *operation = topOfStack;
        if ([@"*" isEqualToString:operation]) {
            result = [self popOperandOffStack:stack] * [self popOperandOffStack:stack];
        } else if ([@"/" isEqualToString:operation]){
            double divisor = [self popOperandOffStack:stack];
            if (divisor) result = [self popOperandOffStack:stack] / divisor;
        } else if ([@"+" isEqualToString:operation]){
            result = [self popOperandOffStack:stack] + [self popOperandOffStack:stack];
        } else if ([@"-" isEqualToString:operation]){
            double subtrahend = [self popOperandOffStack:stack];
            result = [self popOperandOffStack:stack] - subtrahend;
        } else if ([@"sin" isEqualToString:operation]) {
            result = sin([self popOperandOffStack:stack]);
        } else if ([@"cos" isEqualToString:operation]) {
            result = cos([self popOperandOffStack:stack]);
        } else if ([@"sqrt" isEqualToString:operation]) {
            result = sqrt([self popOperandOffStack:stack]);
        } else if ([@"π" isEqualToString:operation]) {
            result = M_PI;
        }
    }
    return result;
}

+ (double) runProgram:(id)program 
{
    NSMutableArray *stack;
    if([program isKindOfClass:[NSArray class]]){
        stack = [program mutableCopy];
    }
    
    return [self popOperandOffStack:stack];
}

+ (double)runProgram:(id)program usingVariableValues:(NSDictionary *)variableValues
{
    NSMutableArray *stack;
    if([program isKindOfClass:[NSArray class]]){
        stack = [program mutableCopy];
    }
    
    return [self popOperandOffStack:stack];
}


-(double)performOperation:(NSString *)operation
{
    [self.programStack addObject:operation];
    
    return [CalculatorBrain runProgram:self.program];
}
-(void)clear 
{
    [self.programStack removeAllObjects];
}

@end
