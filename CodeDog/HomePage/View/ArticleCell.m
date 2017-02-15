//
//  ArticleCell.m
//  CodeDog
//
//  Created by zerocpp on 17/1/23.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "ArticleCell.h"

@implementation ArticleCell

- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV.clipsToBounds = YES;
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.bottom.equalTo(-30);
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:13];
        _titleLb.numberOfLines = 2;
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.iconIV);
            make.top.equalTo(self.iconIV.mas_bottom).offset(3);
        }];
    }
    return _titleLb;
}

- (UILabel *)viewNumLb {
    if(_viewNumLb == nil) {
        _viewNumLb = [[UILabel alloc] init];
        _viewNumLb.font = [UIFont systemFontOfSize:10];
        _viewNumLb.textColor = [UIColor whiteColor];
        [self.iconIV addSubview:_viewNumLb];
        [_viewNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(8);
            make.bottom.equalTo(-3);
        }];
    }
    return _viewNumLb;
}
@end
