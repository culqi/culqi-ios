//
//  CLQCardIssuer.m
//  Culqi
//
//  Created by Guillermo Sáenz on 5/2/17.
//  Copyright (c) 2017 Guillermo Sáenz. All rights reserved.
//

#import "CLQCardIssuer.h"

@implementation CLQCardIssuer

+ (instancetype)newWithData:(NSDictionary *)data {
    
    NSString *name = [data objectForKey:@"name"];
    NSString *country = [data objectForKey:@"country"];
    NSString *countryCode = [data objectForKey:@"country_code"];
    NSString *website = [data objectForKey:@"website"];
    NSString *phoneNumber = [data objectForKey:@"phone_number"];
    
    return [[CLQCardIssuer alloc] initWithName:name country:country countryCode:countryCode website:website phoneNumber:phoneNumber];
}

- (instancetype)initWithName:(NSString *)name country:(NSString *)country countryCode:(NSString *)countryCode website:(NSString *)website phoneNumber:(NSString *)phoneNumber {
    
    self = [super init];
    if (self) {
        if ([name isKindOfClass:[NSString class]])_name = name;
        if ([country isKindOfClass:[NSString class]])_country = country;
        if ([countryCode isKindOfClass:[NSString class]])_countryCode = countryCode;
        if ([website isKindOfClass:[NSString class]])_websiteURL = [NSURL URLWithString:website];
        if ([phoneNumber isKindOfClass:[NSString class]])_phoneNumber = phoneNumber;
    }
    return self;
}

#pragma mark - NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _name = [aDecoder decodeObjectOfClass:[self class] forKey:@"name"];
        _country = [aDecoder decodeObjectOfClass:[self class] forKey:@"country"];
        _countryCode = [aDecoder decodeObjectOfClass:[self class] forKey:@"countryCode"];
        _websiteURL = [aDecoder decodeObjectOfClass:[self class] forKey:@"websiteURL"];
        _phoneNumber = [aDecoder decodeObjectOfClass:[self class] forKey:@"phoneNumber"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_country forKey:@"country"];
    [aCoder encodeObject:_countryCode forKey:@"countryCode"];
    [aCoder encodeObject:_websiteURL forKey:@"websiteURL"];
    [aCoder encodeObject:_phoneNumber forKey:@"phoneNumber"];
}

@end
