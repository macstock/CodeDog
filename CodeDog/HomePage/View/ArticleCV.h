//
//  ArticleCV.h
//  CodeDog
//
//  Created by zerocpp on 17/1/23.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface ArticleCV : UICollectionView
/**
 *
 *  @param frame    外界传来的frame 即collectionView的大小
 *  @param itemSize 即collectionViewCell上的Item大小
 *  @param articleArr    外界存放article的数组模型
 *
 */
- (instancetype)initWithFrame:(CGRect)frame collectionViewItemSize:(CGSize)itemSize withHomeArticleArr:(NSArray *)articleArr;

@property (nonatomic) void (^block)(NSIndexPath *indexPath);
@end
