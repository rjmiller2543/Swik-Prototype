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
        //[self setFrame:CGRectMake(0, 0, 40, 320)];
        self.backgroundColor = GREEN;
        //self.backgroundColor = [UIColor blueColor];
        /* Add an image */
        _userImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, MESSAGE_CELL_WIDTH, MESSAGE_CELL_WIDTH)];
        _userImage.backgroundColor = [UIColor blackColor];
        [self.contentView addSubview:_userImage];
        
    }
    return self;
}

@end
