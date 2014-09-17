//
//  ProximityCell.h
//  Swik Prototype
//
//  Created by Robert Miller on 8/10/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwikDefinitions.h"
#import <MapKit/MapKit.h>

@interface ProximityCell : UICollectionViewCell <MKMapViewDelegate>

@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) UIImageView *userImage;
@property (nonatomic, retain) UILabel *userLabel;
@property (nonatomic, retain) UILabel *locationLabel;
@property (nonatomic, retain) UILabel *dateLabel;
@property (nonatomic, retain) UILabel *viaLabel;

@end
