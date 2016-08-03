//
//  Track.m
//  GPX Reader
//
//  Created by Jelle Vandebeeck on 19/01/12.
//  Copyright (c) 2012 fousa. All rights reserved.
//

#import "Track.h"
#import "MKPolyline+NSCoding.h"


@implementation Track

#pragma mark - Initialization

- (id)init {
    if (self = [super init]) {
        self.fixes = [NSMutableArray array];
    }
    return self;
}

#pragma mark - String

- (NSString *)description {
    return [NSString stringWithFormat:@"<Track (fixes %lu)>", (unsigned long)_fixes.count];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.fixes forKey:@"fixes"];
    [coder encodeObject:self.path forKey:@"path"];
    [coder encodeObject:self.shadowPath forKey:@"shadowPath"];
    
    NSData *regionData = [NSData dataWithBytes:&_region length:sizeof(self.region)];
    [coder encodeObject:regionData forKey:@"region"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init])
    {
        _fixes = [decoder decodeObjectForKey:@"fixes"];
        _path = [decoder decodeObjectForKey:@"path"];
        _shadowPath = [decoder decodeObjectForKey:@"shadowPath"];
        
        NSData *regionData = [decoder decodeObjectForKey:@"region"];
        [regionData getBytes:&_region length:sizeof(self.region)];
    }
    return self;
}

@end
