//
//  Company.h
//  Posts
//
//  Created by Mina Reda on 11/8/16.
//  Copyright © 2016 Quandoo. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Company : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *catchPhrase;
@property (nonatomic, strong) NSString *bs;

@end
