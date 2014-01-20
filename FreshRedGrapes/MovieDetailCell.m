//
//  MovieDetailCell.m
//  FreshRedGrapes
//
//  Created by Adam Tait on 1/20/14.
//  Copyright (c) 2014 Adam Tait. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieDetailCell.h"

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
        UIImage *poster = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:movie.posters.detailed]]];
        [self.imageView initWithImage:poster];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
