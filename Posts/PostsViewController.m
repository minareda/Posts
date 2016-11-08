//
//  PostsViewController.m
//  Posts
//
//  Created by Mina Reda on 11/8/16.
//  Copyright © 2016 Quandoo. All rights reserved.
//

#import "PostsViewController.h"
#import <KVNProgress.h>
#import "AppStrings.h"
#import "APIManager.h"
#import "PostCell.h"

@interface PostsViewController () {
    
    NSArray *_posts;
}

@end

@implementation PostsViewController

static NSString *const PostCellIDentifier = @"POSTCELL";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setTitle:[NSString stringWithFormat:@"%@ Posts", _user.username]];
    [self.tableView registerNib:[UINib nibWithNibName:@"PostCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:PostCellIDentifier];

    self.tableView.estimatedRowHeight = 200.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    // Load Posts for the selected user from APIs
    [KVNProgress showWithStatus:kLoadingPosts onView:self.view];
    [[APIManager sharedManager] getPostsForUser:_user success:^(NSArray *response) {
        
        [KVNProgress dismiss];
        _posts = response;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
        [KVNProgress showErrorWithStatus:[error localizedDescription]];
    }];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:PostCellIDentifier];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    Post *post = [_posts objectAtIndex:indexPath.row];
    [cell setPost:post];
    return cell;
}

#pragma mark - UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath  {

    return UITableViewAutomaticDimension;
}

@end
