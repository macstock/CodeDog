
//
//  DetailDocVC.m
//  CodeDog
//
//  Created by zerocpp on 17/1/23.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "DetailDocVC.h"
#import "NetManager.h"

@interface DetailDocVC ()<UIWebViewDelegate>
@property(nonatomic) DetailDataModel *detailModel;
@property(nonatomic) UIWebView *web;
@property(nonatomic) UILabel *titleLb;
@end

@implementation DetailDocVC

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = YES;
}

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

#pragma mark -Life
- (void)viewDidLoad {
    [super viewDidLoad];
    [SXFactory addBackItemToVC:self];
    UIImageView *titleView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    self.navigationItem.titleView = titleView;
    _titleLb = [UILabel new];
    [titleView addSubview:_titleLb];
    _titleLb.font = [UIFont systemFontOfSize:15];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    [self web];
    [NetManager getDetailDocWithAid:_aid CompletionHandler:^(DetailDocModel *model, NSError *error) {
        //        NSLog(@"%@", [NSThread currentThread]);
        _detailModel = model.data;
        self.titleLb.text = self.detailModel.title;
        [self.web loadRequest:[NSURLRequest requestWithURL:self.detailModel.url.sx_URL]];
    }];
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setBackgroundImage:[UIImage imageNamed:@"share~iphone"] forState:UIControlStateNormal];
//    btn.frame = CGRectMake(0, 0, 20, 4);
    
//    __weak typeof(self) weakSelf = self;
//    [btn bk_addEventHandler:^(id sender) {
//        //显示分享面板
//        [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
//            //真正的调用分享
//            [weakSelf shareTextToPlatformType:platformType];
//        }];
//        
//    } forControlEvents:UIControlEventTouchUpInside];
    //[btn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    
    //修复距离
//    UIBarButtonItem *fixedItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    fixedItem.width = 10;
//    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
//    //    self.navigationItem.rightBarButtonItems = @[item, fixedItem];
//    self.navigationItem.rightBarButtonItem = item;
    
}

//-(void)share{
//    __weak typeof(self) weakSelf = self;
//    //显示分享面板
//    [UMSocialUIManager  showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
//        //真正的调用分享
//        [weakSelf shareTextToPlatformType:platformType];
//    }];
//}
//- (void)shareTextToPlatformType:(UMSocialPlatformType)platformType
//{
//    //创建分享消息对象
//    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//    //设置文本
//    messageObject.text = @"社会化组件UShare将各大社交平台接入您的应用，快速武装App。";
//    
//    //调用分享接口
//    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
//        if (error) {
//            NSLog(@"************Share fail with error %@*********",error);
//        }else{
//            NSLog(@"response data is %@",data);
//        }
//    }];
//}
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
