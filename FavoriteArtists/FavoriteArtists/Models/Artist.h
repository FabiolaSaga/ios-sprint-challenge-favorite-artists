//
//  Artist.h
//  FavoriteArtists
//
//  Created by Fabiola S on 2/10/20.
//  Copyright © 2020 Fabiola Saga. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Artist : NSObject

// Add init

-(instancetype)initWithArtistName:(NSString *)artist biography:(NSString *)biography formed:(int)formed;

// Add properties

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *bio;
@property (nonatomic) int formed;

@end


