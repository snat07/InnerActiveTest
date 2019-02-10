//
//  MainViewController.m
//  Inner-Active-Test
//
//  Created by Sebastian Natalevich on 11/7/17.
//  Copyright © 2017 Sebastian Natalevich. All rights reserved.
//

#import "MainViewController.h"
#import "ImageCell.h"
#import "VideoCell.h"
#import "VideoViewController.h"

static int const       kNumberOfRows = 15;
static NSString *const kCellImageCellIdentifier = @"imageCell";
static NSString *const kCellVideoCellIdentifier = @"videoCell";

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ImageCell" bundle:nil] forCellReuseIdentifier:kCellImageCellIdentifier];
    [self.tableView registerClass:[VideoCell class] forCellReuseIdentifier:kCellVideoCellIdentifier];
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kNumberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row != 2) {
        ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellImageCellIdentifier];
        [cell initWithIndex:indexPath.row];
        
        return cell;
    } else {
        VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellVideoCellIdentifier];
        [cell initVideoCell];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 2) {
        VideoCell *videoCell = (VideoCell *)cell;
        [videoCell stopVideo];
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
        
        VideoCell *videoCell = [tableView cellForRowAtIndexPath:indexPath];
        [videoCell stopVideo];
        VideoViewController *videoViewController = [[VideoViewController alloc] init];
        [videoViewController setInitTime:[videoCell getCurrentTime]];
        [self.navigationController presentViewController:videoViewController animated:YES completion:nil];
    }
}

@end
