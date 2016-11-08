//
//  User.h
//  Posts
//
//  Created by Mina Reda on 11/8/16.
//  Copyright © 2016 Quandoo. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "Address.h"
#import "Company.h"

@interface User : MTLModel <MTLJSONSerializing>

@property (nonatomic) int userId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) Address *address;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *website;
@property (nonatomic, strong) Company *company;

@end
