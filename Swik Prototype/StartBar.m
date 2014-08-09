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
                       [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settings.png"] landscapeImagePhone:nil style:UIBarButtonItemStylePlain target:self action:@selector(testSettings)],
                       [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil],
                       [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil]
                       ];
    }
    return self;
}

-(void)testAction
{
    
    NSLog(@"up testing...");
    
}

-(void)testAction1
{
    NSLog(@"up test 1..");
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
    UIPopoverController * popover = [[UIPopoverController alloc] initWithContentViewController:<#(UIViewController *)#>]
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
