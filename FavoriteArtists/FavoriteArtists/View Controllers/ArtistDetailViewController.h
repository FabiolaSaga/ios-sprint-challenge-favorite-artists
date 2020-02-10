//
//  ArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by Fabiola S on 2/10/20.
//  Copyright © 2020 Fabiola Saga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ArtistController;
@class Artist;

@interface ArtistDetailViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic) ArtistController *artistController;
@property (nonatomic) Artist *artist;

@end

