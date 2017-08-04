//
//  CLQClient.h
//  Culqi
//
//  Created by Guillermo Sáenz on 5/2/17.
//  Copyright (c) 2017 Guillermo Sáenz. All rights reserved.
//

#import "CLQBaseModelObject.h"

NS_ASSUME_NONNULL_BEGIN
@interface CLQClient : CLQBaseModelObject

@property (nonatomic, copy, readonly) NSString *ip;
@property (nonatomic, copy, readonly) NSString *ipCountry;
@property (nonatomic, copy, readonly) NSString *ipCountryCode;
@property (nonatomic, copy, readonly) NSString *browser;
@property (nonatomic, copy, readonly) NSString *deviceFingerprint;
@property (nonatomic, copy, readonly) NSString *deviceType;

@end
NS_ASSUME_NONNULL_END
