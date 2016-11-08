//
//  UserCell.h
//  Posts
//
//  Created by Mina Reda on 11/8/16.
//  Copyright © 2016 Quandoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface UserCell : UITableViewCell {
    
    User *_user;
}

@property (nonatomic, strong) User *user;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelUsername;
@property (weak, nonatomic) IBOutlet UILabel *labelEmail;
@property (weak, nonatomic) IBOutlet UILabel *labelAddress;

@end
