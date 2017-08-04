//
//  CLQIssuerIdentificationNumber.m
//  Culqi
//
//  Created by Guillermo Sáenz on 5/2/17.
//  Copyright (c) 2017 Guillermo Sáenz. All rights reserved.
//

#import "CLQIssuerIdentificationNumber.h"

#import "CLQCardIssuer.h"

@implementation CLQIssuerIdentificationNumber

+ (instancetype)newWithData:(NSDictionary *)data {
    
    NSString *object = [data objectForKey:@"object"];
    NSString *bin = [data objectForKey:@"bin"];
    NSString *cardBrand = [data objectForKey:@"card_brand"];
    NSString *cardType = [data objectForKey:@"card_type"];
    NSString *cardCategory = [data objectForKey:@"card_category"];
    NSDictionary *issuerData = [data objectForKey:@"issuer"];
    NSArray <NSNumber *> *installmentsAllowed = [data objectForKey:@"installments_allowed"];
    
    return [[CLQIssuerIdentificationNumber alloc] initWithObject:object bin:bin cardBrand:cardBrand cardType:cardType cardCategory:cardCategory issuerData:issuerData installmentsAllowed:installmentsAllowed];
}

- (instancetype)initWithObject:(NSString *)object bin:(NSString *)bin cardBrand:(NSString *)cardBrand cardType:(NSString *)cardType cardCategory:(NSString *)cardCategory issuerData:(NSDictionary *)issuerData installmentsAllowed:(NSArray <NSNumber *> *)installmentsAllowed {
    
    self = [super init];
    if (self) {
        if ([object isKindOfClass:[NSString class]])_object = object;
        if ([bin isKindOfClass:[NSString class]])_bin = bin;
        if ([cardBrand isKindOfClass:[NSString class]])_cardBrand = [CLQIssuerIdentificationNumber getCardBrandEnumForKey:cardBrand];
        if ([cardType isKindOfClass:[NSString class]])_cardType = [CLQIssuerIdentificationNumber getCardTypeEnumForKey:cardType];
        if ([cardCategory isKindOfClass:[NSString class]])_cardCategory = cardCategory;
        if ([issuerData isKindOfClass:[NSDictionary class]])_issuer = [CLQCardIssuer newWithData:issuerData];
        if ([installmentsAllowed isKindOfClass:[NSArray class]])_installmentsAllowed = installmentsAllowed;
    }
    return self;
}

#pragma mark - NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _object = [aDecoder decodeObjectOfClass:[self class] forKey:@"object"];
        _bin = [aDecoder decodeObjectOfClass:[self class] forKey:@"bin"];
        _cardBrand = [CLQIssuerIdentificationNumber getCardBrandEnumForKey:[aDecoder decodeObjectOfClass:[self class] forKey:@"cardBrand"]];
        _cardType = [CLQIssuerIdentificationNumber getCardTypeEnumForKey:[aDecoder decodeObjectOfClass:[self class] forKey:@"cardType"]];
        _cardCategory = [aDecoder decodeObjectOfClass:[self class] forKey:@"cardCategory"];
        _issuer = [aDecoder decodeObjectOfClass:[self class] forKey:@"issuer"];
        _installmentsAllowed = [aDecoder decodeObjectOfClass:[self class] forKey:@"installmentsAllowed"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_object forKey:@"object"];
    [aCoder encodeObject:_bin forKey:@"bin"];
    [aCoder encodeObject:[CLQIssuerIdentificationNumber getCardBrandKeyForEnum:_cardBrand] forKey:@"cardBrand"];
    [aCoder encodeObject:[CLQIssuerIdentificationNumber getCardTypeKeyForEnum:_cardType] forKey:@"cardType"];
    [aCoder encodeObject:_cardCategory forKey:@"cardCategory"];
    [aCoder encodeObject:_issuer forKey:@"issuer"];
    [aCoder encodeObject:_installmentsAllowed forKey:@"installmentsAllowed"];
}

@end

@implementation CLQIssuerIdentificationNumber (Helpers)

+ (CLQCardBrand)getCardBrandEnumForKey:(NSString *)cardBrand {
    
    if ([cardBrand isEqualToString:@"visa"]) {
        return CLQCardBrandVisa;
    }else if ([cardBrand isEqualToString:@"mastercard"]) {
        return CLQCardBrandMastercard;
    }else if ([cardBrand isEqualToString:@"american_express"]) {
        return CLQCardBrandAmericanExpress;
    }else if ([cardBrand isEqualToString:@"diners_club"]) {
        return CLQCardBrandDinersClub;
    }
    
    return CLQCardBrandUnkown;
}

+ (NSString *)getCardBrandKeyForEnum:(CLQCardBrand)cardBrand {
    
    switch (cardBrand) {
        case CLQCardBrandVisa:
            return @"Visa";
            break;
        case CLQCardBrandMastercard:
            return @"mastercard";
            break;
        case CLQCardBrandAmericanExpress:
            return @"american_express";
            break;
        case CLQCardBrandDinersClub:
            return @"diners_club";
            break;
        default:
            return NULL;
            break;
    }
}

+ (CLQCardType)getCardTypeEnumForKey:(NSString *)cardType {
    
    if ([cardType isEqualToString:@"credito"]) {
        return CLQCardTypeCredito;
    }else if ([cardType isEqualToString:@"debito"]) {
        return CLQCardTypeDebito;
    }else if ([cardType isEqualToString:@"prepagada"]) {
        return CLQCardTypePrepagada;
    }
    
    return CLQCardTypeUnkown;
}

+ (NSString *)getCardTypeKeyForEnum:(CLQCardType)cardType {
    
    switch (cardType) {
        case CLQCardTypeCredito:
            return @"credito";
            break;
        case CLQCardTypeDebito:
            return @"debito";
            break;
        case CLQCardTypePrepagada:
            return @"prepagada";
            break;
        default:
            return NULL;
            break;
    }
}

@end
