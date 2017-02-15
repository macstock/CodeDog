//
//  TabBarVC.m
//  CodeDog
//
//  Created by zerocpp on 17/1/4.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "TabBarVC.h"

@interface TabBarVC ()

@end

@implementation TabBarVC
#pragma mark -Lazy
- (HomeVC *)homeVC {
    if(_homeVC == nil) {
        _homeVC = [[HomeVC alloc] init];
        _homeVC.tabBarItem.title = @"首页";
        _homeVC.tabBarItem.image = [UIImage imageNamed:@"home~iphone"];
        _homeVC.tabBarItem.selectedImage = [UIImage imageNamed:@"home_select~iphone"];
    }
    return _homeVC;
}

- (ArticleVC *)articleVC {
    if(_articleVC == nil) {
        _articleVC = [[ArticleVC alloc] initWithStyle:UITableViewStyleGrouped];
        _articleVC.tabBarItem.title = @"文档";
        _articleVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_article~iphone"];
        _articleVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_article_select~iphone"];
    }
    return _articleVC;
}

- (DocumentVC *)documentVC {
    if(_documentVC == nil) {
        _documentVC = [[DocumentVC alloc] init];
        _documentVC.tabBarItem.title = @"文章";
        _documentVC.tabBarItem.image = [UIImage imageNamed:@"topic~iphone"];
        _documentVC.tabBarItem.selectedImage = [UIImage imageNamed:@"topic_select~iphone"];
    }
    return _documentVC;
}

- (SettingVC *)settingVC {
    if(_settingVC == nil) {
        _settingVC = [[SettingVC alloc] init];
        _settingVC.tabBarItem.title = @"设置";
        _settingVC.tabBarItem.image = [UIImage imageNamed:@"my~iphone"];
        _settingVC.tabBarItem.selectedImage = [UIImage imageNamed:@"my_select~iphone"];
    }
    return _settingVC;
}

#pragma mark -Life
- (void)viewDidLoad {
    [super viewDidLoad];
    //修改所有item的选中状态时的默认文字颜色 全局设置
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont systemFontOfSize:20]} forState:UIControlStateSelected];
    //全局修改导航栏以及选项卡栏为不透明
    [UITabBar appearance].translucent = NO;
    [UINavigationBar appearance].translucent = NO;
    UINavigationController *homeNavi = [[UINavigationController alloc]initWithRootViewController:self.homeVC];
    UINavigationController *articleNavi = [[UINavigationController alloc]initWithRootViewController:self.articleVC];
    UINavigationController *documentNavi = [[UINavigationController alloc]initWithRootViewController:self.documentVC];
    UINavigationController *settingNavi = [[UINavigationController alloc]initWithRootViewController:self.settingVC];
    self.viewControllers = @[homeNavi, articleNavi, documentNavi, settingNavi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
