//
//  Address.h
//  Posts
//
//  Created by Mina Reda on 11/8/16.
//  Copyright © 2016 Quandoo. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "Location.h"

@interface Address : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *street;
@property (nonatomic, strong) NSString *suite;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *zipcode;
@property (nonatomic, strong) Location *location;

- (NSString *)addressString;

@end
