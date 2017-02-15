//
//  HeaderView.m
//  CodeDog
//
//  Created by zerocpp on 17/1/9.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView
- (UIView *)backView {
    if(_backView == nil) {
        _backView = [[UIView alloc] init];
        [self addSubview:_backView];
        _backView.backgroundColor = [UIColor whiteColor];
        [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _backView;
}


- (UIView *)lineView {
    if(_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithRed:48 / 255.0 green:223 / 255.0 blue:255 /255.0 alpha:1];
        [self.backView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.centerY.equalTo(0);
            make.size.equalTo(CGSizeMake(2, 20));
        }];
    }
    return _lineView;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self moreIV];
        [self moreBtn];
        [self lineView];
        [self.backView addSubview:_titleLb];
        _titleLb.font = [UIFont systemFontOfSize:14];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lineView.mas_right).offset(6);
            make.centerY.equalTo(0);
        }];
    }
    return _titleLb;
}

- (UIButton *)moreBtn {
    if(_moreBtn == nil) {
        _moreBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        [_moreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.backView addSubview:_moreBtn];
        [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.moreIV.mas_left).offset(0);
            make.size.equalTo(CGSizeMake(40, 20));
            make.centerY.equalTo(0);
        }];
        
        [_moreBtn bk_addEventHandler:^(id sender) {
            !self.pushVC ?: self.pushVC(self);
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreBtn;
}

- (UIImageView *)moreIV {
    if(_moreIV == nil) {
        _moreIV = [[UIImageView alloc] init];
        [self.backView addSubview:_moreIV];
        _moreIV.image = [UIImage imageNamed:@"more_list~iphone"];
        [_moreIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.centerY.equalTo(0);
            make.size.equalTo(CGSizeMake(15, 15));
        }];
    }
    return _moreIV;
}


@end
