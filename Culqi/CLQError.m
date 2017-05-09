//
//  CLQError.m
//  Culqi
//
//  Created by Guillermo Sáenz on 5/7/17.
//  Copyright (c) 2017 Guillermo Sáenz. All rights reserved.
//

#import "CLQError.h"

@implementation CLQError

+ (instancetype)newWithData:(NSDictionary *)data {
    
    NSString *object = [data objectForKey:@"object"];
    NSString *type = [data objectForKey:@"type"];
    NSString *chargeIdentifier = [data objectForKey:@"charge_id"];
    NSString *code = [data objectForKey:@"code"];
    NSString *declinedCode = [data objectForKey:@"declined_code"];
    NSString *merchantMessage = [data objectForKey:@"merchant_message"];
    NSString *userMessage = [data objectForKey:@"user_message"];
    NSString *parameter = [data objectForKey:@"param"];
    
    return [[CLQError alloc] initWithObject:object type:type chargeIdentifier:chargeIdentifier code:code declinedCode:declinedCode merchantMessage:merchantMessage userMessage:userMessage parameter:parameter];
}

- (instancetype)initWithObject:(NSString *)object
                          type:(NSString *)type
              chargeIdentifier:(NSString *)chargeIdentifier
                          code:(NSString *)code
                  declinedCode:(NSString *)declinedCode
               merchantMessage:(NSString *)merchantMessage
                   userMessage:(NSString *)userMessage
                     parameter:(NSString *)parameter {
    
    self = [super init];
    if (self) {
        if ([object isKindOfClass:[NSString class]])_object = object;
        if ([type isKindOfClass:[NSString class]])_type = type;
        if ([chargeIdentifier isKindOfClass:[NSString class]])_chargeIdentifier = chargeIdentifier;
        if ([code isKindOfClass:[NSString class]])_code = code;
        if ([declinedCode isKindOfClass:[NSString class]])_declinedCode = declinedCode;
        if ([merchantMessage isKindOfClass:[NSString class]])_merchantMessage = merchantMessage;
        if ([userMessage isKindOfClass:[NSString class]])_userMessage = userMessage;
        if ([parameter isKindOfClass:[NSString class]])_parameter = parameter;
    }
    return self;
}

#pragma mark - NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _object = [aDecoder decodeObjectOfClass:[self class] forKey:@"object"];
        _type = [aDecoder decodeObjectOfClass:[self class] forKey:@"type"];
        _chargeIdentifier = [aDecoder decodeObjectOfClass:[self class] forKey:@"chargeIdentifier"];
        _code = [aDecoder decodeObjectOfClass:[self class] forKey:@"code"];
        _declinedCode = [aDecoder decodeObjectOfClass:[self class] forKey:@"declinedCode"];
        _merchantMessage = [aDecoder decodeObjectOfClass:[self class] forKey:@"merchantMessage"];
        _userMessage = [aDecoder decodeObjectOfClass:[self class] forKey:@"userMessage"];
        _parameter = [aDecoder decodeObjectOfClass:[self class] forKey:@"parameter"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_object forKey:@"object"];
    [aCoder encodeObject:_type forKey:@"type"];
    [aCoder encodeObject:_chargeIdentifier forKey:@"chargeIdentifier"];
    [aCoder encodeObject:_code forKey:@"code"];
    [aCoder encodeObject:_declinedCode forKey:@"declinedCode"];
    [aCoder encodeObject:_merchantMessage forKey:@"merchantMessage"];
    [aCoder encodeObject:_userMessage forKey:@"userMessage"];
    [aCoder encodeObject:_parameter forKey:@"parameter"];
}

@end
