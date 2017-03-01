//
//  MisArtWebView.m
//  CodeDog
//
//  Created by zerocpp on 17/1/22.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "MisArtWebView.h"
#import "NetManager.h"

@interface MisArtWebView ()<UIWebViewDelegate>
@property(nonatomic) DetailDataModel *detailModel;
@property(nonatomic) UIWebView *web;
@property(nonatomic) UILabel *titleLb;
@end

@implementation MisArtWebView
#pragma mark -delegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self.view showMsg:@"正在加载"];
//    [self.view showBusy];
}
    
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self.view hideBusy];
    NSString *getPStr = @"var pElement = document.getElementsByTagName('header')[0];";
    NSString *getPStr2 = @"var pElement = document.getElementsByTagName('footer')[0];";
    NSString *deletePStr = @"pElement.remove();";
    NSString *deletePStr2 = @"pElement.remove();";
    [webView stringByEvaluatingJavaScriptFromString:getPStr];
    [webView stringByEvaluatingJavaScriptFromString:deletePStr];
    [webView stringByEvaluatingJavaScriptFromString:getPStr2];
    [webView stringByEvaluatingJavaScriptFromString:deletePStr2];
    
}
    
    //纯代码初始化  隐藏底部bar
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [SXFactory addBackItemToVC:self];
    //    [SXFactory addShareItemToVC:self];
    UIImageView *titleView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    self.navigationItem.titleView = titleView;
    _titleLb = [UILabel new];
    [titleView addSubview:_titleLb];
    _titleLb.font = [UIFont systemFontOfSize:15];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    [self web];
    [NetManager getMisArtDetailWithAid:self.aid CompletionHandler:^(DetailDocModel *model, NSError *error) {
        _detailModel = model.data;
        self.titleLb.text = self.detailModel.title;
        [self.web loadRequest:[NSURLRequest requestWithURL:self.detailModel.url.sx_URL]];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIWebView *)web {
    if(_web == nil) {
        _web = [[UIWebView alloc] init];
        _web.delegate = self;
        [self.view addSubview:_web];
        [_web mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _web;
}

@end
