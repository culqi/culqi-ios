//
//  CLQTokenCard.h
//  payments
//
//  Created by William Muro on 9/11/16.
//  Copyright © 2016 May. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface CLQTokenCard : NSObject

@property (nonatomic, readonly) NSString *brand;
@property (nonatomic, readonly) NSString *number;
@property (nonatomic, readonly) NSString *bin;
@property (nonatomic, readonly) NSString *lastName;
@property (nonatomic, readonly) NSString *firstName;

- (instancetype)initWithBrand:(NSString *)brand
                       number:(NSString *)number
                          bin:(NSString *)bin
                     lastName:(NSString *)lastName
                    firstName:(NSString *)firstName;

+ (instancetype)newWithBrand:(NSString *)brand
                      number:(NSString *)number
                         bin:(NSString *)bin
                    lastName:(NSString *)lastName
                   firstName:(NSString *)firstName;

@end
NS_ASSUME_NONNULL_END
