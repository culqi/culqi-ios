//
//  CLQCard.h
//  payments
//
//  Created by William Muro on 9/11/16.
//  Copyright © 2016 May. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLQCard : NSObject

@property (nonatomic, readonly) NSString *number;
@property (nonatomic, readonly) NSString *cvc;
@property (nonatomic, readonly) NSString *expMonth;
@property (nonatomic, readonly) NSString *expYear;
@property (nonatomic, readonly) NSString *firstName;
@property (nonatomic, readonly) NSString *lastName;
@property (nonatomic, readonly) NSString *email;

- (void)drive;

@end
