//
//  CLQToken.h
//  payments
//
//  Created by William Muro on 9/11/16.
//  Copyright © 2016 May. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CQLTokenCard;

@interface CLQToken : NSObject

@property (nonatomic, readonly) NSString *email;
@property (nonatomic, readonly) NSString *objectType;
@property (nonatomic, readonly) NSString *identifier;
@property (nonatomic, readonly) NSString *createdAt;

@property (nonatomic, strong, readonly) CQLTokenCard *tokenCard;

@end
