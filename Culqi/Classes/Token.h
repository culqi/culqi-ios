//
//  Token.h
//  payments
//
//  Created by William Muro on 9/11/16.
//  Copyright © 2016 May. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TokenCard.h"

@interface Token : NSObject

@property (copy) NSString *email;
@property (copy) NSString *objectType;
@property (copy) NSString *id;
@property (copy) NSString *createdAt;
@property (nonatomic, retain) TokenCard *tokenCard;


@end
