//
//  Waypoint.h
//  GPX Reader
//
//  Created by Jelle Vandebeeck on 19/01/12.
//  Copyright (c) 2012 fousa. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Fix.h"

@interface Waypoint : Fix <NSCoding>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *type;

@end
