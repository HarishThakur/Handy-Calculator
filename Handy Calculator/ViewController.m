//
//  ViewController.m
//  Handy Calculator
//
//  Created by Harish Singh on 19/10/15.
//  Copyright (c) 2015 Sourcebits Technologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    float printNumber;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    isDecimal = false;
    _displayNumber = 0;
    _labelForCalculation.adjustsFontSizeToFitWidth = TRUE;
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"backImage.jpg"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setNumber : (NSNumber *)number {
    if(!isDecimal) {
        if ([_displayNumber floatValue] <= 0) {
            _displayNumber = 0;
        }
        _displayNumber = @([_displayNumber floatValue] * 10);
        _displayNumber = @([_displayNumber floatValue] + [number integerValue]);
        printNumber = _displayNumber.floatValue;
        _labelForCalculation.text = [NSString stringWithFormat:@"%.0f", printNumber];
    }
    else {
        _labelForCalculation.text = [_labelForCalculation.text stringByAppendingString:[NSString stringWithFormat:@"%@", number]];
    }
    _displayNumber = [NSNumber numberWithFloat:_labelForCalculation.text.floatValue];
}



-(void)calculation : (NSNumber *)number {
    isDecimal = false;
    if(_calculatedNumber == 0) {
        _calculatedNumber = _displayNumber;
    }
    else {
        printNumber = _calculatedNumber.floatValue;
        _labelForCalculation.text = [NSString stringWithFormat:@"%.2f", printNumber];
        switch (calculateOperation) {
            case 1:
                _calculatedNumber = @([_calculatedNumber floatValue] / [_displayNumber floatValue]);
                break;
            case 2:
               _calculatedNumber = @([_calculatedNumber floatValue] * [_displayNumber floatValue]);
                break;
            case 3:
                _calculatedNumber = @([_calculatedNumber floatValue] - [_displayNumber floatValue]);
                break;
            case 4:
                _calculatedNumber = @([_calculatedNumber floatValue] + [_displayNumber floatValue]);
                break;
            case 5:
                _calculatedNumber = @([_calculatedNumber floatValue] / 100);
                break;
            default:
                break;
        }
    }
    calculateOperation = [number integerValue];
    _displayNumber = 0;
}


- (IBAction)buttonToClear:(id)sender {
    isDecimal = false;
    _displayNumber = 0;
    _calculatedNumber = 0;
    calculateOperation = 0;
    _labelForCalculation.text = [NSString stringWithFormat:@"%d",0];
}

- (IBAction)buttonToMakeNumberPostiveNegative:(id)sender {
    _displayNumber = @(0 - [_displayNumber integerValue]);
    printNumber = _displayNumber.floatValue;
    if(!isDecimal) {
        _labelForCalculation.text = [NSString stringWithFormat:@"%.0f",printNumber];
    }
    else {
        _labelForCalculation.text = [NSString stringWithFormat:@"%.2f",printNumber];
    }
}

- (IBAction)buttonToCalculateDivision:(id)sender {
    if(_calculatedNumber != 0) {
        [self calculation:[NSNumber numberWithInt:(int)calculateOperation]];
        printNumber = _calculatedNumber.floatValue;
        _labelForCalculation.text = [NSString stringWithFormat:@"%.2f", printNumber];
        _displayNumber = @([_labelForCalculation.text floatValue]);
        _calculatedNumber = 0;
    }
    [self calculation:[NSNumber numberWithInt:1]];
}
- (IBAction)buttonToCalculateMultiplication:(id)sender {
    if(_calculatedNumber != 0) {
        [self calculation:[NSNumber numberWithInt:(int)calculateOperation]];
        printNumber = _calculatedNumber.floatValue;
        _labelForCalculation.text = [NSString stringWithFormat:@"%.2f", printNumber];
        _displayNumber = @([_labelForCalculation.text floatValue]);
        _calculatedNumber = 0;
    }
    [self calculation:[NSNumber numberWithInt:2]];
}
- (IBAction)buttonToCalculateSubtraction:(id)sender {
    if(_calculatedNumber != 0) {
        [self calculation:[NSNumber numberWithInt:(int)calculateOperation]];
        printNumber = _calculatedNumber.floatValue;
        _labelForCalculation.text = [NSString stringWithFormat:@"%.2f", printNumber];
        _displayNumber = @([_labelForCalculation.text floatValue]);
        _calculatedNumber = 0;
    }
    [self calculation:[NSNumber numberWithInt:3]];
}
- (IBAction)buttonToCalculateAddition:(id)sender {
    if(_calculatedNumber != 0) {
        [self calculation:[NSNumber numberWithInt:(int)calculateOperation]];
        printNumber = _calculatedNumber.floatValue;
        _labelForCalculation.text = [NSString stringWithFormat:@"%.2f", printNumber];
        _displayNumber = @([_labelForCalculation.text floatValue]);
        _calculatedNumber = 0;
    }
    [self calculation:[NSNumber numberWithInt:4]];
}
- (IBAction)buttonToCalculatePercentage:(id)sender {
    _calculatedNumber = _displayNumber;
    calculateOperation = 5;
    [self calculation:[NSNumber numberWithInt:(int)calculateOperation]];
    printNumber = _calculatedNumber.floatValue;
    _labelForCalculation.text = [NSString stringWithFormat:@"%.2f", printNumber];
    _displayNumber = @([_labelForCalculation.text floatValue]);
    _calculatedNumber = 0;
}

- (IBAction)buttonToShowOutput:(id)sender {
    [self calculation:[NSNumber numberWithInt:(int)calculateOperation]];
    printNumber = _calculatedNumber.floatValue;
    _labelForCalculation.text = [NSString stringWithFormat:@"%.2f", printNumber];
    _displayNumber = @([_labelForCalculation.text floatValue]);
    _calculatedNumber = 0;
}
- (IBAction)buttonToEnterDot:(id)sender {
    isDecimal = true;
    NSRange range = [_labelForCalculation.text rangeOfString:@"."];
    if(range.location == NSNotFound) {
        _labelForCalculation.text = [_labelForCalculation.text stringByAppendingString:@"."];
    }
}
- (IBAction)buttonToEnterNumber0:(id)sender {
    [self setNumber:[NSNumber numberWithInt:0]];
}
- (IBAction)buttonToEnterNumber1:(id)sender {
    [self setNumber:[NSNumber numberWithInt:1]];
}
- (IBAction)buttonToEnterNumber2:(id)sender {
    [self setNumber:[NSNumber numberWithInt:2]];
}
- (IBAction)buttonToEnterNumber3:(id)sender {
    [self setNumber:[NSNumber numberWithInt:3]];
}
- (IBAction)buttonToEnterNumber4:(id)sender {
    [self setNumber:[NSNumber numberWithInt:4]];
}
- (IBAction)buttonToEnterNumber5:(id)sender {
    [self setNumber:[NSNumber numberWithInt:5]];
}
- (IBAction)buttonToEnterNumber6:(id)sender {
    [self setNumber:[NSNumber numberWithInt:6]];
}
- (IBAction)buttonToEnterNumber7:(id)sender {
    [self setNumber:[NSNumber numberWithInt:7]];
}
- (IBAction)buttonToEnterNumber8:(id)sender {
    [self setNumber:[NSNumber numberWithInt:8]];
}
- (IBAction)buttonToEnterNumber9:(id)sender {
    [self setNumber:[NSNumber numberWithInt:9]];
}
@end
