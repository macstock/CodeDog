//
//  ReadDocVC.m
//  CodeDog
//
//  Created by zerocpp on 17/2/9.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "ReadDocVC.h"

@interface ReadDocVC ()
@property(nonatomic) UILabel *titleLb;
@property(nonatomic) UIWebView *web;
@end

@implementation ReadDocVC
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
    
    UIImageView *titleView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    self.navigationItem.titleView = titleView;
    _titleLb = [UILabel new];
    [titleView addSubview:_titleLb];
    _titleLb.font = [UIFont systemFontOfSize:15];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    _titleLb.text = self.titleText;
    
    [self loadDocumentinView:self.web];
}

-(void)loadDocumentinView:(UIWebView *)webView
{
//    NSString *path = [[NSBundle mainBundle] pathForResource:documentName ofType:nil];
//    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:self.fileURL.sx_URL];
    [webView loadRequest:request];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIWebView *)web {
    if(_web == nil) {
        _web = [[UIWebView alloc] init];
//        _web.delegate = self;
        [self.view addSubview:_web];
        [_web mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _web;
}

@end
