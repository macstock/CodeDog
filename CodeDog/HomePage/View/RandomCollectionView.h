//
//  RandomCollectionView.h
//  CodeDog
//
//  Created by zerocpp on 17/1/8.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
@interface RandomCollectionView : UICollectionView
- (instancetype)initWithFrame:(CGRect)frame collectionViewItemSize:(CGSize)itemSize withHomeRandomArr:(NSArray *)randomArr;
@property (nonatomic) void (^block)(NSIndexPath *indexPath);
@end
