//
//  CastMember.h
//  FreshRedGrapes
//
//  Created by Adam Tait on 1/20/14.
//  Copyright (c) 2014 Adam Tait. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CastMember : NSObject

@property (nonatomic, strong) NSString *characterName;
@property (nonatomic, strong) NSString *actorName;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
