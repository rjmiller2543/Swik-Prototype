//
//  StartScreenLayout.h
//  Swik Prototype
//
//  Created by Robert Miller on 8/18/14.
//  Copyright (c) 2014 Robert Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StartScreenViewController.h"

@interface StartScreenLayout : UICollectionViewLayout{
    NSMutableArray *_columns;
    NSMutableArray *_itemsAttributes;
}

@property (weak) StartScreenViewController *controller;
@property (assign) NSUInteger columnsQuantity;
@property (nonatomic,retain) NSMutableArray *usedObjectIndexes;

-(float)columnWidthForIndexPath:(NSIndexPath *)indexPath;

@end
