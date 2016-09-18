//
//  CLQCard.h
//  payments
//
//  Created by William Muro on 9/11/16.
//  Copyright © 2016 May. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLQCard : NSObject

@property (nonatomic, readonly) NSNumber *number;
@property (nonatomic, readonly) NSNumber *cvc;
@property (nonatomic, readonly) NSNumber *expMonth;
@property (nonatomic, readonly) NSNumber *expYear;
@property (nonatomic, readonly) NSString *firstName;
@property (nonatomic, readonly) NSString *lastName;
@property (nonatomic, readonly) NSString *email;

- (instancetype)initWithNumber:(nonnull NSNumber *)number
                           CVC:(nonnull NSNumber *)cvc
                      expMonth:(nonnull NSNumber *)expMonth
                       expYear:(nonnull NSNumber *)expYear
                     firstName:(nonnull NSString *)firstName
                      lastName:(nonnull NSString *)lastName
                         email:(nonnull NSString *)email;

+ (instancetype)newWithNumber:(nonnull NSNumber *)number
                          CVC:(nonnull NSNumber *)cvc
                     expMonth:(nonnull NSNumber *)expMonth
                      expYear:(nonnull NSNumber *)expYear
                    firstName:(nonnull NSString *)firstName
                     lastName:(nonnull NSString *)lastName
                        email:(nonnull NSString *)email;

- (void)drive;

@end
