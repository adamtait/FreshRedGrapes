//
//  MoviesRequestOperationManager.h
//  FreshRedGrapes
//
//  Created by Adam Tait on 1/20/14.
//  Copyright (c) 2014 Adam Tait. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
#import "MoviesTableViewController.h"

@interface MoviesRequestOperationManager : NSObject

+ (void)makeRequestForMovies:(MoviesTableViewController*)controller;

@end
