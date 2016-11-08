//
//  UsersViewController.m
//  Posts
//
//  Created by Mina Reda on 11/8/16.
//  Copyright © 2016 Quandoo. All rights reserved.
//

#import "UsersViewController.h"
#import "PostsViewController.h"
#import <KVNProgress.h>
#import "AppStrings.h"
#import "APIManager.h"
#import "UserCell.h"

@interface UsersViewController () {
    
    NSArray *_users;
}

@end

@implementation UsersViewController

static NSString *const UserCellIDentifier = @"USERCELL";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"UserCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:UserCellIDentifier];
    [self setTitle:kUsers];

    // Load users from APIs
    [KVNProgress showWithStatus:kLoadingUsers onView:self.view];
    [[APIManager sharedManager] getUsers:^(NSArray *response) {
        
        [KVNProgress dismiss];
        _users = response;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
        [KVNProgress showErrorWithStatus:[error localizedDescription]];
    }];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UserCell *cell = [tableView dequeueReusableCellWithIdentifier:UserCellIDentifier];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    User *user = [_users objectAtIndex:indexPath.row];
    [cell setUser:user];
    return cell;
}

#pragma mark - UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    return 130.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PostsViewController *postsViewController = [[PostsViewController alloc] initWithStyle:UITableViewStylePlain];
    [postsViewController setUser:[_users objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:postsViewController animated:YES];
}

@end
