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
        
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

@end
