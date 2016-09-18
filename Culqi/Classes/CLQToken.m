//
//  CLQToken.m
//  payments
//
//  Created by William Muro on 9/11/16.
//  Copyright © 2016 May. All rights reserved.
//

#import "CLQToken.h"

@implementation CLQToken

#pragma mark - Lifecycle

- (instancetype)initWithIdentifier:(NSString *)identifier email:(NSString *)email createdAt:(NSString *)createdAt objectType:(NSString *)objectType {
    
    self = [super init];
    if (self) {
        _identifier = identifier;
        _createdAt = createdAt;
        _objectType = objectType;
        _email = email;
    }
    return self;
}

+ (instancetype)newWithIdentifier:(NSString *)identifier email:(NSString *)email createdAt:(NSString *)createdAt objectType:(NSString *)objectType {
    
    return [[CLQToken alloc] initWithIdentifier:identifier
                                          email:email
                                      createdAt:createdAt
                                     objectType:objectType];
}

@end
