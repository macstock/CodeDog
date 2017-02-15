
//
//  DocCollectionView.m
//  CodeDog
//
//  Created by zerocpp on 17/1/23.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "DocCollectionView.h"
#import "DocCollectionViewCell.h"

@interface DocCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, assign) CGSize itemSize;
@property(nonatomic, strong) NSArray<ArticleHotModel *> *hotDocList;
@end
@implementation DocCollectionView
#pragma mark -init
- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.itemSize = self.itemSize;
        _layout.minimumLineSpacing = 80.0;
        _layout.minimumInteritemSpacing = 80.0;
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _layout.sectionInset = UIEdgeInsetsMake(30, 60, 30, 60);
    }
    return _layout;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewItemSize:(CGSize)itemSize withhotDocArr:(NSArray *)hotDocArr{
    _itemSize = itemSize;
    if (self = [super initWithFrame:frame collectionViewLayout:self.layout]) {
        _hotDocList = hotDocArr;
        self.bounces = NO;
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[DocCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}

#pragma mark -deleagte
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.hotDocList.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DocCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    ArticleHotModel *model = self.hotDocList[indexPath.row];
    [cell.iconIV setImageURL:model.image.sx_URL];
    cell.titleLb.text = model.name;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    self.block(indexPath);
}

@end
