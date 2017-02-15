//
//  ArticleCV.m
//  CodeDog
//
//  Created by zerocpp on 17/1/23.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "ArticleCV.h"
#import "ArticleCell.h"
#import "DetailDocVC.h"

@interface ArticleCV()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, assign) CGSize itemSize;
@property(nonatomic, strong) NSArray<HomeArticleModel *> *articelList;
@end

@implementation ArticleCV
#pragma mark -init
- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.itemSize = self.itemSize;
        _layout.minimumLineSpacing = 10.0;
        _layout.minimumInteritemSpacing = 10.0;
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return _layout;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewItemSize:(CGSize)itemSize withHomeArticleArr:(NSArray *)articleArr{
    _itemSize = itemSize;
    if (self = [super initWithFrame:frame collectionViewLayout:self.layout]) {
        _articelList = articleArr;
        self.bounces = NO;
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[ArticleCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}

#pragma mark -deleagte
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.articelList.count - 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ArticleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    HomeArticleModel *model = self.articelList[indexPath.row];
    [cell.iconIV setImageWithURL:model.pic.sx_URL placeholder:[UIImage imageNamed:@"placeHolder.jpg"]];
    cell.titleLb.text = model.title;
    NSInteger viewNum = [model.view integerValue];
    cell.viewNumLb.attributedText = [SXFactory addAttributedString:viewNum PvColor:pvColorWhite];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.block(indexPath);
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        CGFloat width = kMyScreenWidth - 10 * 2;
        CGFloat height = (width * 340 / 750);
        return CGSizeMake(width, height);
    }else{
        //        CGFloat width = (kMyScreenWidth - 10 * 3) / 2;
        //        CGFloat height = (width * 340 / 750) + 40;
        //        return CGSizeMake(width, height);
        return self.itemSize;
    }
}
@end
