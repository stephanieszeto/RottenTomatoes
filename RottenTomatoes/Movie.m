//
//  Movie.m
//  RottenTomatoes
//
//  Created by Stephanie Szeto on 3/16/14.
//  Copyright (c) 2014 projects. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = [dictionary objectForKey:@"title"];
        self.synopsis = [dictionary objectForKey:@"synopsis"];
        
        NSDictionary *posters = [dictionary objectForKey:@"posters"];
        self.thumbnail = [posters objectForKey:@"thumbnail"];
        self.poster = [posters objectForKey:@"original"];
        
        NSArray *castArray = [dictionary objectForKey:@"abridged_cast"];
        NSMutableArray *actors = [NSMutableArray arrayWithCapacity:castArray.count];
        for (NSDictionary *actor in castArray) {
            [actors addObject:[actor objectForKey:@"name"]];
        }
        self.cast = [actors componentsJoinedByString:@", "];
    }
    return self;
}

@end
