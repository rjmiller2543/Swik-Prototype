//
//  FilterBarController.m
//  Swik Prototype
//
//  Created by Robert Miller on 8/7/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import "FilterBarController.h"

@interface FilterBarController ()

@end

@implementation FilterBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setFrame:CGRectMake(0, 60, 320, 30)];
    UIImageView * filterIconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    filterIconImageView.image = [UIImage imageNamed:@"dry.png"];
    [self.view addSubview:filterIconImageView];
    UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 0, 25, 25)];
    [testButton addTarget:self action:@selector(testButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];
}

-(void)testButton
{
    NSLog(@"testing filter bar");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
