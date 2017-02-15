//
//  SettingVC.m
//  CodeDog
//
//  Created by zerocpp on 17/1/4.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "SettingVC.h"
#import "NetManager.h"
#import "FirstWaves.h"
#import "SecondWaves.h"
#import "MineTVC.h"

@interface SettingVC ()
@property(nonatomic) NSString *mineStr;

@property (nonatomic,strong)FirstWaves *firstWare;
@property (nonatomic,strong)SecondWaves *secondWare;
@end

@implementation SettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    //第一个波浪
    self.firstWare = [[FirstWaves alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 300)];
    self.firstWare.alpha = 0.6;
    //第二个波浪
    self.secondWare = [[SecondWaves alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 300)];
    self.secondWare.alpha = 0.6;
    [self.view addSubview:self.firstWare];
    [self.view addSubview:self.secondWare];
    //是否有震荡效果
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(animateWave) userInfo:nil repeats:YES];
    
    UIView *setView = [UIView new];
    setView.alpha = 0;
    [self.view addSubview:setView];
    [setView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(0);
        make.height.equalTo(250);
    }];
    UIImageView *loginView = [UIImageView new];
    [NetManager getMinePageCompletionHandler:^(MineModel *model, NSError *error) {
        _mineStr = model.data.pimg;
//        [loginView setImageURL:self.mineStr.sx_URL];
    }];
    loginView.image = [UIImage imageNamed:@"headIV"];
    loginView.layer.cornerRadius = 45;
    loginView.clipsToBounds = YES;
    [self.view addSubview:loginView];
    [loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.top.equalTo(100);
        make.size.equalTo(CGSizeMake(90, 90));
    }];
//    UIButton *changeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    [changeBtn setTitle:@"修改头像" forState:UIControlStateNormal];
//    [changeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [self.view addSubview:changeBtn];
//    [changeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(0);
//        make.top.equalTo(loginView.mas_bottom).offset(10);
//        make.size.equalTo(CGSizeMake(80, 40));
//    }];
//    [changeBtn addTarget:self action:@selector(changeIV) forControlEvents:UIControlEventTouchUpInside];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MIne" bundle:nil];
    
    MineTVC *vc = [sb instantiateViewControllerWithIdentifier:@"mineTVC"];
    [self addChildViewController:vc];
    [self.view addSubview:vc.tableView];
    [vc.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(0);
        make.top.equalTo(setView.mas_bottom);
    }];
}
-(void)changeIV{
    NSLog(@"111");
}
- (void)animateWave{
    [UIView animateWithDuration:1 animations:^{
        self.firstWare.transform = CGAffineTransformMakeTranslation(0, 20);
        self.secondWare.transform = CGAffineTransformMakeTranslation(0, 20);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            self.firstWare.transform = CGAffineTransformMakeTranslation(0, 0);
            self.secondWare.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:nil];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
