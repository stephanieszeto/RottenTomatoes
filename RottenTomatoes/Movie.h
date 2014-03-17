//
//  Movie.h
//  RottenTomatoes
//
//  Created by Stephanie Szeto on 3/16/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSString *cast;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *poster;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
