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

/* Used for prototyping difference in design between edge to edge and setting an inset on the ends */
#define EDGE_TO_EDGE
#undef SET_INSET 1

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
    int totalInsetWidth = 5;
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
    
    //NSObject *tempObject = [[[AppDelegate sharedInstance] objectsArray] objectAtIndex:indexPath.row];
    NSObject *tempObject = [_objectArray objectAtIndex:indexPath.row];
    
    if ([tempObject class] == [MessageCell class]) {
        retVal = MESSAGE_CELL_HEIGHT;
    }
    else if ([tempObject class] == [AttachmentCell class]) {
        retVal = ATTACHMENT_CELL_HEIGHT;
    }
    else if ([tempObject class] == [ProximityCell class]) {
        retVal = PROXIMITY_CELL_HEIGHT;
    }
    else if ([tempObject class] == [FriendSuggestionCell class]) {
        retVal = FRIEND_SUGGESTION_CELL_HEIGHT;
    }
    else if ([tempObject class] == [GalleryCell class]) {
        retVal = GALLERY_CELL_HEIGHT;
    }
    else {
        retVal = 60;
    }
    return retVal;
}

#pragma mark - Public

-(float)columnWidthForIndexPath:(NSIndexPath *)indexPath {
    float retVal = 0;
    
    //NSObject *tempObject = [[[AppDelegate sharedInstance] objectsArray] objectAtIndex:indexPath.row];
    NSObject *tempObject = [_objectArray objectAtIndex:indexPath.row];
    
    if ([tempObject class] == [MessageCell class]) {
        retVal = MESSAGE_CELL_WIDTH;
    }
    else if ([tempObject class] == [AttachmentCell class]) {
        retVal = ATTACMENT_CELL_WIDTH;
    }
    else if ([tempObject class] == [ProximityCell class]) {
        retVal = PROXIMITY_CELL_WIDTH;
    }
    else if ([tempObject class] == [FriendSuggestionCell class]) {
        retVal = FRIEND_SUGGESTION_CELL_WIDTH;
    }
    else if ([tempObject class] == [GalleryCell class]) {
        retVal = GALLERY_CELL_WIDTH;
    }
    else {
        retVal = 60;
    }
    return retVal;
}

#pragma mark UICollectionViewLayout

