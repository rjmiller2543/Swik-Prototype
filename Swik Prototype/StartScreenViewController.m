//
//  StartScreenViewController.m
//  Swik Prototype
//
//  Created by Robert Miller on 7/28/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import "StartScreenViewController.h"

@interface StartScreenViewController ()

@end

@implementation StartScreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        /* just testing that is working correctly */
        // Custom initialization
        UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 100, 40)];
        testButton.backgroundColor = [UIColor redColor];
        //testButton.titleLabel = @"Test Action";
        testButton.tintColor = [UIColor whiteColor];
        [testButton addTarget:self action:@selector(testAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:testButton];
        
    }
    return self;
}

-(void)testAction
{
    NSLog(@"up up testing...");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
