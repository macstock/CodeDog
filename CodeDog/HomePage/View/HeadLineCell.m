//
//  HeadLineCell.m
//  CodeDog
//
//  Created by zerocpp on 17/1/10.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "HeadLineCell.h"

@implementation HeadLineCell

- (UIImageView *)headIV {
    if(_headIV == nil) {
        _headIV = [[UIImageView alloc] init];
        _headIV.image = [UIImage imageNamed:@"toutiao~iphone"];
        [self.contentView addSubview:_headIV];
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headIV.mas_right).offset(10);
            make.size.equalTo(CGSizeMake(1, 88));
        }];
        [_headIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.centerY.equalTo(0);
            make.size.equalTo(CGSizeMake(70, 70));
        }];
    }
    return _headIV;
}

- (UIView *)headLineView {
    [self headIV];
    if(_headLineView == nil) {
        _headLineView = [[UIView alloc] init];
        [self.contentView addSubview:_headLineView];
        [_headLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headIV.mas_right).offset(30);
            make.right.bottom.top.equalTo(0);
        }];
    }
    return _headLineView;
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
