//
//  MovieViewController.m
//  RottenTomatoes
//
//  Created by Stephanie Szeto on 3/16/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import "MovieViewController.h"
#import "Movie.h"
#import "UIKit+AFNetworking.h"
#import "SVProgressHUD.h"

@interface MovieViewController ()

@property (weak, nonatomic) IBOutlet UILabel *summary;
@property (weak, nonatomic) IBOutlet UIImageView *poster;
@property (weak, nonatomic) IBOutlet UILabel *cast;

@end

@implementation MovieViewController

- (id)initWithMovie:(Movie *)input {
    self = [super init];
    if (self) {
        self.title = input.title;
        self.movie = input;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // set up summary
    self.summary.text = self.movie.synopsis;
    self.summary.lineBreakMode = NSLineBreakByTruncatingTail;
    self.summary.numberOfLines = 5;
    
    // set up cast
    self.cast.text = self.movie.cast;
    self.cast.lineBreakMode = NSLineBreakByTruncatingTail;
    self.cast.numberOfLines = 3;
    
    // set background poster
    NSURL *imageURL = [NSURL URLWithString:self.movie.poster];
    [self.poster setImageWithURL:imageURL];
}

- (void)viewDidAppear:(BOOL)animated {
    [SVProgressHUD dismiss];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
