//
//  misarticleCollectionView.m
//  CodeDog
//
//  Created by zerocpp on 17/1/7.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "misarticleCollectionView.h"
#import "ArticleCell.h"

@interface misarticleCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, assign) CGSize itemSize;
@property(nonatomic, strong) NSArray<HomeMisarticleModel *> *misarticlelList;
@end
@implementation misarticleCollectionView

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

- (instancetype)initWithFrame:(CGRect)frame collectionViewItemSize:(CGSize)itemSize withHomeMisArticleArr:(NSArray *)misarticleArr{
    _itemSize = itemSize;
    if (self = [super initWithFrame:frame collectionViewLayout:self.layout]) {
        _misarticlelList = misarticleArr;
        self.bounces = NO;
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[ArticleCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}

#pragma mark -deleagte
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.misarticlelList.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ArticleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    HomeMisarticleModel *model = self.misarticlelList[indexPath.row];
    [cell.iconIV setImageWithURL:model.pic.sx_URL placeholder:[UIImage imageNamed:@"placeHolder.jpg"]];
    cell.titleLb.text = model.title;
    NSInteger viewNum = [model.view integerValue];
    cell.viewNumLb.attributedText = [SXFactory addAttributedString:viewNum PvColor:pvColorWhite];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.block(indexPath);
}


@end
