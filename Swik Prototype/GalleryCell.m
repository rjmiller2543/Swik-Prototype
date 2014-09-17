//
//  GalleryCell.m
//  Swik Prototype
//
//  Created by Robert Miller on 8/10/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import "GalleryCell.h"

@implementation GalleryCell

- (instancetype)initWithFrame:(CGRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        // Initialization code
        //[self setFrame:CGRectMake(0, 0, 318, 40)];
        //self.backgroundColor = [UIColor magentaColor];
        self.backgroundColor = WHITE;
        /* Add an image for Picture and determine if it's an image or video and add accordingly */
        _userImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, USER_IMAGE_HEIGHT_WIDTH, USER_IMAGE_HEIGHT_WIDTH)];
        _userImage.backgroundColor = TURUOISE;
        [self.contentView addSubview:_userImage];
    }
    return self;
}

@end
