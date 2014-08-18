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
 /*   UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 0, 25, 25)];
    [testButton addTarget:self action:@selector(testButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];
   */
    //Create the scroll view that will hold all of the filter options
    _filterOptionsView = [[UIScrollView alloc] initWithFrame:CGRectMake(25, 0, 295, 30)];
    _filterOptionsView.scrollEnabled = YES;
    _filterOptionsView.showsHorizontalScrollIndicator = NO;
    
    float fontSize = 13;
    float xPosition = 5;
    float gap = 10;
    
    //Before adding to subview, create all of the options as buttons and add them to the scrollview
    UIButton *firstButton = [[UIButton alloc] initWithFrame:CGRectMake(xPosition, 0, 60, 30)];
    [firstButton addTarget:self action:@selector(firstButtonTest) forControlEvents:UIControlEventTouchUpInside];
    [firstButton setTitle:@"ALL" forState:UIControlStateNormal];
    [firstButton setTitle:@"ALL" forState:UIControlStateSelected];
    firstButton.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [firstButton sizeToFit];
    [_filterOptionsView addSubview:firstButton];
    
    xPosition = firstButton.frame.origin.x + firstButton.frame.size.width + gap;
    UIButton *secondButton = [[UIButton alloc] initWithFrame:CGRectMake(xPosition, 0, 60, 30)];
    [secondButton addTarget:self action:@selector(secondButtonTest) forControlEvents:UIControlEventTouchUpInside];
    [secondButton setTitle:@"RECENT" forState:UIControlStateNormal];
    [secondButton setTitle:@"RECENT" forState:UIControlStateSelected];
    secondButton.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [secondButton sizeToFit];
    [_filterOptionsView addSubview:secondButton];
    
    xPosition = secondButton.frame.origin.x + secondButton.frame.size.width + gap;
    UIButton *thirdButton = [[UIButton alloc] initWithFrame:CGRectMake(xPosition, 0, 60, 30)];
    [thirdButton addTarget:self action:@selector(thirdButtonTest) forControlEvents:UIControlEventTouchUpInside];
    [thirdButton setTitle:@"TEAM" forState:UIControlStateNormal];
    [thirdButton setTitle:@"TEAM" forState:UIControlStateSelected];
    thirdButton.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [thirdButton sizeToFit];
    [_filterOptionsView addSubview:thirdButton];
    
    xPosition = thirdButton.frame.origin.x + thirdButton.frame.size.width + gap;
    UIButton *fourthButton = [[UIButton alloc] initWithFrame:CGRectMake(xPosition, 0, 60, 30)];
    [fourthButton addTarget:self action:@selector(fourthButtonTest) forControlEvents:UIControlEventTouchUpInside];
    [fourthButton setTitle:@"FAVORITES" forState:UIControlStateNormal];
    [fourthButton setTitle:@"FAVORITES" forState:UIControlStateSelected];
    fourthButton.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [fourthButton sizeToFit];
    [_filterOptionsView addSubview:fourthButton];
    
    xPosition = fourthButton.frame.origin.x + fourthButton.frame.size.width + gap;
    UIButton *fifthButton = [[UIButton alloc] initWithFrame:CGRectMake(xPosition, 0, 60, 30)];
    [fifthButton addTarget:self action:@selector(fifthButtonTest) forControlEvents:UIControlEventTouchUpInside];
    [fifthButton setTitle:@"FAMILY" forState:UIControlStateNormal];
    [fifthButton setTitle:@"FAMILY" forState:UIControlStateSelected];
    fifthButton.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [fifthButton sizeToFit];
    [_filterOptionsView addSubview:fifthButton];
    
    xPosition = fifthButton.frame.origin.x + fifthButton.frame.size.width + gap;
    UIButton *sixthButton = [[UIButton alloc] initWithFrame:CGRectMake(xPosition, 0, 30, 30)];
    [sixthButton addTarget:self action:@selector(sixthButtonTest) forControlEvents:UIControlEventTouchUpInside];
    [sixthButton setTitle:@"FAMILY" forState:UIControlStateNormal];
    [sixthButton setTitle:@"FAMILY" forState:UIControlStateSelected];
    sixthButton.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [sixthButton sizeToFit];
    [_filterOptionsView addSubview:sixthButton];
    
    //Adjust the scroll view's content size based on the button's position
    CGRect contentRect = CGRectZero;
    for (UIView *view in _filterOptionsView.subviews)
        contentRect = CGRectUnion(contentRect, view.frame);
    _filterOptionsView.contentSize = CGSizeMake(contentRect.size.width + 5, contentRect.size.height);
    
    //Finally add the scroll view
    [self.view addSubview:_filterOptionsView];
}

-(void)testButton
{
    NSLog(@"testing filter bar");
}

-(void)firstButtonTest
{
    NSLog(@"first button test");
}

-(void)secondButtonTest
{
    NSLog(@"second button test");
}

-(void)thirdButtonTest
{
    NSLog(@"third button test");
}

-(void)fourthButtonTest
{
    NSLog(@"fourth button test");
}

-(void)fifthButtonTest
{
    NSLog(@"fifth button test");
}

-(void)sixthButtonTest
{
    NSLog(@"sixth button test");
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
