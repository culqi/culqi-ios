//
//  CLQBaseModelObject.m
//  Culqi
//
//  Created by Guillermo Sáenz on 5/2/17.
//  Copyright (c) 2017 Guillermo Sáenz. All rights reserved.
//

#import "CLQBaseModelObject.h"

@implementation CLQBaseModelObject

+ (NSString *)classNameString {
    return NSStringFromClass([self class]);
}

#pragma mark - NSSecureCoding

+ (instancetype)newWithData:(NSDictionary *)data {
    NSAssert(NO, @"This method must be subclassed");
    return NULL;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSAssert(NO, @"This method must be subclassed");
    return NULL;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    NSAssert(NO, @"This method must be subclassed");
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (instancetype)initWithArchivedVersion:(NSData *)archivedVersion{
    return [NSKeyedUnarchiver unarchiveObjectWithData:archivedVersion];
}

- (NSData *)getArchivedVersion{
    return [NSKeyedArchiver archivedDataWithRootObject:self];
}

@end
