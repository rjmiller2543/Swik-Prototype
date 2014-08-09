//
//  PopoverTableViewCell.m
//  Swik Prototype
//
//  Created by Robert Miller on 8/9/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import "PopoverTableViewCell.h"

@implementation PopoverTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setFrame:CGRectMake(0, 0, 30, 15)];
        self.contentView.frame = CGRectMake(0, 0, 30, 15);
        self.textLabel.font = [UIFont systemFontOfSize:10];
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
