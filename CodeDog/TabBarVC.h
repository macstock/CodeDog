//
//  TabBarVC.h
//  CodeDog
//
//  Created by zerocpp on 17/1/4.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeVC.h"
#import "ArticleVC.h"
#import "DocumentVC.h"
#import "SettingVC.h"

@interface TabBarVC : UITabBarController
@property(nonatomic) HomeVC *homeVC;
@property(nonatomic) ArticleVC *articleVC;
@property(nonatomic) DocumentVC *documentVC;
@property(nonatomic) SettingVC *settingVC;

@end
