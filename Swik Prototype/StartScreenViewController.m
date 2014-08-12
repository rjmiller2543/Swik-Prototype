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
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
    
    // Configure the cell
    if (indexPath.row == 0) {
        NSLog(@"indexpath.row = 0");
        cell = (MessageCell *)[collectionView dequeueReusableCellWithReuseIdentifier:messageIdentifier forIndexPath:indexPath];
        //cell.frame = CGRectMake(0, 0, 320, 40);
        //cell.backgroundColor = [UIColor blueColor];
    }
    else if (indexPath.row == 1) {
        cell = (AttachmentCell *)[collectionView dequeueReusableCellWithReuseIdentifier:attachmentIdentifier forIndexPath:indexPath];
        //cell.backgroundColor = [UIColor redColor];
    }
    else if (indexPath.row == 2) {
        cell = (ProximityCell *)[collectionView dequeueReusableCellWithReuseIdentifier:proximityIdentifier forIndexPath:indexPath];
        cell.frame = CGRectMake(0, 0, 320, 40);
        //cell.backgroundColor = [UIColor greenColor];
    }
    else if (indexPath.row == 3) {
        cell = (FriendSuggestionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:friendSuggestionIdentifier forIndexPath:indexPath];
        //cell.backgroundColor = [UIColor yellowColor];
    }
    else if (indexPath.row == 4) {
        cell = (GalleryCell *)[collectionView dequeueReusableCellWithReuseIdentifier:gallerIdentifier forIndexPath:indexPath];
        //cell.backgroundColor = [UIColor magentaColor];
    }
    else {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        //cell.backgroundColor = [UIColor blackColor];
    }
   
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
