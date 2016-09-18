//
//  Culqi.m
//  payments
//
//  Created by William Muro on 9/11/16.
//  Copyright © 2016 May. All rights reserved.
//

#import "Culqi.h"

@implementation Culqi

@synthesize card = _card;
@synthesize token = _token;
@synthesize merchantCode = _merchantCode;

- (id)initWithMerchantCode:(NSString *)merchantCode {
    self = [super init];
    if(self)
    {
        self.merchantCode = merchantCode;
    }
    return self;
}

- (void) performHttpRequest:(NSDictionary *)postDict completion:(void(^)(NSDictionary *dict, NSError *error)) completion
{
    NSError *error;
    NSString *authHeader;
    NSData *jsonData;
    NSURL *tokenUrl;
    
    NSMutableURLRequest *request;
    
    jsonData = [NSJSONSerialization dataWithJSONObject:postDict options:0 error:&error];
    
    if (!jsonData) {
        if (completion)
            completion(nil, error);
        return;
    }
    
    tokenUrl = [NSURL URLWithString:@"https://integ-pago.culqi.com/api/v1/tokens"];
    request = [NSMutableURLRequest requestWithURL:tokenUrl
                                          cachePolicy:NSURLRequestUseProtocolCachePolicy
                                      timeoutInterval:60.0];
    
    authHeader   = [NSString stringWithFormat:@"Bearer %@", _merchantCode];
    
    [request setValue:authHeader forHTTPHeaderField:@"Authorization"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:jsonData];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if (!data) {
             
             if (completion)
             {
                 completion(nil, error);
             }
             return;
         }
         
         NSError *parseError = nil;
         NSDictionary *returnDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
         
         if (completion) {
             completion(returnDict, parseError);
         }
     }];
}



- (void)createToken:(Card *)card completion:(void(^)(Token *token, NSError *tokenError)) completion {
 
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];

    NSDictionary *dictionary = @{@"correo_electronico":card.email,
                                 @"nombre":card.firstName,
                                 @"apellido":card.lastName,
                                 @"cvv":[f numberFromString:card.cvc],
                                 @"m_exp":[f numberFromString:card.expMonth],
                                 @"a_exp":[f numberFromString:card.expYear],
                                 @"numero":[f numberFromString:card.number]};
    
    [self performHttpRequest:dictionary completion:^(NSDictionary *dict, NSError *error) {
        
        if (error) {
            
            NSString *domain = @"Lorem";
            
            int errorCode = 4;
            
            NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
            
            [userInfo setObject:@"Maximum parameter is not greater than minimum parameter"
                             forKey:NSLocalizedDescriptionKey];
                
            
            NSError *errorResponse = [[NSError alloc] initWithDomain:domain
                                                   code:errorCode
                                               userInfo:userInfo];
                
            completion(nil,errorResponse);
            
            return;
            
        }
        
        NSLog( @"%@", dict );
        
        NSDictionary *tokenCardDictionary = dict[@"tarjeta"];

        TokenCard *tokenCard = [[TokenCard alloc] init];
        [tokenCard setNumber:tokenCardDictionary[@"numero"]];
        [tokenCard setBin:tokenCardDictionary[@"bin"]];
        [tokenCard setBrand:tokenCardDictionary[@"marca"]];
        [tokenCard setLastName:tokenCardDictionary[@"apellido"]];
        [tokenCard setFirstName:tokenCardDictionary[@"nombre"]];
        
        Token *token = [[Token alloc] init];
        [token setId:dict[@"id"]];
        [token setEmail:dict[@"correo_electronico"]];
        [token setObjectType:dict[@"objeto"]];
        [token setTokenCard:tokenCard];
        
        completion(token,nil);
        
    }];
    
}

@end
