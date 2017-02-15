//
//  HotArticleTableViewCell.m
//  CodeDog
//
//  Created by zerocpp on 17/1/8.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "HotArticleTableViewCell.h"

@implementation HotArticleTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //去掉cell分割线的左侧短缺
        self.separatorInset = UIEdgeInsetsZero;
//        self.layoutMargins = UIEdgeInsetsZero;
//        self.preservesSuperviewLayoutMargins = NSNotFound;
    }return self;
}

-(UIImageView *)iconIV
{
    if(!_iconIV){
        _iconIV=[UIImageView new];
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV.clipsToBounds = YES;
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            //255 * 140  cell高200
            make.left.equalTo(10);
            make.centerY.equalTo(0);
            make.size.equalTo(CGSizeMake(130, 75));
        }];
    }
    return _iconIV;
}

-(UILabel *)titleLb
{
    if(!_titleLb){
        _titleLb=[UILabel new];
        [self.contentView addSubview:_titleLb];
        _titleLb.font = [UIFont systemFontOfSize:13];
        _titleLb.numberOfLines = 2;
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIV.mas_right).offset(10);
            make.top.equalTo(self.iconIV);
            make.right.equalTo(-20);
        }];
    }
    return _titleLb;
}

-(UILabel *)viewNumLb
{
    if(!_viewNumLb){
        _viewNumLb=[UILabel new];
        [self.contentView addSubview:_viewNumLb];
        _viewNumLb.font = [UIFont systemFontOfSize:10];
        _viewNumLb.textColor = [UIColor grayColor];
        [_viewNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIV.mas_right).offset(10);
            make.top.equalTo(self.titleLb.mas_bottom).offset(30);
        }];
    }
    return _viewNumLb;
}

-(UILabel *)typeLb
{
    if(!_typeLb){
        _typeLb=[UILabel  new];
        [self.contentView addSubview:_typeLb];
        _typeLb.font = [UIFont systemFontOfSize:10];
        _typeLb.textColor = [UIColor grayColor];
        [_typeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.titleLb);
            make.top.equalTo(self.viewNumLb);
        }];
    }
    return _typeLb;
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
