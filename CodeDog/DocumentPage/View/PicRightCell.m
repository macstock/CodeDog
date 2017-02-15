//
//  PicRightCell.m
//  CodeDog
//
//  Created by zerocpp on 17/1/15.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "PicRightCell.h"

@implementation PicRightCell
//用户头像
- (UIImageView *)pimgIV {
    if(_pimgIV == nil) {
        _pimgIV = [[UIImageView alloc] init];
        _pimgIV.layer.cornerRadius = 20;
        _pimgIV.clipsToBounds = YES;
        [self.contentView addSubview:_pimgIV];
        [_pimgIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(40, 40));
            make.left.equalTo(15);
            make.top.equalTo(10);
        }];
    }
    return _pimgIV;
}
//用户名
- (UILabel *)userNameLb {
    if(_userNameLb == nil) {
        _userNameLb = [[UILabel alloc] init];
        _userNameLb.font = [UIFont systemFontOfSize:15];
        _userNameLb.numberOfLines = 1;
        [self.contentView addSubview:_userNameLb];
        [_userNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.pimgIV.mas_right).offset(5);
            make.top.equalTo(self.pimgIV);
        }];
    }
    return _userNameLb;
}
//标签
- (UILabel *)biaqianLb {
    if(_biaqianLb == nil) {
        _biaqianLb = [[UILabel alloc] init];
        _biaqianLb.font = [UIFont systemFontOfSize:12];
        _biaqianLb.textColor = [UIColor grayColor];
        _biaqianLb.numberOfLines = 1;
        [self.contentView addSubview:_biaqianLb];
        [_biaqianLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.userNameLb);
            make.top.equalTo(self.userNameLb.mas_bottom).offset(10);
        }];
    }
    return _biaqianLb;
}
//时间
- (UILabel *)timeLb {
    if(_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        _timeLb.font = [UIFont systemFontOfSize:12];
        _timeLb.textColor = [UIColor grayColor];
        _timeLb.numberOfLines = 1;
        [self.contentView addSubview:_timeLb];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.biaqianLb.mas_right).offset(10);
            make.top.equalTo(self.biaqianLb);
        }];
    }
    return _timeLb;
}
//灰色视图
- (UIView *)backView {
    if(_backView == nil) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor colorWithRed:248 / 255.0 green:248 / 255.0 blue:248 / 255.0 alpha:1];
        [self.contentView addSubview:_backView];
        [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(self.pimgIV.mas_bottom).offset(10);
            make.right.equalTo(-10);
            make.height.equalTo(100);
        }];
    }
    return _backView;
}
//文章标题
- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.numberOfLines = 2;
        _titleLb.font = [UIFont systemFontOfSize:14];
        [self.backView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.top.equalTo(10);
            make.right.equalTo(self.picIV.mas_left).offset(-10);
        }];
    }
    return _titleLb;
}
//阅读数 评论
- (UILabel *)readLb {
    if(_readLb == nil) {
        _readLb = [[UILabel alloc] init];
        _readLb.font = [UIFont systemFontOfSize:10];
        _readLb.textColor = [UIColor grayColor];
        [self.backView addSubview:_readLb];
        [_readLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.bottom.equalTo(-20);
        }];
    }
    return _readLb;
}

-(UIImageView *)picIV{
    if (!_picIV) {
        _picIV = [UIImageView new];
        [self.backView addSubview:_picIV];
        [_picIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-5);
            make.left.equalTo(self.titleLb.mas_right).offset(10);
            make.centerY.equalTo(0);
            make.height.equalTo(90);
            make.width.equalTo(90);
        }];
        
    }
    return _picIV;
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
