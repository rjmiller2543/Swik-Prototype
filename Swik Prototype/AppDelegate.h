//
//  AppDelegate.h
//  Swik Prototype
//
//  Created by Robert Miller on 7/27/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwikDefinitions.h"
#import "StartBar.h"
#import "ViewController.h"
#import "StartScreenViewController.h"
#import "FilterBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) StartBar *startBar;
@property (nonatomic, retain) FilterBarController *filterBar;

//For now to be used a test array of objects that will be placed into the cells of the start page
//Later on may be used as the app delegate object array filled with objects from JSON or Parse fetch?
@property (nonatomic, retain) NSMutableArray *objectsArray;

@end
