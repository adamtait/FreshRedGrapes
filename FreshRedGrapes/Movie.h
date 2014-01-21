//
//  Movie.h
//  FreshRedGrapes
//
//  Created by Adam Tait on 1/20/14.
//  Copyright (c) 2014 Adam Tait. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Poster.h"

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSNumber *year;
@property (nonatomic, strong) NSNumber *runtime;
@property (nonatomic, strong) NSString *mpaaRating;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSString *criticsConsensus;
@property (nonatomic, strong) Poster *posters;
@property (nonatomic, strong) NSMutableArray *castMembers;

- (id)initWithDictionary:(NSDictionary *)dictionary;

- (NSMutableArray *)getActorsNames;

@end
