//
//  HeaderView.h
//  CodeDog
//
//  Created by zerocpp on 17/1/9.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UITableViewHeaderFooterView
@property(nonatomic) UIView *backView;
@property(nonatomic) UIView *lineView;
@property(nonatomic) UILabel *titleLb;
@property(nonatomic) UIButton *moreBtn;
@property(nonatomic) UIImageView *moreIV;

//
@property(nonatomic) void (^pushVC)(HeaderView * hv);
@end
