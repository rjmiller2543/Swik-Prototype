//
//  MessageCell.m
//  Swik Prototype
//
//  Created by Robert Miller on 8/10/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

- (instancetype)initWithFrame:(CGRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        // Initialization code
        self.backgroundColor = WHITE;
        /* Add an image */
        _userImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, MESSAGE_CELL_HEIGHT - MESSAGE_CELL_WIDTH, USER_IMAGE_HEIGHT_WIDTH, USER_IMAGE_HEIGHT_WIDTH)];
        _userImage.backgroundColor = TURUOISE;
        [self.contentView addSubview:_userImage];
        
        _chatBubbleImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, MESSAGE_CELL_WIDTH, 60)];
        _chatBubbleImage.backgroundColor = GREEN;
        [self.contentView addSubview:_chatBubbleImage];
        
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 63, MESSAGE_CELL_WIDTH, 12)];
        _dateLabel.text = STRING_FROM_DATE([NSDate date]);
        _dateLabel.font = [UIFont boldSystemFontOfSize:14];
        _dateLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_dateLabel];
        
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 77, MESSAGE_CELL_WIDTH, 12)];
        _timeLabel.text = TIME_FROM_DATE([NSDate date]);
        _timeLabel.font = [UIFont boldSystemFontOfSize:14];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_timeLabel];
        
        _replyToLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, MESSAGE_CELL_HEIGHT - USER_IMAGE_HEIGHT_WIDTH - 24, MESSAGE_CELL_WIDTH, 12)];
        _replyToLabel.text = @"Reply to";
        _replyToLabel.textColor = TURUOISE;
        _replyToLabel.textAlignment = NSTextAlignmentCenter;
        _replyToLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_replyToLabel];
        
        _userName = [[UILabel alloc] initWithFrame:CGRectMake(0, MESSAGE_CELL_HEIGHT - USER_IMAGE_HEIGHT_WIDTH - 12, MESSAGE_CELL_WIDTH, 12)];
        _userName.text = @"User Name";
        _userName.textAlignment = NSTextAlignmentCenter;
        _userName.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_userName];
    }
    return self;
}

@end
