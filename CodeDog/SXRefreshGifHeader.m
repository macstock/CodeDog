//
//  SXRefreshGifHeader.m
//  Day15_GameLive
//
//  Created by zerocpp on 16/11/22.
//  Copyright © 2016年 zerocpp. All rights reserved.
//

#import "SXRefreshGifHeader.h"

@implementation SXRefreshGifHeader

-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self addSubview:_titleLb];
        _titleLb.font = [UIFont systemFontOfSize:13];
        _titleLb.textColor = [UIColor lightGrayColor];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(0);
        }];
    }
    return _titleLb;
}

//MJ 用于布局的方法 通过重写进行一些改动
-(void)placeSubviews{
    [super placeSubviews];
    if (self.stateLabel.hidden && self.lastUpdatedTimeLabel.hidden) {
        self.gifView.contentMode = UIViewContentModeTop;
//        [self titleLb];
        self.mj_h = 80;
    }
}







@end
