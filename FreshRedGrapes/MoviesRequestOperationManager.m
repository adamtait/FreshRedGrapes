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

@implementation MoviesRequestOperationManager

+ (void)makeRequestForMovies:(MoviesTableViewController*)controller
{
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *jsonResponse = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

        NSMutableArray *movies = [[NSMutableArray alloc] init];
        for (NSDictionary *params in [jsonResponse objectForKey:@"movies"]) {
            Movie *movie = [[Movie alloc] initWithDictionary:params];
            [movies addObject:movie];
        }
        [controller loadMovies:[NSArray arrayWithArray:movies]];
    }];
}

@end
