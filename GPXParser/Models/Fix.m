//
//  Fix.m
//  GPX Reader
//
//  Created by Jelle Vandebeeck on 11/01/12.
//  Copyright (c) 2012 fousa. All rights reserved.
//

#import "Fix.h"

@implementation Fix

#pragma mark - Coordinate

- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake(_latitude, _longitude);
}

#pragma mark - String

- (NSString *)description {
    return [NSString stringWithFormat:@"<Fix (%f %f)>", _latitude, _longitude];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeDouble:self.latitude forKey:@"latitude"];
    [coder encodeDouble:self.longitude forKey:@"longitude"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init])
    {
        _latitude = [decoder decodeDoubleForKey:@"latitude"];
        _longitude = [decoder decodeDoubleForKey:@"longitude"];
    }
    return self;
}

@end
