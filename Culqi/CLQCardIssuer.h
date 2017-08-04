//
//  CLQCardIssuer.h
//  Culqi
//
//  Created by Guillermo Sáenz on 5/2/17.
//  Copyright (c) 2017 Guillermo Sáenz. All rights reserved.
//

#import "CLQBaseModelObject.h"

NS_ASSUME_NONNULL_BEGIN
@interface CLQCardIssuer : CLQBaseModelObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *country;
@property (nonatomic, copy, readonly) NSString *countryCode;
@property (nonatomic, strong, readonly) NSURL *websiteURL;
@property (nonatomic, copy, readonly) NSString *phoneNumber;

@end
NS_ASSUME_NONNULL_END
