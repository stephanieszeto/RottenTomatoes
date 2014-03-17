//
//  MovieViewController.h
//  RottenTomatoes
//
//  Created by Stephanie Szeto on 3/16/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieViewController : UIViewController

@property (nonatomic, strong) Movie *movie;

- (id)initWithMovie:(Movie *)input;

@end
