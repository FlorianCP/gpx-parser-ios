//
//  Waypoint.m
//  GPX Reader
//
//  Created by Jelle Vandebeeck on 19/01/12.
//  Copyright (c) 2012 fousa. All rights reserved.
//

#import "Waypoint.h"

@implementation Waypoint

#pragma mark - String

- (NSString *)description {
    return [NSString stringWithFormat:@"<Waypoint (%@ %f %f)>", _name, self.latitude, self.longitude];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)coder
{
    [super encodeWithCoder:coder];
    
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.desc forKey:@"desc"];
    [coder encodeObject:self.comment forKey:@"comment"];
    [coder encodeObject:self.type forKey:@"type"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super initWithCoder:decoder])
    {
        _name = [decoder decodeObjectForKey:@"name"];
        _desc = [decoder decodeObjectForKey:@"desc"];
        _comment = [decoder decodeObjectForKey:@"comment"];
        _type = [decoder decodeObjectForKey:@"type"];
    }
    return self;
}

@end
