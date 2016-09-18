//
//  Card.h
//  payments
//
//  Created by William Muro on 9/11/16.
//  Copyright © 2016 May. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (copy) NSString *number;
@property (copy) NSString *cvc;
@property (copy) NSString *expMonth;
@property (copy) NSString *expYear;
@property (copy) NSString *firstName;
@property (copy) NSString *lastName;
@property (copy) NSString *email;

- (void)drive;

@end