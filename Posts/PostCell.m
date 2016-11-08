//
//  PostCell.m
//  Posts
//
//  Created by Mina Reda on 11/8/16.
//  Copyright © 2016 Quandoo. All rights reserved.
//

#import "PostCell.h"

@implementation PostCell
@dynamic post;

- (void)setPost:(Post *)post {    
 
    _post = post;
    [_labelTitle setText:_post.title];
    [_labelBody setText:_post.body];
    [_labelBody sizeToFit];
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}

@end
