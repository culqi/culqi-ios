//
//  Culqi.h
//  payments
//
//  Created by William Muro on 9/11/16.
//  Copyright © 2016 May. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLQCard;
@class CLQToken;

@interface Culqi : NSObject

@property (nonatomic, readonly) NSString *merchantCode;

/**
 * gets singleton object.
 * @return singleton
 */
+ (Culqi *)sharedInstance;

- (void)setMerchantCode:(nonnull NSString *)merchantCode;

- (void)createTokenForCard:(CLQCard *)card
                   success:(void (^)(CLQToken *))success
                   failure:(void (^)(NSError *error))failure;

@end
