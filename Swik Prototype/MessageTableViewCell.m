//
//  MessageTableViewCell.m
//  Swik Prototype
//
//  Created by Robert Miller on 9/4/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        /* Find out if the message is new, if so, bold text */
        /* Find out if the message has a response, if not, green bar */
        /* Set the frame */
        /* Set the label to sender's/group's name */
        /* Set the second label to the last message in the thread */
        /* Set an image to the sender's image */
        /* Set a third label to the time if it was today, otherwise yesterday if it was yesterday else the date */
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
