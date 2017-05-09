//
//  CLQToken.m
//  Culqi
//
//  Created by Guillermo Sáenz on 5/2/17.
//  Copyright (c) 2017 Guillermo Sáenz. All rights reserved.
//

#import "CLQToken.h"

#import "CLQIssuerIdentificationNumber.h"
#import "CLQClient.h"

@implementation CLQToken

+ (instancetype)newWithData:(NSDictionary *)data {
    
    NSString *object = [data objectForKey:@"object"];
    NSString *identifier = [data objectForKey:@"id"];
    NSString *type = [data objectForKey:@"type"];
    NSString *email = [data objectForKey:@"email"];
    NSNumber *creationDate = [data objectForKey:@"creation_date"];
    NSString *cardNumber = [data objectForKey:@"card_number"];
    NSString *cardLastFourNumbers = [data objectForKey:@"last_four"];
    NSNumber *active = [data objectForKey:@"active"];
    NSDictionary *iinData = [data objectForKey:@"iin"];
    NSDictionary *clientData = [data objectForKey:@"client"];
    NSDictionary *metadata = [data objectForKey:@"metadata"];
    
    return [[CLQToken alloc] initWithObject:object identifier:identifier type:type email:email creationDate:creationDate cardNumber:cardNumber cardLastFourNumbers:cardLastFourNumbers active:active iinData:iinData clientData:clientData metadata:metadata];
}

- (instancetype)initWithObject:(NSString *)object identifier:(NSString *)identifier type:(NSString *)type email:(NSString *)email creationDate:(NSNumber *)creationDate cardNumber:(NSString *)cardNumber cardLastFourNumbers:(NSString *)cardLastFourNumbers active:(NSNumber *)active iinData:(NSDictionary *)iinData clientData:(NSDictionary *)clientData metadata:(NSDictionary *)metadata {
    
    self = [super init];
    if (self) {
        if ([object isKindOfClass:[NSString class]])_object = object;
        if ([identifier isKindOfClass:[NSString class]])_identifier = identifier;
        if ([type isKindOfClass:[NSString class]])_type = type;
        if ([email isKindOfClass:[NSString class]])_email = email;
        if ([creationDate isKindOfClass:[NSNumber class]])_creationDate = [NSDate dateWithTimeIntervalSince1970:creationDate.doubleValue];
        if ([cardNumber isKindOfClass:[NSString class]])_cardNumber = cardNumber;
        if ([cardLastFourNumbers isKindOfClass:[NSString class]])_cardLastFourNumbers = cardLastFourNumbers;
        if ([active isKindOfClass:[NSNumber class]])_active = active.boolValue;
        if ([iinData isKindOfClass:[NSDictionary class]])_iin = [CLQIssuerIdentificationNumber newWithData:iinData];
        if ([clientData isKindOfClass:[NSDictionary class]])_client = [CLQClient newWithData:clientData];
        if ([metadata isKindOfClass:[NSDictionary class]])_metadata = metadata;
    }
    return self;
}

#pragma mark - NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _object = [aDecoder decodeObjectOfClass:[self class] forKey:@"object"];
        _identifier = [aDecoder decodeObjectOfClass:[self class] forKey:@"identifier"];
        _type = [aDecoder decodeObjectOfClass:[self class] forKey:@"type"];
        _email = [aDecoder decodeObjectOfClass:[self class] forKey:@"email"];
        _creationDate = [aDecoder decodeObjectOfClass:[self class] forKey:@"creationDate"];
        _cardNumber = [aDecoder decodeObjectOfClass:[self class] forKey:@"cardNumber"];
        _cardLastFourNumbers = [aDecoder decodeObjectOfClass:[self class] forKey:@"cardLastFourNumbers"];
        _active = [[aDecoder decodeObjectOfClass:[self class] forKey:@"active"] boolValue];
        _iin = [aDecoder decodeObjectOfClass:[self class] forKey:@"iin"];
        _client = [aDecoder decodeObjectOfClass:[self class] forKey:@"client"];
        _metadata = [aDecoder decodeObjectOfClass:[self class] forKey:@"metadata"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_object forKey:@"object"];
    [aCoder encodeObject:_identifier forKey:@"identifier"];
    [aCoder encodeObject:_type forKey:@"type"];
    [aCoder encodeObject:_email forKey:@"email"];
    [aCoder encodeObject:_creationDate forKey:@"creationDate"];
    [aCoder encodeObject:_cardNumber forKey:@"cardNumber"];
    [aCoder encodeObject:_cardLastFourNumbers forKey:@"cardLastFourNumbers"];
    [aCoder encodeObject:@(_active) forKey:@"active"];
    [aCoder encodeObject:_iin forKey:@"iin"];
    [aCoder encodeObject:_client forKey:@"client"];
    [aCoder encodeObject:_metadata forKey:@"metadata"];
}

@end
