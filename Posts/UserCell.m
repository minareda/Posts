//
//  UserCell.m
//  Posts
//
//  Created by Mina Reda on 11/8/16.
//  Copyright © 2016 Quandoo. All rights reserved.
//

#import "UserCell.h"

@implementation UserCell
@dynamic user;

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (void)setUser:(User *)user {
    
    _user = user;
    [_labelName setText:_user.name];
    [_labelUsername setText:_user.username];
    [_labelEmail setText:_user.email];
    [_labelAddress setText:[_user.address addressString]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}

@end
