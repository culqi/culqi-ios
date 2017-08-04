//
//  CLQHTTPSessionManager.m
//  Culqi
//
//  Created by Guillermo Sáenz on 9/18/16.
//  Copyright (c) 2016 Guillermo Sáenz. All rights reserved.
//

#import "CLQHTTPSessionManager.h"

#import "AFNetworkActivityIndicatorManager.h"

@interface CLQHTTPSessionManager ()

@property (nonatomic, strong) NSString *baseURLString;

@end

@implementation CLQHTTPSessionManager

static CLQHTTPSessionManager *SINGLETON = nil;

static bool isFirstAccess = YES;

#pragma mark - Public Method

+ (CLQHTTPSessionManager *)initWithBaseURLString:(NSString *)baseURLString {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] initWithBaseURLString:baseURLString];
    });
    
    return SINGLETON;
}

+ (CLQHTTPSessionManager *)manager {
    NSAssert(SINGLETON, @"You must initialize this class with the base URL");
    
    return SINGLETON;
}

#pragma mark - Life Cycle

+ (id) allocWithZone:(NSZone *)zone {
    return [self manager];
}

+ (id)copyWithZone:(struct _NSZone *)zone {
    return [self manager];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone {
    return [self manager];
}

- (id)copy {
    return [[CLQHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURLString]];
}

- (id)mutableCopy {
    return [[CLQHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURLString]];
}

- (instancetype)initWithBaseURLString:(NSString *)URLString {
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super initWithBaseURL:[NSURL URLWithString:URLString]];
    if (self) {
        [self setBaseURLString:URLString];
        
        [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
        [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
        
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
        
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }
    return self;
}

@end
