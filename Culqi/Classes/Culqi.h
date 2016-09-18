//
//  Culqi.h
//  payments
//
//  Created by William Muro on 9/11/16.
//  Copyright © 2016 May. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Token.h"

@interface Culqi : NSObject <NSURLConnectionDelegate>

@property (nonatomic,strong) NSString *merchantCode;
@property (copy) Card *card;
@property (copy) Token *token;

- (id)initWithMerchantCode:(NSString *)merchantCode;
- (void)createToken:(Card *)card completion:(void(^)(Token *token, NSError *tokenError)) completion;

@end
