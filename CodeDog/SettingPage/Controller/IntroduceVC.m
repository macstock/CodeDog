//
//  IntroduceVC.m
//  CodeDog
//
//  Created by zerocpp on 17/2/9.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "IntroduceVC.h"

@interface IntroduceVC ()
@property(nonatomic) UILabel *titleLb;
@end

@implementation IntroduceVC
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = YES;
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [SXFactory addBackItemToVC:self];
    UIImageView *titleView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
    self.navigationItem.titleView = titleView;
    _titleLb = [UILabel new];
    [titleView addSubview:_titleLb];
    _titleLb.font = [UIFont systemFontOfSize:15];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    self.titleLb.text = @"程序员区简介";
    
    UITextView *textview = [UITextView new];
    [self.view addSubview:textview];
    [textview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(5);
        make.top.equalTo(20);
        make.right.bottom.equalTo(-5);
    }];
    textview.scrollEnabled = NO;
    textview.editable = YES;
    textview.font = [UIFont systemFontOfSize:15];
    textview.text = @"程序员区是IT阅读行业的一股清流、程序员周边服务平台。在这里，你可以发现各种新鲜热门的技术文章品。你也可以把自己的故事和想法写出来与人分享，找到同好。程序员区致力于提供最好的阅读体验。简单优雅的设计，给用户带来不一样的愉快感受。同时，还提供了文档社区、极客周边、原创、收藏夹等功能，总之，程序员需要的都在这里。程序员区是一个开放而友好的程序员社区，在这里发现与众不同的自己。";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
