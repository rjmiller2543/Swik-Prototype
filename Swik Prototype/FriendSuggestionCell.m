//
//  FriendSuggestionCell.m
//  Swik Prototype
//
//  Created by Robert Miller on 8/10/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import "FriendSuggestionCell.h"

@implementation FriendSuggestionCell

- (instancetype)initWithFrame:(CGRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        // Initialization code
        //[self setFrame:CGRectMake(0, 0, 278, 40)];
        //self.backgroundColor = [UIColor yellowColor];
        self.backgroundColor = LIGHT_GREY;
        /* Add an image */
        _userImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, USER_IMAGE_HEIGHT_WIDTH, USER_IMAGE_HEIGHT_WIDTH)];
        _userImage.backgroundColor = TURUOISE;
        [self.contentView addSubview:_userImage];
        
        _userLabel = [[UILabel alloc] initWithFrame:CGRectMake(USER_IMAGE_HEIGHT_WIDTH + 5, 10, FRIEND_SUGGESTION_CELL_WIDTH - USER_IMAGE_HEIGHT_WIDTH - 5, 12)];
        _userLabel.text = @"User Name";
        _userLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_userLabel];
        
        _friendImage = [[UIImageView alloc] initWithFrame:CGRectMake(USER_IMAGE_HEIGHT_WIDTH + 4, 24, 24, 24)];
        _friendImage.backgroundColor = TURUOISE;
        [self.contentView addSubview:_friendImage];
        
        _locationImage = [[UIImageView alloc] initWithFrame:CGRectMake(USER_IMAGE_HEIGHT_WIDTH + 4, 52, 24, 24)];
        _locationImage.backgroundColor = TURUOISE;
        [self.contentView addSubview:_locationImage];
        
        _otherImage = [[UIImageView alloc] initWithFrame:CGRectMake(USER_IMAGE_HEIGHT_WIDTH + 4, 80, 24, 24)];
        _otherImage.backgroundColor = TURUOISE;
        [self.contentView addSubview:_otherImage];
        
        _friendLabel = [[UILabel alloc] initWithFrame:CGRectMake(USER_IMAGE_HEIGHT_WIDTH + 32, 24, 48, 24)];
        _friendLabel.text = @"10";
        _friendLabel.font = [UIFont boldSystemFontOfSize:15];
        [self.contentView addSubview:_friendLabel];
        
        _locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(USER_IMAGE_HEIGHT_WIDTH + 32, 52, 48, 24)];
        _locationLabel.text = @"4";
        _locationLabel.font = [UIFont boldSystemFontOfSize:15];
        [self.contentView addSubview:_locationLabel];
        
        _otherLabel = [[UILabel alloc] initWithFrame:CGRectMake(USER_IMAGE_HEIGHT_WIDTH + 32, 80, 48, 24)];
        _otherLabel.text = @"18";
        _otherLabel.font = [UIFont boldSystemFontOfSize:15];
        [self.contentView addSubview:_otherLabel];
        
        _addButton = [[UIButton alloc] initWithFrame:CGRectMake(FRIEND_SUGGESTION_CELL_WIDTH - 50, FRIEND_SUGGESTION_CELL_HEIGHT - 30, 50, 30)];
        [_addButton setTitle:@"ADD" forState:UIControlStateNormal];
        [_addButton setTitleColor:WHITE forState:UIControlStateNormal];
        _addButton.backgroundColor = TURUOISE;
        _addButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [self.contentView addSubview:_addButton];
    }
    return self;
}

@end
