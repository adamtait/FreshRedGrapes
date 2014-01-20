//
//  CastMember.m
//  FreshRedGrapes
//
//  Created by Adam Tait on 1/20/14.
//  Copyright (c) 2014 Adam Tait. All rights reserved.
//

#import "CastMember.h"

@implementation CastMember

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.characterName = (NSString*)[[dictionary objectForKey:@"characters"] firstObject];
        self.actorName = (NSString*)[dictionary objectForKey:@"name"];
    }
    return self;
}

@end
