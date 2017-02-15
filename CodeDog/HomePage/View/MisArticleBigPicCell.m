//
//  MisArticleBigPicCell.m
//  CodeDog
//
//  Created by zerocpp on 17/1/19.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "MisArticleBigPicCell.h"

@implementation MisArticleBigPicCell
-(UIImageView *)picIV{
    if(!_picIV){
        _picIV = [UIImageView new];
        [self.contentView addSubview:_picIV];
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView *ve = [[UIVisualEffectView alloc]initWithEffect:effect];
        ve.frame = _picIV.bounds;
        ve.alpha = 0.3;
        [_picIV addSubview:ve];
        [_picIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(5);
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.bottom.equalTo(-10);
        }];
    }
    return _picIV;
}

-(UILabel *)titleLb{
    if(!_titleLb){
        _titleLb = [UILabel  new];
        _titleLb.numberOfLines = 2;
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.font = [UIFont systemFontOfSize:15];
        _titleLb.textColor = [UIColor whiteColor];
        [self.picIV addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
            make.left.equalTo(20);
            make.right.equalTo(-20);
        }];
    }
    return _titleLb;
}

-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [UIView new];
        [self.picIV addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLb.mas_bottom).offset(20);
            make.size.equalTo(CGSizeMake(1, 25));
            make.centerX.equalTo(0);
        }];
    }
    return _lineView;
}
-(UILabel *)biaoqianInLb{
    if(!_biaoqianInLb){
        _biaoqianInLb = [UILabel  new];
        _biaoqianInLb.font = [UIFont systemFontOfSize:14];
        _biaoqianInLb.textColor = [UIColor whiteColor];
        [self.picIV addSubview:_biaoqianInLb];
        [_biaoqianInLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.lineView);
            make.right.equalTo(self.lineView.mas_left).offset(-10);
        }];
    }
    return _biaoqianInLb;
}

-(UILabel *)viewLb{
    if(!_viewLb){
        _viewLb=[UILabel  new];
        _viewLb.font = [UIFont systemFontOfSize:14];
        _viewLb.textColor = [UIColor whiteColor];
        [self.picIV addSubview:_viewLb];
        [_viewLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.lineView);
            make.left.equalTo(self.lineView.mas_right).offset(10);
        }];
    }
    return _viewLb;
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
