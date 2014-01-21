//
//  MoviesDetailViewController.m
//  FreshRedGrapes
//
//  Created by Adam Tait on 1/19/14.
//  Copyright (c) 2014 Adam Tait. All rights reserved.
//

#import "MovieDetailViewController.h"

@interface MovieDetailViewController ()

- (void)setup;

@end

@implementation MovieDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma create view

- (void)setup
{
    self.navigationItem.title = self.movie.title;
    
}

@end
