//
//  DocTableViewCell.h
//  CodeDog
//
//  Created by zerocpp on 17/1/12.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DocTableViewCell : UITableViewCell
@property(nonatomic) UIImageView *headIV;
@property(nonatomic) UILabel *userNameLb;
@property(nonatomic) UILabel *fNameLb;
@property(nonatomic) UILabel *timeLb;
@property(nonatomic) UILabel *contentLb;
@property(nonatomic) UIView *backView;
@property(nonatomic) UIImageView *fileTypeIV;
@property(nonatomic) UILabel *fileNameLb;
@property(nonatomic) UILabel *viewNumLb;
@property(nonatomic) MCFireworksButton *praiseBtn;
@property(nonatomic) UILabel *praiseNum;
@property(nonatomic) UILabel *commentLb;

@property(nonatomic) BOOL selectZan;
@end
