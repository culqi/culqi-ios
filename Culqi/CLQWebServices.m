//
//  CLQWebServices.m
//  Culqi
//
//  Created by Guillermo Sáenz on 9/18/16.
//  Copyright (c) 2016 Guillermo Sáenz. All rights reserved.
//

#import "CLQWebServices.h"

#import "CLQHTTPSessionManager.h"

#import "CLQResponseHeaders.h"
#import "CLQError.h"
#import "CLQToken.h"
#import "CLQCharge.h"
#import "CLQRefund.h"
#import "CLQCustomer.h"
#import "CLQCard.h"
#import "CLQPlan.h"
#import "CLQSubscription.h"
#import "CLQPaging.h"

@implementation CLQWebServices

#pragma mark - Auth

+ (void)setAutorizationHeaderFieldWithApiKey:(NSString *)apiKey {
    
    [[CLQHTTPSessionManager manager].requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@", apiKey] forHTTPHeaderField:@"Authorization"];
}

#pragma mark - Tokens

+ (void)createTokenWithCardNumber:(NSString *)cardNumber
                              cvv:(NSString *)cvv
                  expirationMonth:(NSString *)expirationMonth
                   expirationYear:(NSString *)expirationYear
                            email:(NSString *)email
                         metadata:(nonnull NSDictionary *)metadata
                          success:(nonnull void (^)(CLQResponseHeaders * _Nonnull, CLQToken * _Nonnull))success
                          failure:(nonnull void (^)(CLQResponseHeaders * _Nonnull, CLQError * _Nonnull, NSError * _Nonnull))failure {
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    if (cardNumber) [parameters setObject:cardNumber forKey:@"card_number"];
    if (cvv) [parameters setObject:cvv forKey:@"cvv"];
    if (expirationMonth) [parameters setObject:expirationMonth forKey:@"expiration_month"];
    if (expirationYear) [parameters setObject:expirationYear forKey:@"expiration_year"];
    if (email) [parameters setObject:email forKey:@"email"];
    if (metadata) [parameters setObject:metadata forKey:@"metadata"];
    
    [[CLQHTTPSessionManager manager] POST:@"tokens" parameters:parameters.copy progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) success ([CLQResponseHeaders newWithData:[self headersFromResponseTask:task]],
                              [CLQToken newWithData:responseObject]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) failure([CLQResponseHeaders newWithData:[self headersFromResponseTask:task]],
                             [CLQError newWithData:[self getBusinessErrorFromError:error]],
                             error);
    }];
}

@end
