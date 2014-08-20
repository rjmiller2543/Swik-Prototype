//
//  StartScreenLayout.m
//  Swik Prototype
//
//  Created by Robert Miller on 8/18/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import "StartScreenLayout.h"
#import "AppDelegate.h"

#define kDoubleColumnProbability 40
#define kHeightModule 40

@interface StartScreenLayout()
-(NSUInteger)shortestColumnIndex;
-(NSUInteger)longestColumnIndex;
-(BOOL)canUseDoubleColumnWithCurrentWidth:(NSUInteger)currentWidth andPreviousWidth:(NSUInteger)previousWidth;
-(float)heightForIndexPath:(NSIndexPath *)indexPath;
@end

@implementation StartScreenLayout

#pragma mark - Private

-(NSUInteger)shortestColumnIndex{
    NSUInteger retVal = 0;
    CGFloat shortestValue = MAXFLOAT;
    
    NSUInteger i=0;
    for (NSNumber *heightValue in _columns){
        if ([heightValue floatValue] < shortestValue){
            shortestValue = [heightValue floatValue];
            retVal = i;
        }
        i++;
    }
    return retVal;
}

-(NSUInteger)longestColumnIndex{
    NSUInteger retVal = 0;
    CGFloat longestValue = 0;
    
    NSUInteger i=0;
    for (NSNumber *heightValue in _columns){
        if ([heightValue floatValue] > longestValue){
            longestValue = [heightValue floatValue];
            retVal = i;
        }
        i++;
    }
    return retVal;
}

-(BOOL)canUseDoubleColumnWithCurrentWidth:(NSUInteger)currentWidth andPreviousWidth:(NSUInteger)previousWidth
{
    BOOL retVal = NO;
    int totalInsetWidth = 6;
    int totalWidth = [[[[AppDelegate sharedInstance] window] screen] bounds].size.width;
    
    if ((currentWidth + previousWidth + totalInsetWidth) <= totalWidth) {
        NSLog(@"yup");
        retVal = YES;
    }
    
    return retVal;
}

-(BOOL)canUseDoubleColumnOnIndex:(NSUInteger)columnIndex{
    BOOL retVal = NO;
    
    if (columnIndex < self.columnsQuantity-1){
        float firstColumnHeight = [_columns[columnIndex] floatValue];
        float secondColumnHeight = [_columns[columnIndex+1] floatValue];
        
        if (firstColumnHeight == secondColumnHeight){
            NSUInteger random = arc4random() % 100;
            if (random < kDoubleColumnProbability){
                retVal = YES;
            }
        }
    }
    
    return retVal;
}

-(float)heightForIndexPath:(NSIndexPath *)indexPath
{
    float retVal = 0;
    
    NSObject *tempObject = [[[AppDelegate sharedInstance] objectsArray] objectAtIndex:indexPath.row];
    //NSLog(@"tempObject class: %@", [tempObject class]);
    if ([tempObject class] == [MessageCell class]) {
        retVal = 165;
        //returnSize = CGSizeMake(80, 165);
    }
    else if ([tempObject class] == [AttachmentCell class]) {
        retVal = 280;
        //returnSize = CGSizeMake(316, 280);
    }
    else if ([tempObject class] == [ProximityCell class]) {
        retVal = 280;
        //returnSize = CGSizeMake(234, 280);
    }
    else if ([tempObject class] == [FriendSuggestionCell class]) {
        retVal = 78;
        //returnSize = CGSizeMake(234, 78);
    }
    else if ([tempObject class] == [GalleryCell class]) {
        retVal = 80;
        //returnSize = CGSizeMake(80, 80);
    }
    else {
        retVal = 60;
        //returnSize = CGSizeMake(60, 60);
    }
    return retVal;
}

#pragma mark - Public

-(float)columnWidthForIndexPath:(NSIndexPath *)indexPath {
    float retVal = 0;
    
    NSObject *tempObject = [[[AppDelegate sharedInstance] objectsArray] objectAtIndex:indexPath.row];
    //NSObject *tempObject = [_objectArray objectAtIndex:indexPath.row];
    //NSLog(@"tempObject class: %@", [tempObject class]);
    if ([tempObject class] == [MessageCell class]) {
        retVal = 80;
        //returnSize = CGSizeMake(80, 165);
    }
    else if ([tempObject class] == [AttachmentCell class]) {
        retVal = 316;
        //returnSize = CGSizeMake(316, 280);
    }
    else if ([tempObject class] == [ProximityCell class]) {
        retVal = 234;
        //returnSize = CGSizeMake(234, 280);
    }
    else if ([tempObject class] == [FriendSuggestionCell class]) {
        retVal = 234;
        //returnSize = CGSizeMake(234, 78);
    }
    else if ([tempObject class] == [GalleryCell class]) {
        retVal = 80;
        //returnSize = CGSizeMake(80, 80);
    }
    else {
        retVal = 60;
        //returnSize = CGSizeMake(60, 60);
    }
    return retVal;
}

