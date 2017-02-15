//
//  misarticleTableViewCell.m
//  CodeDog
//
//  Created by zerocpp on 17/1/7.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "misarticleTableViewCell.h"

@implementation misarticleTableViewCell
- (UIView *)collectionView {
    if(_collectionView == nil) {
        _collectionView = [[UIView alloc] init];
        [self.contentView addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _collectionView;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
