//
//  Post.h
//  Posts
//
//  Created by Mina Reda on 11/8/16.
//  Copyright © 2016 Quandoo. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Post : MTLModel <MTLJSONSerializing>

@property (nonatomic) int postId;
@property (nonatomic) int userId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;

@end
