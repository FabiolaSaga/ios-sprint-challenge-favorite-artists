//
//  ArtistController.m
//  FavoriteArtists
//
//  Created by Fabiola S on 2/10/20.
//  Copyright © 2020 Fabiola Saga. All rights reserved.
//

#import "ArtistController.h"
#import "Artist.h"
#import "Artist+NSJSONSerialization.h"

static NSString *baseURLString = @"https://theaudiodb.com/api/v1/json/1/search.php";

@interface ArtistController ()
@property (nonatomic) NSMutableArray<Artist *> *artists;
@end

@implementation ArtistController

- (instancetype)init
{
    if (self = [super init])
    {
        _artists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)fetchArtist:(NSString *)artist completionHandler:(CompletionHandler)completionHandler
{
    NSURLComponents *URLComponents = [[NSURLComponents alloc] initWithString:baseURLString];
    NSMutableArray *queryItems = [NSMutableArray arrayWithObjects: [NSURLQueryItem queryItemWithName:@"s" value:artist], nil];
    
    URLComponents.queryItems = queryItems;
    NSURL *URL = URLComponents.URL;
    
    [[NSURLSession.sharedSession dataTaskWithURL:URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error) {
        NSLog(@"Error fetching artists: %@", error);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(nil, error);
        });
        
        return;
    }
        
        NSError *jsonError = nil;
        NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (!results) {
            NSLog(@"Error decoding json: %@", jsonError);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, jsonError);
            });
            
            return;
        }
        
        NSLog(@"%@", results);
        
        NSDictionary *resultArtist = [results objectForKey:@"artists"][0];
        Artist *newArtist = [[Artist alloc] initWithDictionary:resultArtist];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(newArtist, nil);
        });
    }] resume];
}


@end
