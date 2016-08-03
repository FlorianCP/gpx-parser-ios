//
//  GPX.m
//  GPX Reader
//
//  Created by Jelle Vandebeeck on 29/01/12.
//  Copyright (c) 2012 fousa. All rights reserved.
//

#import "GPX.h"

@implementation GPX

#pragma mark - Initialization

- (id)init {
    if (self = [super init]) {
        self.tracks    = [NSMutableArray array];
        self.routes    = [NSMutableArray array];
        self.waypoints = [NSMutableArray array];
    }
    return self;
}

#pragma mark - String

- (NSString *)description {
    return [NSString stringWithFormat:@"<GPX (tracks %lu routes %lu waypoints %lu)>", (unsigned long)_tracks.count, (unsigned long)_routes.count, (unsigned long)_waypoints.count];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.tracks forKey:@"tracks"];
    [coder encodeObject:self.routes forKey:@"routes"];
    [coder encodeObject:self.waypoints forKey:@"waypoints"];
    [coder encodeObject:self.filename forKey:@"filename"];
    
    [coder encodeDouble:self.distance forKey:@"distance"];
    
    // region to NSData
    NSData *regionData = [NSData dataWithBytes:&_region length:sizeof(self.region)];
    [coder encodeObject:regionData forKey:@"region"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init])
    {
        _tracks = [decoder decodeObjectForKey:@"tracks"];
        _routes = [decoder decodeObjectForKey:@"routes"];
        _waypoints = [decoder decodeObjectForKey:@"waypoints"];
        _filename = [decoder decodeObjectForKey:@"filename"];
        
        _distance = [decoder decodeDoubleForKey:@"distance"];
        
        NSData *regionData = [decoder decodeObjectForKey:@"region"];
        [regionData getBytes:&_region length:sizeof(self.region)];
    }
    return self;
}

@end
