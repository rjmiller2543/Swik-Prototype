//
//  StartScreenViewController.m
//  Swik Prototype
//
//  Created by Robert Miller on 8/10/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import "StartScreenViewController.h"
#import "MessageCell.h"
#import "AttachmentCell.h"
#import "ProximityCell.h"
#import "FriendSuggestionCell.h"
#import "GalleryCell.h"
#import "AppDelegate.h"

@interface StartScreenViewController ()

@end

@implementation StartScreenViewController

static NSString * const reuseIdentifier = @"Cell";
static NSString * const messageIdentifier = @"MessageCell";
static NSString * const attachmentIdentifier = @"AttachmentCell";
static NSString * const proximityIdentifier = @"ProximityCell";
static NSString * const friendSuggestionIdentifier = @"FriendSuggestionCell";
static NSString * const gallerIdentifier = @"GalleryCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    float height = [[[[AppDelegate sharedInstance] window] screen] bounds].size.height;
    [self.collectionView setFrame:CGRectMake(0, 90, 320, height - 90)];
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerClass:[MessageCell class] forCellWithReuseIdentifier:messageIdentifier];
    [self.collectionView registerClass:[AttachmentCell class] forCellWithReuseIdentifier:attachmentIdentifier];
    [self.collectionView registerClass:[ProximityCell class] forCellWithReuseIdentifier:proximityIdentifier];
    [self.collectionView registerClass:[FriendSuggestionCell class] forCellWithReuseIdentifier:friendSuggestionIdentifier];
    [self.collectionView registerClass:[GalleryCell class] forCellWithReuseIdentifier:gallerIdentifier];
    
    // Do any additional setup after loading the view.
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete method implementation -- Return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete method implementation -- Return the number of items in the section
    //return 5;
    return [[[AppDelegate sharedInstance] objectsArray] count];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"-> layout attributes for item at index path");
    UICollectionViewLayoutAttributes *layoutAttributes = [[UICollectionViewLayoutAttributes alloc] init];
    if (indexPath.row == 0) {
        [layoutAttributes setFrame:CGRectMake(2, 92, 80, 165)];
    }
    if (indexPath.row == 1) {
        [layoutAttributes setFrame:CGRectMake(84, 92, 234, 78)];
    }
    if (indexPath.row == 2) {
        [layoutAttributes setFrame:CGRectMake(84, 172, 234, 78)];
    }
    
    return layoutAttributes;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize returnSize = CGSizeMake(60, 60);
/*    if (indexPath.row == 0) {
        returnSize = CGSizeMake(40, 320);
    }
    else if (indexPath.row == 1) {
        returnSize = CGSizeMake(120, 120);
    }
    else if (indexPath.row == 2) {
        returnSize = CGSizeMake(280, 280);
    }
    else if (indexPath.row == 3) {
        returnSize = CGSizeMake(318, 40);
    }
    else if (indexPath.row == 4) {
        returnSize = CGSizeMake(280, 280);
    }
    else {
        returnSize = CGSizeMake(60, 60);
    }
  */
    NSObject *tempObject = [[[AppDelegate sharedInstance] objectsArray] objectAtIndex:indexPath.row];
    NSLog(@"tempObject class: %@", [tempObject class]);
    if ([tempObject class] == [MessageCell class]) {
        returnSize = CGSizeMake(80, 165);
    }
    else if ([tempObject class] == [AttachmentCell class]) {
        returnSize = CGSizeMake(316, 280);
    }
    else if ([tempObject class] == [ProximityCell class]) {
        returnSize = CGSizeMake(234, 280);
    }
    else if ([tempObject class] == [FriendSuggestionCell class]) {
        returnSize = CGSizeMake(234, 78);
    }
    else if ([tempObject class] == [GalleryCell class]) {
        returnSize = CGSizeMake(80, 80);
    }
    else {
        returnSize = CGSizeMake(60, 60);
    }
    
    return returnSize;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
    
    // Configure the cell
    NSObject *tempObject = [[[AppDelegate sharedInstance] objectsArray] objectAtIndex:indexPath.row];
    if ([tempObject class] == [MessageCell class]) {
        cell = (MessageCell *)[collectionView dequeueReusableCellWithReuseIdentifier:messageIdentifier forIndexPath:indexPath];
    }
    else if ([tempObject class] == [AttachmentCell class]) {
        cell = (AttachmentCell *)[collectionView dequeueReusableCellWithReuseIdentifier:attachmentIdentifier forIndexPath:indexPath];
    }
    else if ([tempObject class] == [ProximityCell class]) {
        cell = (ProximityCell *)[collectionView dequeueReusableCellWithReuseIdentifier:proximityIdentifier forIndexPath:indexPath];
    }
    else if ([tempObject class] == [FriendSuggestionCell class]) {
        cell = (FriendSuggestionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:friendSuggestionIdentifier forIndexPath:indexPath];
        //cell.backgroundColor = [UIColor yellowColor];
    }
    else if ([tempObject class] == [GalleryCell class]) {
        cell = (GalleryCell *)[collectionView dequeueReusableCellWithReuseIdentifier:gallerIdentifier forIndexPath:indexPath];
        //cell.backgroundColor = [UIColor magentaColor];
    }
    else {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        //cell.backgroundColor = [UIColor blackColor];
    }
    //NSLog(@"cell description: %@", [cell description]);
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
