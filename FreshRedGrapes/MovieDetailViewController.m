//
//  MoviesDetailViewController.m
//  FreshRedGrapes
//
//  Created by Adam Tait on 1/19/14.
//  Copyright (c) 2014 Adam Tait. All rights reserved.
//

#import "MovieDetailViewController.h"

@interface MovieDetailViewController ()

- (void)addNavigationTitle:(NSString *)titleText;
- (void)addScrollView:(Movie *)movie;

- (UILabel *)createTitleViewFromOrigin:(CGFloat)yOrigin title:(NSString *)title;
- (UIView *)createImageViewFromOrigin:(CGFloat)yOrigin imageURL:(NSString *)imageURL;

@end

@implementation MovieDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"movie title / %@ /", self.movie.title);
    
    [self addNavigationTitle:self.movie.title];
    [self addScrollView:self.movie];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma setup

- (void)addNavigationTitle:(NSString *)titleText
{
    int maxTitleWidth = self.navigationController.navigationBar.frame.size.width;
    
    CGSize requestedTitleSize = [titleText sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0f]}];
    CGFloat titleWidth = MIN(maxTitleWidth, requestedTitleSize.width);
    
    UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, titleWidth, 20)];
    navLabel.backgroundColor = [UIColor grayColor];
    navLabel.textColor = [UIColor blackColor];
    navLabel.font = [UIFont fontWithName:@"Helvetica" size:17];
    navLabel.textAlignment = NSTextAlignmentCenter;
    navLabel.text = titleText;
    self.navigationController.navigationItem.titleView = navLabel;
}


- (void)addScrollView:(Movie *)movie
{
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scroll.pagingEnabled = YES;
    
    UILabel *titleView = [self createTitleViewFromOrigin:10 title:self.movie.title];
    [scroll addSubview:titleView];
    
    UIView *imageView = [self createImageViewFromOrigin:50 imageURL:self.movie.posters.detailed];
    [scroll addSubview:imageView];

    scroll.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);
    [self.view addSubview:scroll];
}


#pragma create sub views

- (UILabel *)createTitleViewFromOrigin:(CGFloat)yOrigin title:(NSString *)title
{
    CGSize requestedTitleSize = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:26.0f]}];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, yOrigin, self.view.frame.size.width, requestedTitleSize.height)];
    titleLabel.text = title;
    titleLabel.font = [UIFont fontWithName:@"Helvetica" size:26];
    titleLabel.adjustsFontSizeToFitWidth = YES;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    return titleLabel;
}

- (UIView *)createImageViewFromOrigin:(CGFloat)yOrigin imageURL:(NSString *)imageURL
{
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
    UIImage *poster = [UIImage imageWithData:imageData];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:poster];
    CGFloat xOrigin = (self.view.frame.size.width - poster.size.width) / 2;
    imageView.frame = CGRectMake(xOrigin, yOrigin, poster.size.width, poster.size.height);
    
    return imageView;
}

@end
