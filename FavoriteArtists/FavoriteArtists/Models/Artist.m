//
//  Artist.m
//  FavoriteArtists
//
//  Created by Fabiola S on 2/10/20.
//  Copyright © 2020 Fabiola Saga. All rights reserved.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithArtistName:(NSString *)artist biography:(NSString *)biography formed:(int)formed
{
    if (self = [super init])
    {
        _name = artist.copy;
        _bio = biography.copy;
        _yearFormed = formed;
    }
    
    return self;
}

@end
