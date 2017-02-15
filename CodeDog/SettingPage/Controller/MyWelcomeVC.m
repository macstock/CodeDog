//
//  MyWelcomeVC.m
//  CodeDog
//
//  Created by zerocpp on 17/2/9.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "MyWelcomeVC.h"

@interface MyWelcomeVC ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@end

@implementation MyWelcomeVC
-(BOOL)prefersStatusBarHidden{
    return YES;
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (UIScrollView *)scrollView {
    if(_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
        [self.view addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        self.scrollView.delegate = self;
        self.scrollView.bounces = NO;
        self.scrollView.pagingEnabled = YES;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height);
        //向 scrollView中添加 要显示的内容
        for (NSInteger i = 0; i < 3; i++) {
            UIImageView *imageView = [[UIImageView alloc]init];
            imageView.frame = CGRectMake(i * self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
            NSString *imageName = [NSString stringWithFormat:@"guide%ld", i+1];
            imageView.image = [UIImage imageNamed:imageName];
            [self.scrollView addSubview:imageView];
            //如果是最后一个iamgeView
            if (i == 2) {
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [imageView addSubview:btn];
                [btn setBackgroundImage:[UIImage imageNamed:@"guide_button"] forState:UIControlStateNormal];
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(0);
                    make.bottom.equalTo(-60);
                    make.size.equalTo(CGSizeMake(150, 50));
                }];
                [btn addTarget:self action:@selector(enterLoginVC:) forControlEvents:UIControlEventTouchUpInside];
                imageView.userInteractionEnabled = YES;
            }
        }
    }
    return _scrollView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self scrollView];
}

-(void)enterLoginVC:(UIButton*)sender {
    [UIView animateWithDuration:1 animations:^{
        //放大
        self.view.transform = CGAffineTransformMakeScale(1.5, 1.5);
        
    } completion:^(BOOL finished) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
