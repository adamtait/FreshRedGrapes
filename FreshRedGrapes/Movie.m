//
//  Movie.m
//  FreshRedGrapes
//
//  Created by Adam Tait on 1/20/14.
//  Copyright (c) 2014 Adam Tait. All rights reserved.
//

#import "Movie.h"
#import "CastMember.h"
#import "Poster.h"

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.title = [dictionary objectForKey:@"title"];
        self.year = [dictionary objectForKey:@"year"];
        self.runtime = [dictionary objectForKey:@"runtime"];
        self.criticsConsensus = [dictionary objectForKey:@"critics_consensus"];
        self.synopsis = [dictionary objectForKey:@"synopsis"];
        self.mpaaRating = [dictionary objectForKey:@"mpaa_rating"];
        self.castMembers = [[NSMutableArray alloc] init];
        
        NSArray *castMembersArray = (NSArray *)[dictionary objectForKey:@"abridged_cast"];
        for (NSDictionary *actorDictionary in castMembersArray)
        {
            [self.castMembers addObject:[[CastMember alloc] initWithDictionary:actorDictionary]];
        }
        
        self.posters = [[Poster alloc] initWithDictionary:(NSDictionary *)[dictionary objectForKey:@"posters"]];
    }
    return self;
}

- (NSMutableArray *)getActorsNames
{
    NSMutableArray *actorsNames = [[NSMutableArray alloc] init];
    for (CastMember *cast in self.castMembers)
    {
        [actorsNames addObject:cast.actorName];
    }
    return actorsNames;
}

@end
