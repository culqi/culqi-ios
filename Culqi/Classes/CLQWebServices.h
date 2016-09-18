//
//  CLQWebServices.h
//  
//
//  Created by Guillermo Saenz on 9/18/16.
//  Copyright (c) 2016 Guillermo Saenz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLQWebServices : NSObject

+ (void)setAutorizationHeaderFieldWithMerchantCode:(NSString *)merchantCode;

+ (void)createTokenForEmail:(nonnull NSString *)email
                  firstName:(nonnull NSString *)firstName
                   lastName:(nonnull NSString *)lastName
                        CVC:(nonnull NSNumber *)cvc
                   expMonth:(nonnull NSNumber *)expMonth
                    expYear:(nonnull NSNumber *)expYear
                     number:(nonnull NSNumber *)number
                    success:(void (^)(NSDictionary *responseObject))success
                    failure:(void (^)(NSError *error))failure;

@end
