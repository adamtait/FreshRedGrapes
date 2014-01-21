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

- (CGFloat)addTitleViewAsSubview:(UIScrollView *)view yOrigin:(CGFloat)yOrigin title:(NSString *)title;
- (CGFloat)addImageViewAsSubview:(UIScrollView *)view yOrigin:(CGFloat)yOrigin imageURL:(NSString *)imageURL;
- (CGFloat)addShortLabelViewAsSubview:(UIScrollView *)view yOrigin:(CGFloat)yOrigin name:(NSString *)name value:(NSString *)value;
- (CGFloat)addLongLabelViewAsSubview:(UIScrollView *)view yOrigin:(CGFloat)yOrigin name:(NSString *)name value:(NSString *)value;

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
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.pagingEnabled = YES;
    
    NSMutableArray *subviewHeights = [[NSMutableArray alloc] init];
    [subviewHeights addObject:[NSNumber numberWithFloat:[self addTitleViewAsSubview:scrollView yOrigin:10.0 title:self.movie.title]]];
    
    CGFloat nextOrigin = 50.0;
    [subviewHeights addObject:[NSNumber numberWithFloat:[self addImageViewAsSubview:scrollView yOrigin:nextOrigin imageURL:self.movie.posters.detailed]]];
    
    nextOrigin = (nextOrigin + [[subviewHeights lastObject] floatValue] + 15.0);
    [subviewHeights addObject:[NSNumber numberWithFloat:[self addShortLabelViewAsSubview:scrollView yOrigin:nextOrigin name:@"MPAA Rating" value:self.movie.mpaaRating]]];

    nextOrigin = (nextOrigin + [[subviewHeights lastObject] floatValue] + 15.0);
    NSString *actorsNames = [self.movie.getActorsNames componentsJoinedByString:@", "];
    [subviewHeights addObject:[NSNumber numberWithFloat:[self addLongLabelViewAsSubview:scrollView yOrigin:nextOrigin name:@"Actors" value:actorsNames]]];
    
    nextOrigin = (nextOrigin + [[subviewHeights lastObject] floatValue] + 15.0);
    [subviewHeights addObject:[NSNumber numberWithFloat:[self addLongLabelViewAsSubview:scrollView yOrigin:nextOrigin name:@"Synopsis" value:self.movie.synopsis]]];
    
    
    CGFloat totalheight = 0.0;
    for (NSNumber *height in subviewHeights)
    {
        totalheight = totalheight + [height floatValue];
    }
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, (totalheight + 200));
    [self.view addSubview:scrollView];
}


#pragma create sub views

- (CGFloat)addTitleViewAsSubview:(UIScrollView *)view yOrigin:(CGFloat)yOrigin title:(NSString *)title
{
    CGSize estimatedSize = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:26.0f]}];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, yOrigin, self.view.frame.size.width, estimatedSize.height)];
    titleLabel.text = title;
    titleLabel.font = [UIFont fontWithName:@"Helvetica" size:26];
    titleLabel.adjustsFontSizeToFitWidth = YES;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [view addSubview:titleLabel];
    return estimatedSize.height;
}

- (CGFloat)addImageViewAsSubview:(UIScrollView *)view yOrigin:(CGFloat)yOrigin imageURL:(NSString *)imageURL
{
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
    UIImage *poster = [UIImage imageWithData:imageData];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:poster];
    CGFloat xOrigin = (self.view.frame.size.width - poster.size.width) / 2;
    imageView.frame = CGRectMake(xOrigin, yOrigin, poster.size.width, poster.size.height);
    
    [view addSubview:imageView];
    return poster.size.height;
}

- (CGFloat)addShortLabelViewAsSubview:(UIScrollView *)view yOrigin:(CGFloat)yOrigin name:(NSString *)name value:(NSString *)value
{
    CGSize estimatedNameSize = [name sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20.0f]}];
    CGSize estimatedValueSize = [value sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20.0f]}];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, (estimatedNameSize.width + 15), estimatedNameSize.height)];
    nameLabel.text = [name stringByAppendingString:@":"];
    nameLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    
    UILabel *valueLabel = [[UILabel alloc] initWithFrame:CGRectMake((estimatedNameSize.width + 20), 0, (self.view.frame.size.width - estimatedNameSize.width - 20), estimatedValueSize.height)];
    valueLabel.text = value;
    valueLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    
    UIView *labelView = [[UIView alloc] initWithFrame:CGRectMake(0, yOrigin, self.view.frame.size.width, estimatedValueSize.height)];
    [labelView addSubview:nameLabel];
    [labelView addSubview:valueLabel];
    
    [view addSubview:labelView];
    return estimatedValueSize.height;
}

- (CGFloat)addLongLabelViewAsSubview:(UIScrollView *)view yOrigin:(CGFloat)yOrigin name:(NSString *)name value:(NSString *)value
{
    CGSize estimatedNameSize = [name sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20.0f]}];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, (self.view.frame.size.width - 10), estimatedNameSize.height)];
    nameLabel.text = [name stringByAppendingString:@":"];
    nameLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    
    
    CGSize estimatedValueSize = [value sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.0f]}];
    CGFloat valueLabelWidth = (self.view.frame.size.width - 10);
    int numberOfLines = ceilf(estimatedValueSize.width / valueLabelWidth);
    CGFloat valueLabelHeight = estimatedValueSize.height * numberOfLines;
    NSLog(@"valueLabel width / %0.2f / height / %0.2f / number of lines / %d /", valueLabelWidth, valueLabelHeight, numberOfLines);

    UILabel *valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, (estimatedNameSize.height + 5), valueLabelWidth, valueLabelHeight)];
    valueLabel.text = value;
    valueLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    valueLabel.lineBreakMode = NSLineBreakByWordWrapping;
    valueLabel.preferredMaxLayoutWidth = valueLabelWidth;
    valueLabel.numberOfLines = numberOfLines;
    
    UIView *labelView = [[UIView alloc] initWithFrame:CGRectMake(0, yOrigin, self.view.frame.size.width, estimatedValueSize.height)];
    [labelView addSubview:nameLabel];
    [labelView addSubview:valueLabel];
    
    [view addSubview:labelView];
    return valueLabelHeight + estimatedNameSize.height + 5.0;
}

@end
