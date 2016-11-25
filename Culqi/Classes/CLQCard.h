//
//  CLQCard.h
//  payments
//
//  Created by William Muro on 9/11/16.
//  Copyright © 2016 May. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface CLQCard : NSObject

@property (nonatomic, readonly) NSNumber *number;
@property (nonatomic, readonly) NSNumber *cvc;
@property (nonatomic, readonly) NSNumber *expMonth;
@property (nonatomic, readonly) NSNumber *expYear;
@property (nonatomic, readonly) NSString *firstName;
@property (nonatomic, readonly) NSString *lastName;
@property (nonatomic, readonly) NSString *email;

- (instancetype)initWithNumber:(NSNumber *)number
                           CVC:(NSNumber *)cvc
                      expMonth:(NSNumber *)expMonth
                       expYear:(NSNumber *)expYear
                     firstName:(NSString *)firstName
                      lastName:(NSString *)lastName
                         email:(NSString *)email;

+ (instancetype)newWithNumber:(NSNumber *)number
                          CVC:(NSNumber *)cvc
                     expMonth:(NSNumber *)expMonth
                      expYear:(NSNumber *)expYear
                    firstName:(NSString *)firstName
                     lastName:(NSString *)lastName
                        email:(NSString *)email;

- (void)drive;

@end
NS_ASSUME_NONNULL_END
