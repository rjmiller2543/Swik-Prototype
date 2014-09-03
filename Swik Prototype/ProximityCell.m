//
//  ProximityCell.m
//  Swik Prototype
//
//  Created by Robert Miller on 8/10/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import "ProximityCell.h"

@implementation ProximityCell

- (instancetype)initWithFrame:(CGRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        // Initialization code
        //[self setFrame:CGRectMake(0, 0, 278, 320)];
        //self.backgroundColor = [UIColor greenColor];
        self.backgroundColor = GREEN;
        /* Add a map */
        _mapView = [[MKMapView alloc] initWithFrame:CGRectMake(PROXIMITY_CELL_WIDTH - PROXIMITY_CELL_HEIGHT, 0, PROXIMITY_CELL_HEIGHT, PROXIMITY_CELL_HEIGHT)];
        [self.contentView addSubview:_mapView];
    }
    return self;
}

@end
