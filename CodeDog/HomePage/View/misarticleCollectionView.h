//
//  misarticleCollectionView.h
//  CodeDog
//
//  Created by zerocpp on 17/1/7.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface misarticleCollectionView : UICollectionView
- (instancetype)initWithFrame:(CGRect)frame collectionViewItemSize:(CGSize)itemSize withHomeMisArticleArr:(NSArray *)misarticleArr;
@property (nonatomic) void (^block)(NSIndexPath *indexPath);
@end
