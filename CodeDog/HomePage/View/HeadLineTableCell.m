//
//  HeadLineTableCell.m
//  CodeDog
//
//  Created by zerocpp on 17/1/10.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "HeadLineTableCell.h"

@implementation HeadLineTableCell
//- (UIImageView *)iconIV {
//    if(_iconIV == nil) {
//        _iconIV = [[UIImageView alloc] init];
//        [self.contentView addSubview:_iconIV];
//        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(5);
//            make.centerY.equalTo(0);
//            make.size.equalTo(CGSizeMake(30, 30));
//        }];
//    }
//    return _iconIV;
//}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:12];
        _titleLb.textColor = [UIColor grayColor];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.centerY.equalTo(0);
        }];
    }
    return _titleLb;
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
