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
        self.backgroundColor = WHITE;
        /* Add a map */
        _mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, PROXIMITY_CELL_WIDTH, PROXIMITY_CELL_HEIGHT - USER_IMAGE_HEIGHT_WIDTH - 5)];
        [self.contentView addSubview:_mapView];
        
        _userImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, PROXIMITY_CELL_HEIGHT - USER_IMAGE_HEIGHT_WIDTH, USER_IMAGE_HEIGHT_WIDTH, USER_IMAGE_HEIGHT_WIDTH)];
        _userImage.backgroundColor = TURUOISE;
        [self.contentView addSubview:_userImage];
        
        _userLabel = [[UILabel alloc] initWithFrame:CGRectMake(USER_IMAGE_HEIGHT_WIDTH + 5, PROXIMITY_CELL_HEIGHT - USER_IMAGE_HEIGHT_WIDTH, PROXIMITY_CELL_WIDTH - USER_IMAGE_HEIGHT_WIDTH -5, 12)];
        _userLabel.text = @"User Name";
        _userLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_userLabel];
        
        _locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(USER_IMAGE_HEIGHT_WIDTH + 5, (PROXIMITY_CELL_HEIGHT - USER_IMAGE_HEIGHT_WIDTH) + 14, PROXIMITY_CELL_WIDTH - USER_IMAGE_HEIGHT_WIDTH - 5, 0)];
        
        NSMutableString *initString = [[NSMutableString alloc] initWithString:@"was at "];
        NSString *finalInitString = [[NSString alloc] initWithString:[initString stringByAppendingString:@"This Place Set for a Test"]];
        NSMutableAttributedString *locationString = [[NSMutableAttributedString alloc] initWithString:finalInitString];
        [locationString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, 7)];
        [locationString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:12] range:NSMakeRange(7, finalInitString.length - 7)];
        [locationString addAttribute:NSForegroundColorAttributeName value:TURUOISE range:NSMakeRange(7, finalInitString.length - 7)];
        _locationLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _locationLabel.numberOfLines = 0;
        _locationLabel.attributedText = locationString;
        [_locationLabel sizeToFit];
        [self.contentView addSubview:_locationLabel];
        
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(USER_IMAGE_HEIGHT_WIDTH + 5, (PROXIMITY_CELL_HEIGHT - USER_IMAGE_HEIGHT_WIDTH) + 14 + _locationLabel.frame.size.height + 12, 2 * USER_IMAGE_HEIGHT_WIDTH / 3, 0)];
        NSString *dateString = @"You were here  on ";
        dateString = [dateString stringByAppendingString:STRING_FROM_DATE([NSDate date])];
        _dateLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _dateLabel.numberOfLines = 0;
        _dateLabel.text = dateString;
        _dateLabel.font = [UIFont systemFontOfSize:9];
        [_dateLabel sizeToFit];
        [self.contentView addSubview:_dateLabel];
        
        _viaLabel = [[UILabel alloc] initWithFrame:CGRectMake(USER_IMAGE_HEIGHT_WIDTH + 5, (PROXIMITY_CELL_HEIGHT - USER_IMAGE_HEIGHT_WIDTH) + 20 + _locationLabel.frame.size.height + _dateLabel.frame.size.height + 8, USER_IMAGE_HEIGHT_WIDTH, 12)];
        NSString *viaString = STRING_FROM_DATE([NSDate date]);
        viaString = [viaString stringByAppendingString:@" via Facebook"];
        _viaLabel.text = viaString;
        _viaLabel.font = [UIFont systemFontOfSize:9];
        [self.contentView addSubview:_viaLabel];
    }
    return self;
}

@end
