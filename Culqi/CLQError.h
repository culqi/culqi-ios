//
//  CLQError.h
//  Culqi
//
//  Created by Guillermo Sáenz on 5/7/17.
//  Copyright (c) 2017 Guillermo Sáenz. All rights reserved.
//

#import "CLQBaseModelObject.h"

NS_ASSUME_NONNULL_BEGIN
@interface CLQError : CLQBaseModelObject

@property (nonatomic, copy, readonly) NSString *object;
@property (nonatomic, copy, readonly) NSString *type;
@property (nonatomic, copy, readonly) NSString *chargeIdentifier;
@property (nonatomic, copy, readonly) NSString *code;
@property (nonatomic, copy, readonly) NSString *declinedCode;
@property (nonatomic, copy, readonly) NSString *merchantMessage;
@property (nonatomic, copy, readonly) NSString *userMessage;
@property (nonatomic, copy, readonly) NSString *parameter;

@end
NS_ASSUME_NONNULL_END
