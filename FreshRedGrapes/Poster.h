//
//  Poster.h
//  FreshRedGrapes
//
//  Created by Adam Tait on 1/20/14.
//  Copyright (c) 2014 Adam Tait. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Poster : NSObject

@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *detailed;
@property (nonatomic, strong) NSString *original;
@property (nonatomic, strong) NSString *profile;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
