//
//  MovieCell.h
//  RottenTomatoes
//
//  Created by Stephanie Szeto on 3/16/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *synopsis;
@property (weak, nonatomic) IBOutlet UILabel *cast;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;

@end
