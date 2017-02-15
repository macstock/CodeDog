//
//  DocCollectionView.h
//  CodeDog
//
//  Created by zerocpp on 17/1/23.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleModel.h"

@interface DocCollectionView : UICollectionView
- (instancetype)initWithFrame:(CGRect)frame collectionViewItemSize:(CGSize)itemSize withhotDocArr:(NSArray *)hotDocArr;
@property (nonatomic) void (^block)(NSIndexPath *indexPaths);
@end
