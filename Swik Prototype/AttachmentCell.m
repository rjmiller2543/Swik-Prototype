//
//  AttachmentCell.m
//  Swik Prototype
//
//  Created by Robert Miller on 8/10/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import "AttachmentCell.h"

@implementation AttachmentCell

- (instancetype)initWithFrame:(CGRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        // Initialization code
        //UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280, 40)];
        //imageView.image = [UIImage imageNamed:@"280x40.png"];
        //[self.contentView addSubview:imageView];
        //self.backgroundColor = [UIColor redColor];
        self.backgroundColor = WHITE;
        /* Add a large image and take snapshot of document */
        _attachmentImage = [[UIImageView alloc] initWithFrame:CGRectMake(MESSAGE_CELL_WIDTH + 5, 0, ATTACMENT_CELL_WIDTH - MESSAGE_CELL_WIDTH - 5, ATTACHMENT_CELL_HEIGHT)];
        _attachmentImage.backgroundColor = LIGHT_GREY;
        [self.contentView addSubview:_attachmentImage];
        
        _userImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, ATTACHMENT_CELL_HEIGHT - USER_IMAGE_HEIGHT_WIDTH, USER_IMAGE_HEIGHT_WIDTH, USER_IMAGE_HEIGHT_WIDTH)];
        _userImage.backgroundColor = TURUOISE;
        [self.contentView addSubview:_userImage];
        
        _paperClipImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, MESSAGE_CELL_WIDTH, USER_IMAGE_HEIGHT_WIDTH - 10)];
        _paperClipImage.backgroundColor = GREEN;
        [self.contentView addSubview:_paperClipImage];
        
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, USER_IMAGE_HEIGHT_WIDTH - 8, USER_IMAGE_HEIGHT_WIDTH, 12)];
        _dateLabel.text = STRING_FROM_DATE([NSDate date]);
        _dateLabel.font = [UIFont systemFontOfSize:12];
        _dateLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_dateLabel];
        
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, USER_IMAGE_HEIGHT_WIDTH + 22, USER_IMAGE_HEIGHT_WIDTH, 12)];
        _timeLabel.text = TIME_FROM_DATE([NSDate date]);
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_timeLabel];
        
        _userName = [[UILabel alloc] initWithFrame:CGRectMake(0, USER_IMAGE_HEIGHT_WIDTH + 36, USER_IMAGE_HEIGHT_WIDTH, 12)];
        _userName.text = @"User Name";
        _userName.textAlignment = NSTextAlignmentCenter;
        _userName.font = [UIFont systemFontOfSize:12];
    }
    return self;
}

@end
