using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

#import "CalculatorBrain.h"

SPEC_BEGIN(CalculatorBrainSpec)

/* This is not an exhaustive list of usages.
   For more information, please visit https://github.com/pivotal/cedar */

describe(@"Example specs on Calculator Brain", ^{
    
    describe(@"perform operation", ^{
        describe(@"+", ^{
            it(@"should return 0 if there are no operands", ^{
                CalculatorBrain *brain = [[CalculatorBrain alloc] init];
                
                [brain performOperation:@"+"] should equal(0);
            });
            
            it(@"should return the only operand if there is one", ^{
                CalculatorBrain *brain = [[CalculatorBrain alloc] init];
                [brain pushOperand: 2.0];
                
                [brain performOperation:@"+"] should equal(2.0);
            });
            
            it(@"should add the top two operands", ^{
                CalculatorBrain *brain = [[CalculatorBrain alloc] init];
                [brain pushOperand: 1.0];
                [brain pushOperand: 2.0];
                [brain pushOperand: 3.0];
                
                [brain performOperation:@"+"] should equal(5.0);
            });
        });
        describe(@"-", ^{
            it(@"should return 0 if there are no operands", ^{
                CalculatorBrain *brain = [[CalculatorBrain alloc] init];
                
                [brain performOperation:@"-"] should equal(0);
            });
            
            it(@"should return negative operand if there is one", ^{
                CalculatorBrain *brain = [[CalculatorBrain alloc] init];
                [brain pushOperand: 2.0];
                
                [brain performOperation:@"-"] should equal(-2.0);
            });
            
            it(@"should subtract the top two operands", ^{
                CalculatorBrain *brain = [[CalculatorBrain alloc] init];
                [brain pushOperand: 1.0];
                [brain pushOperand: 2.0];
                [brain pushOperand: 3.0];
                
                [brain performOperation:@"-"] should equal(-1.0);
            });
        });
    });
});

SPEC_END

