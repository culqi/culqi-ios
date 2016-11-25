//
//  CLQCard.m
//  payments
//
//  Created by William Muro on 9/11/16.
//  Copyright © 2016 May. All rights reserved.
//

#import "CLQCard.h"

@implementation CLQCard

#pragma mark - Lifecycle

- (instancetype)initWithNumber:(NSNumber *)number CVC:(NSNumber *)cvc expMonth:(NSNumber *)expMonth expYear:(NSNumber *)expYear firstName:(NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email {
    
    self = [super init];
    if (self) {
        _number = number;
        _cvc = cvc;
        _expMonth = expMonth;
        _expYear = expYear;
        _lastName = lastName;
        _firstName = firstName;
        _email = email;
    }
    return self;
}

+ (instancetype)newWithNumber:(NSNumber *)number CVC:(NSNumber *)cvc expMonth:(NSNumber *)expMonth expYear:(NSNumber *)expYear firstName:(NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email {
    
    return [[CLQCard alloc] initWithNumber:number
                                       CVC:cvc
                                  expMonth:expMonth
                                   expYear:expYear
                                 firstName:firstName
                                  lastName:lastName
                                     email:email];
}

#pragma mark - Methods

- (void)drive {
    //NSLog(@"Driving a %@. Vrooooom!", self.model);
}

@end
