//
//  StartBar.h
//  Swik Prototype
//
//  Created by Robert Miller on 7/28/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopoverTableViewController.h"
#import "WYPopoverController.h"

@interface StartBar : UIToolbar <WYPopoverControllerDelegate>

@property (nonatomic, retain) UIBarButtonItem *settingButton;
@property (nonatomic, retain) WYPopoverController *popoverController;

@end
