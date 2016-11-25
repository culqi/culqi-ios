//
//  Culqi.m
//  payments
//
//  Created by William Muro on 9/11/16.
//  Copyright © 2016 May. All rights reserved.
//

#import "Culqi.h"

#import "CLQHTTPSessionManager.h"
#import "CLQWebServices.h"
#import "CLQCard.h"
#import "CLQToken.h"
#import "CLQTokenCard.h"

@implementation Culqi

static NSString *CLQCheckoutBaseURLString = @"https://integ-pago.culqi.com/api/v1/";

static Culqi *SINGLETON = nil;

static bool isFirstAccess = YES;

#pragma mark - Public Method

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];    
    });
    
    return SINGLETON;
}

#pragma mark - Life Cycle

+ (id) allocWithZone:(NSZone *)zone {
    return [self sharedInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

- (id)copy {
    return [[Culqi alloc] init];
}

- (id)mutableCopy {
    return [[Culqi alloc] init];
}

- (id) init {
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    if (self) {
        [CLQHTTPSessionManager initWithBaseURLString:CLQCheckoutBaseURLString];
    }
    return self;
}

#pragma mark - Autorization

- (void)setMerchantCode:(NSString *)merchantCode {
    
    [CLQWebServices setAutorizationHeaderFieldWithMerchantCode:merchantCode];
    
    _merchantCode = merchantCode;
}

#pragma mark - Tokenization

- (void)createTokenForCard:(CLQCard *)card success:(void (^)(CLQToken *))success failure:(void (^)(NSError *))failure {
    
    [CLQWebServices createTokenForEmail:card.email firstName:card.firstName lastName:card.lastName CVC:card.cvc expMonth:card.expMonth expYear:card.expYear number:card.number success:^(NSDictionary *responseObject) {
        
        CLQToken *token = [self createTokenFromDictionary:responseObject];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (success) success(token);
        });
    } failure:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (failure) failure(error);
        });
    }];
}

#pragma mark - Object Parsing

- (CLQToken *)createTokenFromDictionary:(NSDictionary *)tokenDictionary {
    
    NSString *identifier = [tokenDictionary objectForKey:@"id"];
    NSString *email = [tokenDictionary objectForKey:@"correo_electronico"];
    NSString *objectType = [tokenDictionary objectForKey:@"objeto"];
    // TODO: set createdAt
    
    NSDictionary *tokenCardDictionary = [tokenDictionary objectForKey:@"tarjeta"];
    
    CLQTokenCard *tokenCard = [self createTokenCardFromDictionary:tokenCardDictionary];

    return [CLQToken newWithIdentifier:identifier email:email createdAt:@"" objectType:objectType tokenCard:tokenCard];
}

- (CLQTokenCard *)createTokenCardFromDictionary:(NSDictionary *)tokenCardDictionary {
    
    NSString *brand = [tokenCardDictionary objectForKey:@"marca"];
    NSString *number = [tokenCardDictionary objectForKey:@"numero"];
    NSString *bin = [tokenCardDictionary objectForKey:@"bin"];
    NSString *lastName = [tokenCardDictionary objectForKey:@"apellido"];
    NSString *firstName = [tokenCardDictionary objectForKey:@"nombre"];
    
    return [CLQTokenCard newWithBrand:brand number:number bin:bin lastName:lastName firstName:firstName];
}

@end
