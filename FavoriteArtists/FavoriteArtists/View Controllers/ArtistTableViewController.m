//
//  ArtistTableViewController.m
//  FavoriteArtists
//
//  Created by Fabiola S on 2/10/20.
//  Copyright © 2020 Fabiola Saga. All rights reserved.
//

#import "ArtistTableViewController.h"
#import "ArtistTableViewController.h"
#import "ArtistDetailViewController.h"
#import "Artist.h"
#import "ArtistController.h"

@interface ArtistTableViewController ()

@property (nonatomic, readonly) ArtistController *artistController;

@end

@implementation ArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.artistController loadArtist];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.artistController.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    Artist *artist = [self.artistController.artists objectAtIndex:indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %i", artist.yearFormed];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Artist *artist = [self.artistController.artists objectAtIndex:indexPath.row];
        [self.artistController removeArtist:artist];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddArtistSegue"]) {
        ArtistDetailViewController *detailVC = segue.destinationViewController;
        detailVC.artistController = self.artistController;
    }
}

@synthesize artistController = _artistController;
- (ArtistController *)artistController
{
    if (!_artistController) {
        _artistController = [[ArtistController alloc] init];
    }
    return _artistController;
}

@end
