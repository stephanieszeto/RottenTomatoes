//
//  MoviesViewController.m
//  RottenTomatoes
//
//  Created by Stephanie Szeto on 3/15/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieViewController.h"
#import "Movie.h"
#import "MovieCell.h"
#import "UIKit+AFNetworking.h"
#import "SVProgressHUD.h"

@interface MoviesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *moviesArray;
@property (nonatomic, strong) NSMutableArray *movies;

@end

@implementation MoviesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Movies";
    }
    return self;
}

- (void)refresh:(UIRefreshControl *)refreshControl {
    [refreshControl endRefreshing];
    [self loadMovies];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // set data source, delegate
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // set up custom table cell
    UINib *customNib = [UINib nibWithNibName:@"MovieCell" bundle:nil];
    [self.tableView registerNib:customNib forCellReuseIdentifier:@"MovieCell"];
    
    // add pull to refresh
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
    // load data from Rotten Tomatoes
    [self loadMovies];
    
}

- (void)loadMovies {
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.moviesArray = [json objectForKey:@"movies"];
        self.movies = [NSMutableArray arrayWithCapacity:self.moviesArray.count];
        
        for (NSDictionary *movieDict in self.moviesArray) {
            Movie *movie = [[Movie alloc] initWithDictionary:movieDict];
            [self.movies addObject:movie];
        }
        
        [self.tableView reloadData];
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View methods

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"MovieCell";
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Movie *movie = self.movies[indexPath.row];
    
    // configure cell
    cell.title.text = [NSString stringWithFormat:@"%@", movie.title];
    
    cell.synopsis.text = [NSString stringWithFormat:@"%@", movie.synopsis];
    cell.synopsis.lineBreakMode = NSLineBreakByTruncatingTail;
    cell.synopsis.numberOfLines = 3;
    
    cell.cast.text = [NSString stringWithFormat:@"%@", movie.cast];
    
    NSURL *imageURL = [NSURL URLWithString:movie.thumbnail];
    [cell.thumbnail setImageWithURL:imageURL];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //MovieCell *cell = (MovieCell *) [tableView cellForRowAtIndexPath:indexPath];
    //NSLog(@"Y%@",cell.title.text);
    
    MovieViewController *mvc = [[MovieViewController alloc] initWithMovie:self.movies[indexPath.row]];
    [self.navigationController pushViewController:mvc animated:YES];
    [SVProgressHUD show];
}

@end
