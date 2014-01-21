//
//  MoviesRequestOperationManager.m
//  FreshRedGrapes
//
//  Created by Adam Tait on 1/20/14.
//  Copyright (c) 2014 Adam Tait. All rights reserved.
//

#import "MoviesRequestOperationManager.h"
#import "MoviesTableViewController.h"
#import "Movie.h"
#import "AFNetworking.h"

@implementation MoviesRequestOperationManager

+ (void)makeRequestForMovies:(MoviesTableViewController*)controller
{
//    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=g9au4hv6khv6wzvzgt55gpqs&limit=50";

    NSURL *URL = [NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=g9au4hv6khv6wzvzgt55gpqs&limit=50"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *movies = [[NSMutableArray alloc] init];
        for (NSDictionary *params in [responseObject objectForKey:@"movies"]) {
            Movie *movie = [[Movie alloc] initWithDictionary:params];
            [movies addObject:movie];
        }
        [controller loadMovies:[NSArray arrayWithArray:movies]];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [controller networkError];
    }];
    [[NSOperationQueue mainQueue] addOperation:op];
    }

@end
