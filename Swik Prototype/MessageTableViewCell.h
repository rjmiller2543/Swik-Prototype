//
//  MessageTableViewCell.h
//  Swik Prototype
//
//  Created by Robert Miller on 9/4/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageTableViewCell : UITableViewCell

@property (nonatomic, retain) UIImageView *userImage;
@property (nonatomic, retain) UILabel *userLabel;
@property (nonatomic, retain) UILabel *messageLabel;
@property (nonatomic, retain) UILabel *dateLabel;
@property (nonatomic, retain) UIImageView *statusBar;

@end
