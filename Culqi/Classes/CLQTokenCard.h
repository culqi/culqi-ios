//
//  CLQTokenCard.h
//  payments
//
//  Created by William Muro on 9/11/16.
//  Copyright © 2016 May. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLQTokenCard : NSObject

@property (nonatomic, readonly) NSString *brand;
@property (nonatomic, readonly) NSString *number;
@property (nonatomic, readonly) NSString *bin;
@property (nonatomic, readonly) NSString *lastName;
@property (nonatomic, readonly) NSString *firstName;

- (instancetype)initWithBrand:(nonnull NSString *)brand
                       number:(nonnull NSString *)number
                          bin:(nonnull NSString *)bin
                     lastName:(nonnull NSString *)lastName
                    firstName:(nonnull NSString *)firstName;

+ (instancetype)newWithBrand:(nonnull NSString *)brand
                      number:(nonnull NSString *)number
                         bin:(nonnull NSString *)bin
                    lastName:(nonnull NSString *)lastName
                   firstName:(nonnull NSString *)firstName;

@end
