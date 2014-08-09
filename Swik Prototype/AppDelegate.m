//
//  AppDelegate.m
//  Swik Prototype
//
//  Created by Robert Miller on 7/27/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    StartScreenViewController *viewController = [[StartScreenViewController alloc] init];
    viewController.edgesForExtendedLayout = UIRectEdgeAll;
    viewController.extendedLayoutIncludesOpaqueBars = NO;
    [viewController.view setBounds:CGRectMake(0, STARTBAR_HEIGHT, self.window.screen.bounds.size.width, self.window.screen.bounds.size.height - STARTBAR_HEIGHT)];
    viewController.view.frame = viewController.view.bounds;
    viewController.view.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:1.0 alpha:1.0];
    [self.window setRootViewController:viewController];
    [self.window addSubview:viewController.view];
    
    StartBar *startBar = [[StartBar alloc] initWithFrame:CGRectMake(0, 0, 350, 62)];
    //startBar.translucent = NO;
    startBar.barStyle = UIBarStyleBlackOpaque;
    startBar.barTintColor = [UIColor redColor];
    //startBar.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
    //startBar.backgroundColor = [UIColor blackColor];
    [self.window addSubview:startBar];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
