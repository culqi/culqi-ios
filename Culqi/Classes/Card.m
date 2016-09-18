//
//  Card.m
//  payments
//
//  Created by William Muro on 9/11/16.
//  Copyright © 2016 May. All rights reserved.
//


#import "Card.h"

@implementation Card

@synthesize number = _number;
@synthesize cvc = _cvc;
@synthesize expYear = _expYear;
@synthesize expMonth = _expMonth;
@synthesize email = _email;
@synthesize lastName = _lastName;
@synthesize firstName = _firstName;

- (void)drive {
    //NSLog(@"Driving a %@. Vrooooom!", self.model);
}

@end