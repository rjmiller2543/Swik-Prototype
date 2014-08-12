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
        [self setFrame:CGRectMake(0, 0, 318, 320)];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

@end
