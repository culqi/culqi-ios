//
//  CLQIssuerIdentificationNumber.h
//  Culqi
//
//  Created by Guillermo Sáenz on 5/2/17.
//  Copyright (c) 2017 Guillermo Sáenz. All rights reserved.
//

#import "CLQBaseModelObject.h"

typedef enum : NSUInteger {
    CLQCardBrandUnkown,
    CLQCardBrandVisa,
    CLQCardBrandMastercard,
    CLQCardBrandAmericanExpress,
    CLQCardBrandDinersClub
} CLQCardBrand;

typedef enum : NSUInteger {
    CLQCardTypeUnkown,
    CLQCardTypeCredito,
    CLQCardTypeDebito,
    CLQCardTypePrepagada
} CLQCardType;

NS_ASSUME_NONNULL_BEGIN
@class CLQCardIssuer;

@interface CLQIssuerIdentificationNumber : CLQBaseModelObject

@property (nonatomic, copy, readonly) NSString *object;
@property (nonatomic, copy, readonly) NSString *bin;
@property (nonatomic, assign, readonly) CLQCardBrand cardBrand;
@property (nonatomic, assign, readonly) CLQCardType cardType;
@property (nonatomic, copy, readonly) NSString *cardCategory;
@property (nonatomic, strong, readonly) CLQCardIssuer *issuer;
@property (nonatomic, strong, readonly) NSArray <NSNumber *> *installmentsAllowed;

@end

@interface CLQIssuerIdentificationNumber (Helpers)

+ (NSString *)getCardBrandKeyForEnum:(CLQCardBrand)cardBrand;
+ (CLQCardBrand)getCardBrandEnumForKey:(NSString *)cardBrand;

+ (NSString *)getCardTypeKeyForEnum:(CLQCardType)cardType;
+ (CLQCardType)getCardTypeEnumForKey:(NSString *)cardType;

@end
NS_ASSUME_NONNULL_END
