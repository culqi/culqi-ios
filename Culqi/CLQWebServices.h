//
//  CLQWebServices.h
//  Culqi
//
//  Created by Guillermo Sáenz on 9/18/16.
//  Copyright (c) 2016 Guillermo Sáenz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLQResponseHeaders, CLQError;
@class CLQToken;

NS_ASSUME_NONNULL_BEGIN
@interface CLQWebServices : NSObject

#pragma mark - Auth

+ (void)setAutorizationHeaderFieldWithApiKey:(NSString *)apiKey;

#pragma mark - Tokens

+ (void)createTokenWithCardNumber:(NSString *)cardNumber
                              cvv:(NSString *)cvv
                  expirationMonth:(NSString *)expirationMonth
                   expirationYear:(NSString *)expirationYear
                            email:(NSString *)email
                         metadata:(NSDictionary *)metadata
                          success:(void (^)(CLQResponseHeaders *responseHeaders, CLQToken *token))success
                          failure:(void (^)(CLQResponseHeaders *responseHeaders, CLQError *businessError, NSError *error))failure;

@end
NS_ASSUME_NONNULL_END
