//
//  CLQToken.h
//  Culqi
//
//  Created by Guillermo Sáenz on 5/2/17.
//  Copyright (c) 2017 Guillermo Sáenz. All rights reserved.
//

#import "CLQBaseModelObject.h"

@class CLQIssuerIdentificationNumber, CLQClient;

NS_ASSUME_NONNULL_BEGIN
@interface CLQToken : CLQBaseModelObject

@property (nonatomic, copy, readonly) NSString *object;
@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy, readonly) NSString *type;
@property (nonatomic, copy, readonly) NSString *email;
@property (nonatomic, strong, readonly) NSDate *creationDate;
@property (nonatomic, copy, readonly) NSString *cardNumber;
@property (nonatomic, copy, readonly) NSString *cardLastFourNumbers;
@property (nonatomic, assign, readonly, getter=isActive) BOOL active;
@property (nonatomic, strong, readonly) CLQIssuerIdentificationNumber *iin;
@property (nonatomic, strong, readonly) CLQClient *client;
@property (nonatomic, strong, readonly) NSDictionary *metadata;

@end
NS_ASSUME_NONNULL_END
