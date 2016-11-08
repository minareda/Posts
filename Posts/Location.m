//
//  Location.m
//  Posts
//
//  Created by Mina Reda on 11/8/16.
//  Copyright © 2016 Quandoo. All rights reserved.
//

#import "Location.h"

@implementation Location

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"latitude": @"lat",
             @"longitude": @"lng",
             };
}

@end
