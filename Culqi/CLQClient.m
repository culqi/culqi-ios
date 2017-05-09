//
//  CLQClient.m
//  Culqi
//
//  Created by Guillermo Sáenz on 5/2/17.
//  Copyright (c) 2017 Guillermo Sáenz. All rights reserved.
//

#import "CLQClient.h"

@implementation CLQClient

+ (instancetype)newWithData:(NSDictionary *)data {
    
    NSString *ip = [data objectForKey:@"ip"];
    NSString *ipCountry = [data objectForKey:@"ip_country"];
    NSString *ipCountryCode = [data objectForKey:@"ip_country_code"];
    NSString *browser = [data objectForKey:@"browser"];
    NSString *deviceFingerprint = [data objectForKey:@"device_fingerprint"];
    NSString *deviceType = [data objectForKey:@"device_type"];
    
    return [[CLQClient alloc] initWithIP:ip ipCountry:ipCountry ipCountryCode:ipCountryCode browser:browser deviceFingerprint:deviceFingerprint deviceType:deviceType];
}

- (instancetype)initWithIP:(NSString *)ip ipCountry:(NSString *)ipCountry ipCountryCode:(NSString *)ipCountryCode browser:(NSString *)browser deviceFingerprint:(NSString *)deviceFingerprint deviceType:(NSString *)deviceType {
    
    self = [super init];
    if (self) {
        if ([ip isKindOfClass:[NSString class]])_ip = ip;
        if ([ipCountry isKindOfClass:[NSString class]])_ipCountry = ipCountry;
        if ([ipCountryCode isKindOfClass:[NSString class]])_ipCountryCode = ipCountryCode;
        if ([browser isKindOfClass:[NSString class]])_browser = browser;
        if ([deviceFingerprint isKindOfClass:[NSString class]])_deviceFingerprint = deviceFingerprint;
        if ([deviceType isKindOfClass:[NSString class]])_deviceType = deviceType;
    }
    return self;
}

#pragma mark - NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _ip = [aDecoder decodeObjectOfClass:[self class] forKey:@"ip"];
        _ipCountry = [aDecoder decodeObjectOfClass:[self class] forKey:@"ipCountry"];
        _ipCountryCode = [aDecoder decodeObjectOfClass:[self class] forKey:@"ipCountryCode"];
        _browser = [aDecoder decodeObjectOfClass:[self class] forKey:@"browser"];
        _deviceFingerprint = [aDecoder decodeObjectOfClass:[self class] forKey:@"deviceFingerprint"];
        _deviceType = [aDecoder decodeObjectOfClass:[self class] forKey:@"deviceType"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_ip forKey:@"ip"];
    [aCoder encodeObject:_ipCountry forKey:@"ipCountry"];
    [aCoder encodeObject:_ipCountryCode forKey:@"ipCountryCode"];
    [aCoder encodeObject:_browser forKey:@"browser"];
    [aCoder encodeObject:_deviceFingerprint forKey:@"deviceFingerprint"];
    [aCoder encodeObject:_deviceType forKey:@"deviceType"];
}

@end
