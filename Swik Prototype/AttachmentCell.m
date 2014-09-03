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
        self.backgroundColor = GREEN;
        /* Add a large image and take snapshot of document */
        _attachmentImage = [[UIImageView alloc] initWithFrame:CGRectMake(ATTACMENT_CELL_WIDTH - ATTACHMENT_CELL_HEIGHT, 0, ATTACHMENT_CELL_HEIGHT, ATTACHMENT_CELL_HEIGHT)];
        _attachmentImage.backgroundColor = [UIColor blackColor];
        
        [self.contentView addSubview:_attachmentImage];
        
    }
    return self;
}

@end
