//
//  CLQResponseHeaders.h
//  Culqi
//
//  Created by Guillermo Sáenz on 5/7/17.
//  Copyright (c) 2017 Guillermo Sáenz. All rights reserved.
//

#import "CLQBaseModelObject.h"

NS_ASSUME_NONNULL_BEGIN
@interface CLQResponseHeaders : CLQBaseModelObject

@property (nonatomic, strong, readonly) NSDate *date;
@property (nonatomic, copy, readonly) NSString *environment; // TODO: change for enum
@property (nonatomic, copy, readonly) NSString *trackingIdentifier;
@property (nonatomic, copy, readonly) NSString *version;
@property (nonatomic, copy, readonly) NSString *contentType;

@end
NS_ASSUME_NONNULL_END
