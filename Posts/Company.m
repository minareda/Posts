//
//  Company.m
//  Posts
//
//  Created by Mina Reda on 11/8/16.
//  Copyright © 2016 Quandoo. All rights reserved.
//

#import "Company.h"

@implementation Company

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"name": @"name",
             @"catchPhrase": @"catchPhrase",
             @"bs": @"bs"
             };
}

@end
