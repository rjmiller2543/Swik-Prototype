//
//  StartBar.m
//  Swik Prototype
//
//  Created by Robert Miller on 7/28/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import "StartBar.h"

@implementation StartBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //self.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:1.0];
        self.backgroundColor = WHITE;
        self.viewForBaselineLayout.backgroundColor = WHITE;
        self.alpha = 1.0;
        self.tintColor = GREEN;
        self.barTintColor = WHITE;
        _swipeRightForSearchBar = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(ShowSearchBar)];
        [_swipeRightForSearchBar setEnabled:YES];
        _swipeRightForSearchBar.direction = UISwipeGestureRecognizerDirectionRight;
        [self addGestureRecognizer:_swipeRightForSearchBar];
        
        _swipeLeftForSearchBar = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(RemoveSearchBar)];
        [_swipeLeftForSearchBar setEnabled:NO];
        _swipeLeftForSearchBar.direction = UISwipeGestureRecognizerDirectionLeft;
        [self addGestureRecognizer:_swipeLeftForSearchBar];
        
        _settingButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settings.png"] landscapeImagePhone:nil style:UIBarButtonItemStylePlain target:self action:@selector(testSettings)];
        self.items = @[ //flex
                       [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil],
                        //test 0
                       [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(testAction)],
                        //flex
                       [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil],
                        //test 1
                       [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(testAction1)],
                        //flex
                       [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil],
                        //test 2
                       [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(testAction2)],
                        //flex
                       [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil],
                        //test 3
                       [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(testAction3)],
                        //flex
                       [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil],
                        //test settings
                       //[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settings.png"] landscapeImagePhone:nil style:UIBarButtonItemStylePlain target:self action:@selector(testSettings)],
                       _settingButton,
                       [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil],
                       [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil]
                       ];
    }
    return self;
}

-(void)testAction
{
    
    NSLog(@"up testing...");
    [[AppDelegate sharedInstance] loadStartScreenViewController];
}

-(void)testAction1
{
    NSLog(@"up test 1..");
    [[AppDelegate sharedInstance] loadMessagesViewController];
}

-(void)testAction2
{
    NSLog(@"up test 2..");
}

-(void)testAction3
{
    NSLog(@"up test 3...");
}

-(void)testSettings
{
    NSLog(@"test settings button");
    PopoverTableViewController *popoverViewController = [[PopoverTableViewController alloc] init];
    _popoverController = [[WYPopoverController alloc] initWithContentViewController:popoverViewController];
    _popoverController.delegate = self;
    [_popoverController setPopoverContentSize:CGSizeMake(90, 168)];
    [_popoverController presentPopoverFromBarButtonItem:_settingButton permittedArrowDirections:WYPopoverArrowDirectionUnknown animated:YES];
}

- (BOOL)popoverControllerShouldDismissPopover:(WYPopoverController *)controller
{
    return YES;
}

- (void)popoverControllerDidDismissPopover:(WYPopoverController *)controller
{
    _popoverController.delegate = nil;
    _popoverController = nil;
}

-(void)ShowSearchBar
{
    NSLog(@"Show Search Bar");
    [_swipeLeftForSearchBar setEnabled:YES];
    [_swipeRightForSearchBar setEnabled:NO];
    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 12, 0, 46)];
    [self addSubview:_searchBar];
    CGRect movedSearchBar = CGRectMake(10, 12, 240, 46);
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         // do whatever animation you want, e.g.,
                         NSLog(@"moving");
                         _searchBar.frame = movedSearchBar;
                     }
                     completion:^(BOOL finished){
                         if(!finished)
                             return;
                     }];
}

-(void)RemoveSearchBar
{
    NSLog(@"Remove SearchBar");
    [_swipeRightForSearchBar setEnabled:YES];
    [_swipeLeftForSearchBar setEnabled:NO];
    
    CGRect movedSearchBar = CGRectMake(10, 12, 0, 46);
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         // do whatever animation you want, e.g.,
                         NSLog(@"moving");
                         _searchBar.frame = movedSearchBar;
                     }
                     completion:^(BOOL finished){
                         if(finished)
                             [_searchBar removeFromSuperview];
                     }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