-(void)prepareLayout{
    self.columnsQuantity = 2;
    //NSLog(@"columnsQuantity: %i", self.columnsQuantity);
    bool stackCells;
    bool stackLeft;
    bool left;
    int previousHeight = 0;
    int previousWidth = 0;
    int currentHeight = 0;
    int currentWidth = 0;
    int addObjectIndex = 0;
    int prevHeightOffset = 0;
    NSMutableArray *returnArray = [[NSMutableArray alloc] initWithCapacity:[_objectArray count]];
    _objectArray = [[NSMutableArray alloc] initWithArray:[[AppDelegate sharedInstance] objectsArray]];
    _columns = [NSMutableArray arrayWithCapacity:self.columnsQuantity];
    for (NSInteger i = 0; i < self.columnsQuantity; i++) {
        [_columns addObject:@(0)];
    }
    left = true;
    stackCells = false;
    stackLeft = false;
    
    //  Get all the items available for the section
    NSUInteger itemsCount = [[self collectionView] numberOfItemsInSection:0];
    _itemsAttributes = [NSMutableArray arrayWithCapacity:itemsCount];
    
    NSUInteger xOffset = 0;
    NSUInteger yOffset = 0;
    /* Gonna try something out, this is a bit of a stretch... let's see how it goes
     *  The logic here is that we stay in a while loop until our object array is empty
     *  and we'll just always attempt to shove in the first object to see if it fits
     *  if not, we'll keep on looking around in the object array until something does
     *  fit into our mosaic design...  We therefore will always be setting the indexPath
     *  to 1 in section 0 and updating the index path as we're moving along looking for a
     *  good fit to the left if it's necessary
     */
    bool removeItem = false;
    for (NSUInteger i = 0; i < [_objectArray count]; i++){
        
        //NSLog(@"object array count: %i", [[[AppDelegate sharedInstance] objectsArray] count]);
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        //NSLog(@"indexPath: %@", indexPath);
        NSUInteger columnIndex = [self longestColumnIndex];
        //  Get x, y, width and height for indexPath
        
        NSUInteger itemWidth = 0;
        NSUInteger itemHeight = 0;
        
        if (left) {
            xOffset = 0;
            left = false;
            yOffset += previousHeight + 4;
            previousHeight = [self heightForIndexPath:indexPath];
            previousWidth = [self columnWidthForIndexPath:indexPath];
            _columns[columnIndex] = @(yOffset + previousHeight);
            //Remove object from the private object array
            removeItem = true;
        }
        else if (stackCells) {
            // Pretty much a 0% chance we'll ever be able to stack three cells so let's go ahead back to the left after this
            stackCells = false;
            left = true;
            int j = indexPath.row;
            bool breakLoop = true;
            while (breakLoop) {
                currentWidth = [self columnWidthForIndexPath:indexPath];
                
                if ([self canUseDoubleColumnWithCurrentWidth:currentWidth andPreviousWidth:previousWidth]) {
                    xOffset = previousWidth + 5;
                    //yOffset remains the same
                    //int prevHeightOffset = currentHeight;
                    currentHeight = [self heightForIndexPath:indexPath];
                    if ((currentHeight + prevHeightOffset) <= previousHeight) {
                        // Keep the previous height bc it should be more or less the same..
                        //previousHeight = currentHeight;
                        yOffset += prevHeightOffset + 4;
                        previousHeight = currentHeight;
                        _columns[columnIndex] = @(yOffset + currentHeight);
                        //[_objectArray removeObjectAtIndex:indexPath.row];
                        removeItem = true;
                        breakLoop = false;
                    }
                    else {
                        // We don't want to go back to the left right now, but we do however want to stack some cells
                        //left = false;
                        //stackCells = true;
                        // Don't update the column height just yet...
                        //_columns[columnIndex] = @(yOffset + previousHeight);
                        // Previous height remains the same.. We need to check that the height of the two cells don't go over
                        //previousHeight = currentHeight;
                        // Still can't use this object.. try the next..
                        j++;
                        if (j >= [_objectArray count]) {
                            // Just fuck it... doesn't exist at the moment, we'll figure something out soon..
                            left = true;
                            i--;
                            breakLoop = false;
                        }
                        else {
                            //NSLog(@"%d", __LINE__);
                            indexPath = [NSIndexPath indexPathForItem:j inSection:0];
                            //NSLog(@"%d", __LINE__);
                        }
                    }
                }
                else {
                    j++;
                    if (j >= [_objectArray count]) {
                        // Just fuck it... doesn't exist at the moment, we'll figure something out soon..
                        left = true;
                        i--;
                        breakLoop = false;
                    }
                    else {
                        //NSLog(@"%d", __LINE__);
                        indexPath = [NSIndexPath indexPathForItem:j inSection:0];
                        //NSLog(@"%d", __LINE__);
                    }
                }
            }
            
        }
        else if (stackLeft) {
            /* IF we're stacking left, the only case at this point in time is that we are
             * stacking two friend stuggestion cells to the left.. So to make this a WHOLE
             * LOT easier, we're just gonna look for another friend suggestion cell and shove it
             * to the left and with a yoffset of yoffset + friend suggestion + 4
             */
            stackLeft = false;
            yOffset += previousHeight + 4;
            xOffset = 0;
            int j = indexPath.row;
            bool breakloop = true;
            while (breakloop) {
                //Look for another friend suggestion cell.. if we don't find one, fuck it for now..
                NSObject *tempObject = [_objectArray objectAtIndex:j];
                if ([tempObject class] == [FriendSuggestionCell class]) {
                    breakloop = false;
                    removeItem = true;
                    indexPath = [NSIndexPath indexPathForRow:j inSection:0];
                }
                else {
                    j++;
                    if (j > [_objectArray count]) {
                        //No more friend suggestion cells.. give up!
                        breakloop = false;
                    }
                }
            }
        }
        else {
            if ((previousWidth + 5) >= 320) {
                yOffset += previousHeight + 4;
                xOffset = 0;
                previousHeight = [self heightForIndexPath:indexPath];
                previousWidth = [self columnWidthForIndexPath:indexPath];
                _columns[columnIndex] = @(yOffset + previousHeight);
                left = false;
                removeItem = true;
                //[_objectArray removeObjectAtIndex:indexPath.row];
            }
            else  {
                int j = indexPath.row;
                bool breakLoop = true;
                while (breakLoop) {
                    currentWidth = [self columnWidthForIndexPath:indexPath];
                    left = true;
                    if ([self canUseDoubleColumnWithCurrentWidth:currentWidth andPreviousWidth:previousWidth]) {
                        xOffset = previousWidth + 5;
                        //yOffset remains the same
                        currentHeight = [self heightForIndexPath:indexPath];
                        //Check is we need to stack left/right/or not at all
                        if (currentHeight == previousHeight) {
                            previousHeight = currentHeight;
                            _columns[columnIndex] = @(yOffset + currentHeight);
                        }
                        else if (currentHeight > previousHeight) {
                            stackLeft = true;
                            left = false;
                        }
                        else {
                            // We don't want to go back to the left right now, but we do however want to stack some cells
                            left = false;
                            prevHeightOffset = [self heightForIndexPath:indexPath];
                            stackCells = true;
                            // Don't update the column height just yet...
                            //_columns[columnIndex] = @(yOffset + previousHeight);
                            // Previous height remains the same.. We need to check that the height of the two cells don't go over
                            //previousHeight = currentHeight;
                        }
                        //[_objectArray removeObjectAtIndex:indexPath.row];
                        removeItem = true;
                        breakLoop = false;
                    }
                    else {
                        j++;
                        if (j >= [_objectArray count]) {
                            // Just fuck it... doesn't exist at the moment, we'll figure something out soon..
                            // For now we'll just shove this object down and to the left..
                            left = true;
                            i--;
                            breakLoop = false;
                        }
                        else {
                            //NSLog(@"%d", __LINE__);
                            indexPath = [NSIndexPath indexPathForItem:j inSection:0];
                            //NSLog(@"%d", __LINE__);
                        }
                    }
                }
            }
            
        }
        itemWidth = [self columnWidthForIndexPath:indexPath];
        itemHeight = [self heightForIndexPath:indexPath];
        
        // Remove the object AFTER we get all it's info
        if (removeItem) {
            [returnArray insertObject:[_objectArray objectAtIndex:indexPath.row] atIndex:addObjectIndex];
            NSLog(@"screen layout object class: %@ at index: %i", [[_objectArray objectAtIndex:indexPath.row] class], i);
            addObjectIndex++;
            //[_objectArray removeObjectAtIndex:indexPath.row];
            NSObject *objectMovingUp = [_objectArray objectAtIndex:i];
            NSObject *objectMovingDown = [_objectArray objectAtIndex:indexPath.row];
            [_objectArray setObject:objectMovingDown atIndexedSubscript:i];
            [_objectArray setObject:objectMovingUp atIndexedSubscript:indexPath.row];
            //[[[AppDelegate sharedInstance] objectsArray] setObject:objectMovingDown atIndexedSubscript:i];
            //[[[AppDelegate sharedInstance] objectsArray] setObject:objectMovingUp atIndexedSubscript:indexPath.row];
            
            removeItem = false;
            
            /*  Assign all those values to an UICollectionViewLayoutAttributes instance
             *  and save it on an array */
            NSIndexPath *thisPath = [NSIndexPath indexPathForRow:i inSection:0];
            UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:thisPath];
            NSLog(@"frame is xoffset: %i yoffset: %i width: %i height: %i", xOffset, yOffset, itemWidth, itemHeight);
            attributes.frame = CGRectMake(xOffset, yOffset, itemWidth, itemHeight);
            [_itemsAttributes addObject:attributes];
        }
    }
    [[AppDelegate sharedInstance] setObjectsArray:returnArray];
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
    retVal.height = columnHeight + 4;
    NSLog(@"content height: %f", retVal.height);
    
    return retVal;
}

@end
