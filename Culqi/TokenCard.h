//
//  TokenCard.h
//  payments
//
//  Created by William Muro on 9/11/16.
//  Copyright © 2016 May. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TokenCard : NSObject

@property (copy) NSString *brand;
@property (copy) NSString *number;
@property (copy) NSString *bin;
@property (copy) NSString *lastName;
@property (copy) NSString *firstName;

@end
