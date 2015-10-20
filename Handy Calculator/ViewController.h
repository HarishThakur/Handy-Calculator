//
//  ViewController.h
//  Handy Calculator
//
//  Created by Harish Singh on 19/10/15.
//  Copyright (c) 2015 Sourcebits Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    BOOL isDecimal;
    NSInteger calculateOperation;
}
@property (weak, nonatomic) IBOutlet UILabel *labelForCalculation;
@property NSNumber *displayNumber;
@property NSNumber *calculatedNumber;

-(void)setNumber : (NSNumber *)number;
-(void)calculation : (NSNumber *)number;
@end

