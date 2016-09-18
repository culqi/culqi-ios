//
//  CLQWebServices.m
//
//
//  Created by Guillermo Saenz on 9/18/16.
//  Copyright (c) 2016 Guillermo Saenz. All rights reserved.
//

#import "CLQWebServices.h"

#import "CLQHTTPSessionManager.h"

@implementation CLQWebServices

+ (void)setAutorizationHeaderFieldWithMerchantCode:(NSString *)merchantCode {
    
    [[CLQHTTPSessionManager manager].requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@", merchantCode] forHTTPHeaderField:@"Authorization"];
}

+ (void)createTokenForEmail:(NSString *)email firstName:(NSString *)firstName lastName:(NSString *)lastName CVC:(NSNumber *)cvc expMonth:(NSNumber *)expMonth expYear:(NSNumber *)expYear number:(NSNumber *)number success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure {
    
    NSDictionary *parameters = @{@"correo_electronico":email,
                                 @"nombre":firstName,
                                 @"apellido":lastName,
                                 @"cvv":cvc,
                                 @"m_exp":expMonth,
                                 @"a_exp":expYear,
                                 @"numero":number};
    
    [[CLQHTTPSessionManager manager] POST:@"tokens" parameters:parameters progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) success (responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) failure(error);
    }];
}

@end
