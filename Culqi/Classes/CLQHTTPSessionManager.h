//
//  CLQHTTPSessionManager.h
//  
//
//  Created by Guillermo Saenz on 9/18/16.
//  Copyright (c) 2016 Guillermo Saenz. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN
@interface CLQHTTPSessionManager : AFHTTPSessionManager

+ (CLQHTTPSessionManager *)initWithBaseURLString:(NSString *)baseURLString;
+ (CLQHTTPSessionManager *)manager;

@end
NS_ASSUME_NONNULL_END
