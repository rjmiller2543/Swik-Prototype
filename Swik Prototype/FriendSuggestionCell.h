//
//  FriendSuggestionCell.h
//  Swik Prototype
//
//  Created by Robert Miller on 8/10/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwikDefinitions.h"

@interface FriendSuggestionCell : UICollectionViewCell

@property (nonatomic, retain) UIImageView *userImage;
@property (nonatomic, retain) UILabel *userLabel;
@property (nonatomic, retain) UIImageView *friendImage;
@property (nonatomic, retain) UIImageView *locationImage;
@property (nonatomic, retain) UIImageView *otherImage;
@property (nonatomic, retain) UIButton *addButton;
@property (nonatomic, retain) UILabel *friendLabel;
@property (nonatomic, retain) UILabel *locationLabel;
@property (nonatomic, retain) UILabel *otherLabel;

@end
