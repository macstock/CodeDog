
//
//  DocTableViewCell.m
//  CodeDog
//
//  Created by zerocpp on 17/1/12.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "DocTableViewCell.h"

@implementation DocTableViewCell

//头像
- (UIImageView *)headIV {
    if(_headIV == nil) {
        _headIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_headIV];
        _headIV.layer.cornerRadius = 20;
        _headIV.clipsToBounds = YES;
        [_headIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(40, 40));
            make.left.equalTo(15);
            make.top.equalTo(10);
        }];
    }
    return _headIV;
}
//用户名
- (UILabel *)userNameLb {
    if(_userNameLb == nil) {
        _userNameLb = [[UILabel alloc] init];
        _userNameLb.font = [UIFont systemFontOfSize:15];
        _userNameLb.numberOfLines = 1;
        [self.contentView addSubview:_userNameLb];
        [_userNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headIV.mas_right).offset(5);
            make.top.equalTo(self.headIV);
        }];
    }
    return _userNameLb;
}
//文件类型
- (UILabel *)fNameLb {
    if(_fNameLb == nil) {
        _fNameLb = [[UILabel alloc] init];
        _fNameLb.font = [UIFont systemFontOfSize:12];
        _fNameLb.textColor = [UIColor grayColor];
        _fNameLb.numberOfLines = 1;
        [self.contentView addSubview:_fNameLb];
        [_fNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.userNameLb);
            make.top.equalTo(self.userNameLb.mas_bottom).offset(10);
        }];
    }
    return _fNameLb;
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
            make.left.equalTo(self.fNameLb.mas_right).offset(10);
            make.top.equalTo(self.fNameLb);
        }];
    }
    return _timeLb;
}
//转发内容
- (UILabel *)contentLb {
    if(_contentLb == nil) {
        _contentLb = [[UILabel alloc] init];
        _contentLb.numberOfLines = 0;
        _contentLb.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_contentLb];
        [_contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headIV);
            make.top.equalTo(self.headIV.mas_bottom).offset(8);
            make.right.equalTo(-10);
        }];
    }
    return _contentLb;
}
//灰色背景
- (UIView *)backView {
    if(_backView == nil) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor colorWithRed:248 / 255.0 green:248 / 255.0 blue:248 / 255.0 alpha:1];
        [self.contentView addSubview:_backView];
        [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(self.contentLb.mas_bottom).offset(10);
            make.right.equalTo(-10);
            make.height.equalTo(50);
        }];
        
    }
    return _backView;
}
//文件类型图片
- (UIImageView *)fileTypeIV {
    if(_fileTypeIV == nil) {
        _fileTypeIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_fileTypeIV];
        [_fileTypeIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
//            make.centerY.equalTo(self.backView.centerY).offset(0);
            make.top.equalTo(self.contentLb.mas_bottom).offset(20);
            make.size.equalTo(CGSizeMake(40, 40));
        }];
        _fileTypeIV.image = [UIImage imageNamed:@"pdf~iphone"];
    }
    return _fileTypeIV;
}
//文件标题
-(UILabel *)fileNameLb{
    if (!_fileNameLb) {
        _fileNameLb = [UILabel new];
        [self.contentView addSubview:_fileNameLb];
        _fileNameLb.font = [UIFont systemFontOfSize:15];
        [_fileNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.fileTypeIV.mas_right).offset(5);
            make.centerY.equalTo(self.fileTypeIV);
            make.right.equalTo(-10);
        }];
    }
    return _fileNameLb;
}
//观看次数
- (UILabel *)viewNumLb {
    if(_viewNumLb == nil) {
        _viewNumLb = [[UILabel alloc] init];
        _viewNumLb.font = [UIFont systemFontOfSize:10];
        _viewNumLb.textColor = [UIColor blackColor ];
        [self.contentView addSubview:_viewNumLb];
        [_viewNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(60);
            make.top.equalTo(self.backView.mas_bottom).offset(15);
        }];
    }
    return _viewNumLb;
}
//点赞按钮
- (MCFireworksButton *)praiseBtn {
    if(_praiseBtn == nil) {
        _praiseBtn = [MCFireworksButton new];
        [self.contentView addSubview:_praiseBtn];
        [_praiseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.viewNumLb.mas_right).offset(80);
            make.top.equalTo(self.viewNumLb);
        }];
        _praiseBtn.particleImage = [UIImage imageNamed:@"Like-Sparkle~iphone"];
        _praiseBtn.particleScale = 0.05;
        _praiseBtn.particleScaleRange = 0.02;
        [_praiseBtn setImage:[UIImage imageNamed:@"unpraise~iphone"] forState:UIControlStateNormal];
        [_praiseBtn addTarget:self action:@selector(handleButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _praiseBtn;
}
- (void)handleButtonPress:(id)sender {
    _selectZan = !_selectZan;
    if(_selectZan) {
        [self.praiseBtn popOutsideWithDuration:0.6];
        [_praiseBtn setImage:[UIImage imageNamed:@"praise~iphone"] forState:UIControlStateNormal];
        [_praiseBtn animate];
    }else {
        [_praiseBtn popInsideWithDuration:0.5];
        [_praiseBtn setImage:[UIImage imageNamed:@"unpraise~iphone"] forState:UIControlStateNormal];
    }
}
//点赞数
- (UILabel *)praiseNum {
    if(_praiseNum == nil) {
        _praiseNum = [[UILabel alloc] init];
        _praiseNum.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_praiseNum];
        [_praiseNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.praiseBtn.mas_right).offset(5);
            make.top.equalTo(self.viewNumLb);
        }];
    }
    return _praiseNum;
}


- (UILabel *)commentLb {
    if(_commentLb == nil) {
        _commentLb = [[UILabel alloc] init];
         _commentLb.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_commentLb];
        [_commentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.praiseNum.mas_right).offset(80);
            make.top.equalTo(self.praiseNum);
        }];
    }
    return _commentLb;
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
