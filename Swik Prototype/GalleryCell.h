//
//  GalleryCell.h
//  Swik Prototype
//
//  Created by Robert Miller on 8/10/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwikDefinitions.h"

@interface GalleryCell : UICollectionViewCell

@property (nonatomic, retain) UIImageView *userImage;
@property (nonatomic, retain) UIImageView *galleryImage;
@property (nonatomic, retain) UILabel *userLabel;
@property (nonatomic, retain) UILabel *galleryLabel;
@property (nonatomic, retain) UIImageView *tagImage;
@property (nonatomic, retain) UILabel *dateLabel;

@end
