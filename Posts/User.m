//
//  User.m
//  Posts
//
//  Created by Mina Reda on 11/8/16.
//  Copyright © 2016 Quandoo. All rights reserved.
//

#import "User.h"

@implementation User

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"userId" : @"id",
             @"name": @"name",
             @"username": @"username",
             @"address" : @"address",
             @"email": @"email",
             @"phone": @"phone",
             @"company" : @"company",
             @"website": @"website"
             };
}

#pragma mark - JSON Transformers

+ (NSValueTransformer *)addressJSONTransformer {
    
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Address.class];
}

+ (NSValueTransformer *)companyJSONTransformer {
    
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Company.class];
}

@end