#pragma mark UICollectionViewLayout

-(void)prepareLayout{
    self.columnsQuantity = 2;
    NSLog(@"columnsQuantity: %i", self.columnsQuantity);
    bool stackCells;
    bool left;
    int previousHeight = 0;
    int previousWidth = 0;
    int currentHeight = 0;
    int currentWidth = 0;
    //_objectArray = [[NSMutableArray alloc] initWithArray:[[AppDelegate sharedInstance] objectsArray]];
    _columns = [NSMutableArray arrayWithCapacity:self.columnsQuantity];
    for (NSInteger i = 0; i < self.columnsQuantity; i++) {
        [_columns addObject:@(0)];
    }
    left = true;
    stackCells = false;
    
    //  Get all the items available for the section
    NSUInteger itemsCount = [[self collectionView] numberOfItemsInSection:0];
    _itemsAttributes = [NSMutableArray arrayWithCapacity:itemsCount];
    
    NSUInteger xOffset = 0;
    NSUInteger yOffset = 0;
    for (NSUInteger i = 0; i < itemsCount; i++){
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        //NSLog(@"indexPath: %@", indexPath);
        NSUInteger columnIndex = [self longestColumnIndex];
        //  Get x, y, width and height for indexPath
        
        NSUInteger itemWidth = 0;
        NSUInteger itemHeight = 0;
        
        if (left) {
            xOffset = 2;
            left = false;
            yOffset += previousHeight + 2;
            previousHeight = [self heightForIndexPath:indexPath];
            previousWidth = [self columnWidthForIndexPath:indexPath];
        }
        else {
            currentWidth = [self columnWidthForIndexPath:indexPath];
            left = true;
            if ([self canUseDoubleColumnWithCurrentWidth:currentWidth andPreviousWidth:previousWidth] ) {
                xOffset = previousWidth + 4;
                //yOffset remains the same
                if (currentHeight > previousHeight) {
                    previousHeight = currentHeight;
                    _columns[columnIndex] = @(yOffset + currentHeight);
                }
                else {
                    //previousHeight remains the same as it is
                    _columns[columnIndex] = @(yOffset + previousHeight);
                }
            }
            else {
                yOffset += previousHeight + 2;
                xOffset = 2;
                previousHeight = [self heightForIndexPath:indexPath];
                previousWidth = [self columnWidthForIndexPath:indexPath];
                left = false;
            }
            
        }
        itemWidth = [self columnWidthForIndexPath:indexPath];
        itemHeight = [self heightForIndexPath:indexPath];
        
        /*  Assign all those values to an UICollectionViewLayoutAttributes instance
         *  and save it on an array */
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        NSLog(@"frame is xoffset: %i yoffset: %i width: %i height: %i", xOffset, yOffset, itemWidth, itemHeight);
        attributes.frame = CGRectMake(xOffset, yOffset, itemWidth, itemHeight);
        [_itemsAttributes addObject:attributes];
        
    }
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSPredicate *filterPredicate = [NSPredicate predicateWithBlock:^BOOL(UICollectionViewLayoutAttributes * evaluatedObject, NSDictionary *bindings) {
        BOOL predicateRetVal = CGRectIntersectsRect(rect, [evaluatedObject frame]);
        NSLog(@"-> layoutAttributesForElementsInRect with bool: %i", predicateRetVal);
        return predicateRetVal;
    }];
    
    NSArray *retVal = [_itemsAttributes filteredArrayUsingPredicate:filterPredicate];
    return retVal;
}

-(CGSize)collectionViewContentSize{
    CGSize retVal = self.collectionView.bounds.size;
    
    NSUInteger columnIndex = [self longestColumnIndex];
    float columnHeight = [_columns[columnIndex] floatValue];
    retVal.height = columnHeight + 24;
    
    return retVal;
}

@end
