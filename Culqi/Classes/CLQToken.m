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

- (instancetype)initWithIdentifier:(NSString *)identifier email:(NSString *)email createdAt:(NSString *)createdAt objectType:(NSString *)objectType tokenCard:(nonnull CQLTokenCard *)tokenCard {
    
    self = [super init];
    if (self) {
        _identifier = identifier;
        _createdAt = createdAt;
        _objectType = objectType;
        _email = email;
        _tokenCard = tokenCard;
    }
    return self;
}

+ (instancetype)newWithIdentifier:(NSString *)identifier email:(NSString *)email createdAt:(NSString *)createdAt objectType:(NSString *)objectType tokenCard:(nonnull CQLTokenCard *)tokenCard {
    
    return [[CLQToken alloc] initWithIdentifier:identifier
                                          email:email
                                      createdAt:createdAt
                                     objectType:objectType
                                      tokenCard:tokenCard];
}

@end
