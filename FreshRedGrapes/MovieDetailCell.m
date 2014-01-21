//
//  MovieDetailCell.m
//  FreshRedGrapes
//
//  Created by Adam Tait on 1/20/14.
//  Copyright (c) 2014 Adam Tait. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetailCell.h"
#import "UIImageView+AFNetworking.h"
#import <AFNetworking.h>

@implementation MovieDetailCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithMovie:(Movie *)movie
{
    self = [super init];
    if (self) {
        self.titleLabel.text = movie.title;
        
        [self.imageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:movie.posters.thumbnail]]
                        placeholderImage:[UIImage imageNamed:@"none"]
                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                               self.imageView.alpha = 0.0;
                               self.imageView.image = image;
                               [UIView animateWithDuration:0.25
                                                animations:^{
                                                    self.imageView.alpha = 1.0;
                                                }];
                           }
                           failure:NULL];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
