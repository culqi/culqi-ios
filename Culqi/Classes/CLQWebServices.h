//
//  CLQWebServices.h
//  
//
//  Created by Guillermo Saenz on 9/18/16.
//  Copyright (c) 2016 Guillermo Saenz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface CLQWebServices : NSObject

+ (void)setAutorizationHeaderFieldWithMerchantCode:(NSString *)merchantCode;

+ (void)createTokenForEmail:(NSString *)email
                  firstName:(NSString *)firstName
                   lastName:(NSString *)lastName
                        CVC:(NSNumber *)cvc
                   expMonth:(NSNumber *)expMonth
                    expYear:(NSNumber *)expYear
                     number:(NSNumber *)number
                    success:(void (^)(NSDictionary *responseObject))success
                    failure:(void (^)(NSError *error))failure;

@end
NS_ASSUME_NONNULL_END
