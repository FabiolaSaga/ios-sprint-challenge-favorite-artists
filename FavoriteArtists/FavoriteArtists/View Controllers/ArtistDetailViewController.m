//
//  ArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Fabiola S on 2/10/20.
//  Copyright © 2020 Fabiola Saga. All rights reserved.
//

#import "ArtistDetailViewController.h"
#import "Artist.h"
#import "ArtistController.h"
#import "Artist+NSJSONSerialization.h"

@interface ArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistName;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *artistBioTextView;

@end

@implementation ArtistDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
    [self updateViews];
}

- (IBAction)save:(UIBarButtonItem *)sender {
    Artist *artist = [[Artist alloc] initWithArtistName:self.artistName.text biography:self.artistBioTextView.text formed:self.artist.yearFormed];
    [self.artistController addArtist:artist];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)updateViews
{
    self.title = self.artist.name ?: @"Add new artist";
    if (!self.isViewLoaded || !self.artist) { return; }
    self.artistName.text = self.artist.name;
    self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %i", self.artist.yearFormed];
    self.artistBioTextView.text = self.artist.bio;
}

- (void)setArtist:(Artist *)artist
{
    if (_artist != artist) {
        _artist = artist;
        [self updateViews];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchTerm = searchBar.text;
    [_artistController fetchArtist:searchTerm completionHandler:^(Artist *artist, NSError *error) {
        self.artist = artist;
        [self updateViews];
    }];
    }



@end
