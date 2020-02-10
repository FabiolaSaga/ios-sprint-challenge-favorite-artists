//
//  ArtistController.h
//  FavoriteArtists
//
//  Created by Fabiola S on 2/10/20.
//  Copyright © 2020 Fabiola Saga. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;

typedef void (^CompletionHandler)(Artist *artist, NSError *error);

@interface ArtistController : NSObject

// Add array property
@property (nonatomic, readonly, copy) NSArray<Artist *> *artists;

// Add methods
- (void)fetchArtist:(NSString *)artist completionHandler:(CompletionHandler)completionHandler;
- (void)loadArtist;
- (void)addArtist:(Artist *)aArtist;
- (void)removeArtist:(Artist *)aArtist;

@end


