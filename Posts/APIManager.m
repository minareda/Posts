//
//  APIManager.m
//  Posts
//
//  Created by Mina Reda on 11/8/16.
//  Copyright © 2016 Quandoo. All rights reserved.
//

#import "APIManager.h"
#import "APIConstants.h"

@implementation APIManager

- (id)init {
    
    self = [super initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    if(!self) return nil;
    
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    
    return self;
}

+ (id)sharedManager {
    
    static APIManager *_apiManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _apiManager = [[self alloc] init];
    });
    
    return _apiManager;
}

- (NSURLSessionDataTask *)getUsers:(void (^)(NSArray* response))success failure:(void (^)(NSError *error))failure   {
    
    return [self GET:kGetUsersURL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@", responseObject);
        NSMutableArray *users = [[NSMutableArray alloc] init];
        for (NSDictionary *userJson in responseObject) {

            User *user = [MTLJSONAdapter modelOfClass:User.class fromJSONDictionary:userJson error:nil];
            [users addObject:user];
        }
        success(users);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
}

- (NSURLSessionDataTask *)getPostsForUser:(User *)user success:(void (^)(NSArray* response))success failure:(void (^)(NSError *error))failure    {
    
    NSString *url = [NSString stringWithFormat:kGetPostsURL, user.userId];
    return [self GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@", responseObject);
        NSMutableArray *posts = [[NSMutableArray alloc] init];
        for (NSDictionary *postJson in responseObject) {
            
            Post *post = [MTLJSONAdapter modelOfClass:Post.class fromJSONDictionary:postJson error:nil];
            [posts addObject:post];
        }
        success(posts);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
}

@end
