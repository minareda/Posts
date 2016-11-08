//
//  Address.m
//  Posts
//
//  Created by Mina Reda on 11/8/16.
//  Copyright © 2016 Quandoo. All rights reserved.
//

#import "Address.h"

@implementation Address

- (NSString *)addressString   {
    
    return [NSString stringWithFormat:@"%@, %@, %@ %@", _street, _suite, _city, _zipcode];
}

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"street": @"street",
             @"suite": @"suite",
             @"city": @"city",
             @"zipcode": @"zipcode",
             @"location" : @"geo"
             };
}

#pragma mark - JSON Transformers

+ (NSValueTransformer *)geoJSONTransformer {
    
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Location.class];
}

@end
