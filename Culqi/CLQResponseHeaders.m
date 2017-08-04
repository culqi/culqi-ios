//
//  CLQResponseHeaders.m
//  Culqi
//
//  Created by Guillermo Sáenz on 5/7/17.
//  Copyright (c) 2017 Guillermo Sáenz. All rights reserved.
//

#import "CLQResponseHeaders.h"

@implementation CLQResponseHeaders

+ (instancetype)newWithData:(NSDictionary *)data {
    
    NSNumber *unixDate = [data objectForKey:@"Date"]; // TODO: check this: Date = "Tue, 09 May 2017 15:29:19 GMT";
    NSString *environment = [data objectForKey:@"X-CULQI-ENVIRONMENT"];
    NSString *trackingIdentifier = [data objectForKey:@"X-CULQI-TRACKING-ID"];
    NSString *version = [data objectForKey:@"X-CULQI-VERSION"];
    NSString *contentType = [data objectForKey:@"Content-Type"];
    
    return [[CLQResponseHeaders alloc] initWithUnixDate:unixDate environment:environment trackingIdentifier:trackingIdentifier version:version contentType:contentType];
}

- (instancetype)initWithUnixDate:(NSNumber *)unixDate
                     environment:(NSString *)environment
              trackingIdentifier:(NSString *)trackingIdentifier
                         version:(NSString *)version
                     contentType:(NSString *)contentType {
    
    self = [super init];
    if (self) {
        if ([unixDate isKindOfClass:[NSNumber class]])_date = [NSDate dateWithTimeIntervalSince1970:unixDate.doubleValue];
        if ([environment isKindOfClass:[NSString class]])_environment = environment;
        if ([trackingIdentifier isKindOfClass:[NSString class]])_trackingIdentifier = trackingIdentifier;
        if ([version isKindOfClass:[NSString class]])_version = version;
        if ([contentType isKindOfClass:[NSString class]])_contentType = contentType;
    }
    return self;
}

#pragma mark - NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _date = [aDecoder decodeObjectOfClass:[self class] forKey:@"date"];
        _environment = [aDecoder decodeObjectOfClass:[self class] forKey:@"environment"];
        _trackingIdentifier = [aDecoder decodeObjectOfClass:[self class] forKey:@"trackingIdentifier"];
        _version = [aDecoder decodeObjectOfClass:[self class] forKey:@"version"];
        _contentType = [aDecoder decodeObjectOfClass:[self class] forKey:@"contentType"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_date forKey:@"date"];
    [aCoder encodeObject:_environment forKey:@"environment"];
    [aCoder encodeObject:_trackingIdentifier forKey:@"trackingIdentifier"];
    [aCoder encodeObject:_version forKey:@"version"];
    [aCoder encodeObject:_contentType forKey:@"contentType"];
}

@end
