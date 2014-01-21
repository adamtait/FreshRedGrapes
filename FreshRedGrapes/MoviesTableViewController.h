//
//  MoviesTableViewController.h
//  FreshRedGrapes
//
//  Created by Adam Tait on 1/19/14.
//  Copyright (c) 2014 Adam Tait. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoviesTableViewController : UITableViewController

- (void)loadMovies:(NSArray *)movies;
- (void)networkError;

@end
