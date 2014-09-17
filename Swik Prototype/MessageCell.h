//
//  MessageCell.h
//  Swik Prototype
//
//  Created by Robert Miller on 8/10/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwikDefinitions.h"

@interface MessageCell : UICollectionViewCell

@property (nonatomic, retain) UIImageView *userImage;
@property (nonatomic, retain) UIImageView *chatBubbleImage;
@property (nonatomic, retain) UILabel *dateLabel;
@property (nonatomic, retain) UILabel *timeLabel;
@property (nonatomic, retain) UILabel *replyToLabel;
@property (nonatomic, retain) UILabel *userName;

@end
