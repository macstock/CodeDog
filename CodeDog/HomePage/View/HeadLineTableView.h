//
//  HeadLineTableView.h
//  CodeDog
//
//  Created by zerocpp on 17/1/10.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface HeadLineTableView : UITableView
- (instancetype)initWithFrame:(CGRect)frame withHeadLineArr:(NSArray *)headLineArr;
@end
