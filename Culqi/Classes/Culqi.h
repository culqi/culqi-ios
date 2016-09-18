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

NS_ASSUME_NONNULL_BEGIN
@interface Culqi : NSObject

@property (nonatomic, readonly) NSString *merchantCode;

/**
 * gets singleton object.
 * @return singleton
 */
+ (Culqi *)sharedInstance;

- (void)setMerchantCode:(NSString *)merchantCode;

- (void)createTokenForCard:(CLQCard *)card
                   success:(void (^)(CLQToken *token))success
                   failure:(void (^)(NSError *error))failure;

@end
NS_ASSUME_NONNULL_END
