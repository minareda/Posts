//
//  Post.m
//  Posts
//
//  Created by Mina Reda on 11/8/16.
//  Copyright © 2016 Quandoo. All rights reserved.
//

#import "Post.h"

@implementation Post

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"postId": @"id",
             @"userId": @"userId",
             @"title": @"title",
             @"body": @"body"
             };
}

@end
