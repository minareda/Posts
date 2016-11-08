//
//  APIManager.h
//  Posts
//
//  Created by Mina Reda on 11/8/16.
//  Copyright © 2016 Quandoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "User.h"
#import "Post.h"

@interface APIManager : AFHTTPSessionManager

+ (id)sharedManager;
- (NSURLSessionDataTask *)getUsers:(void (^)(NSArray* response))success failure:(void (^)(NSError *error))failure;
- (NSURLSessionDataTask *)getPostsForUser:(User *)user success:(void (^)(NSArray* response))success failure:(void (^)(NSError *error))failure;

@end
