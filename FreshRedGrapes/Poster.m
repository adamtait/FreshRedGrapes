//
//  Poster.m
//  FreshRedGrapes
//
//  Created by Adam Tait on 1/20/14.
//  Copyright (c) 2014 Adam Tait. All rights reserved.
//

#import "Poster.h"

@implementation Poster

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.thumbnail = (NSString *)[dictionary objectForKey:@"thumbnail"];
        self.detailed = (NSString *)[dictionary objectForKey:@"detailed"];
        self.original = (NSString *)[dictionary objectForKey:@"original"];
        self.profile = (NSString *)[dictionary objectForKey:@"profile"];
    }
    return self;
}

@end
