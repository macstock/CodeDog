//
//  DownloadVC.m
//  CodeDog
//
//  Created by zerocpp on 17/1/20.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "DownloadVC.h"
#import "NetManager.h"
#import "ZZCircleProgress.h"
#import "SRDownloadManager.h"
#import "ReadDocVC.h"

#define ZZRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface DownloadVC ()
@property(nonatomic) NSMutableArray<DocDetailCommentsModel *> *commentList;
@property(nonatomic) NSMutableArray<DocDetailPraisesModel *> *praiseList;
@property(nonatomic) NSDictionary *model;
@property(nonatomic) UILabel *titleLb;

//UI部分
@property(nonatomic) UIImageView *iconIV;
@property(nonatomic) UILabel *docLb;
@property(nonatomic) UILabel *nameLb;
@property(nonatomic) UIView *lineView;
@property(nonatomic) UILabel *timeLb;
@property(nonatomic) UILabel *typeLb;
@property(nonatomic) UILabel *sizeLb;
@property(nonatomic) UIView *backView;
@property(nonatomic) UILabel *stateLb;
@property(nonatomic) UIButton *downloadBtn;
@property(nonatomic) UIButton *viewButton;
@property(nonatomic) UIButton *shareButton;
//环形下载
@property(nonatomic) ZZCircleProgress *dCircle;
@property(nonatomic) double downloadProgress;
@property(nonatomic) NSURL *downloadURL;
@property(nonatomic) NSString *fileURL;

@property(nonatomic) NSString *fileName;
@end

@implementation DownloadVC
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
    self.view.backgroundColor = [UIColor whiteColor];
    [SXFactory addBackItemToVC:self];
    UIImageView *titleView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    self.navigationItem.titleView = titleView;
    _titleLb = [UILabel new];
    [titleView addSubview:_titleLb];
    _titleLb.font = [UIFont systemFontOfSize:15];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    self.titleLb.text = @"文件预览";
    
    [NetManager getDocDetailWithAid:self.aid CompletionHandler:^(DocDetailModel *model, NSError *error) {
        if (!error) {
            [self.commentList removeAllObjects];
            [self.commentList addObjectsFromArray:model.discuss.comments];
            [self.praiseList removeAllObjects];
            [self.praiseList addObjectsFromArray:model.discuss.praises];
            self.fileName = model.discuss.filename;
            //UI部分
            [self lineView];
            [self backView];
            //tag == 1 pdf   2--> doc  3->xls 4->ppt
            if ([model.discuss.tag integerValue] == 1) {
                self.iconIV.image = [UIImage imageNamed:@"pdf~iphone"];
            }else if ([model.discuss.tag integerValue] == 2) {
                self.iconIV.image = [UIImage imageNamed:@"doc~iphone"];
            }else if ([model.discuss.tag integerValue] == 3) {
                self.iconIV.image = [UIImage imageNamed:@"xls~iphone"];
            }else if ([model.discuss.tag integerValue] == 4) {
                self.iconIV.image = [UIImage imageNamed:@"ppt~iphone"];
            }
            self.docLb.text = model.discuss.filename;
            self.nameLb.text = [NSString stringWithFormat:@"分享人: %@", model.discuss.username];
            self.timeLb.text = [SXFactory timeWithTimeIntervalString:model.discuss.ctime];
            self.typeLb.text = [NSString stringWithFormat:@"来自: %@", model.discuss.fname];
            self.sizeLb.text = [NSString stringWithFormat:@"%@ M", model.discuss.totalsize];
            self.stateLb.text = @"程序员区，IT阅读行业的一股清流";
            [self downloadBtn];
            [self dCircle];
            _downloadURL = model.discuss.fileurl.sx_URL;
            _fileURL = model.discuss.fileurl;
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -Lazy
- (NSMutableArray<DocDetailCommentsModel *> *)commentList {
	if(_commentList == nil) {
		_commentList = [[NSMutableArray<DocDetailCommentsModel *> alloc] init];
	}
	return _commentList;
}

- (NSMutableArray<DocDetailPraisesModel *> *)praiseList {
	if(_praiseList == nil) {
		_praiseList = [[NSMutableArray<DocDetailPraisesModel *> alloc] init];
	}
	return _praiseList;
}

#pragma mark -UI部分
- (UIImageView *)iconIV {
	if(_iconIV == nil) {
		_iconIV = [[UIImageView alloc] init];
        [self.view addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.top.equalTo(10);
            make.size.equalTo(CGSizeMake(40, 40));
        }];
        _iconIV.image = [UIImage imageNamed:@"pdf~iphone"];
	}
	return _iconIV;
}

- (UILabel *)docLb {
	if(_docLb == nil) {
		_docLb = [[UILabel alloc] init];
        [self.view addSubview:_docLb];
        _docLb.font = [UIFont systemFontOfSize:15];
        [_docLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIV.mas_right).offset(10);
            make.centerY.equalTo(self.iconIV);
            make.right.equalTo(-10);
        }];
	}
	return _docLb;
}

- (UIView *)lineView {
    if(_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconIV.mas_bottom).offset(10);
            make.left.right.equalTo(0);
            make.height.equalTo(1);
        }];
    }
    return _lineView;
}
- (UILabel *)nameLb {
	if(_nameLb == nil) {
		_nameLb = [[UILabel alloc] init];
        _nameLb.font = [UIFont systemFontOfSize:12];
        _nameLb.textColor = [UIColor grayColor];
        [self.view addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(self.lineView.mas_bottom).offset(15);
        }];
	}
	return _nameLb;
}

- (UILabel *)timeLb {
	if(_timeLb == nil) {
		_timeLb = [[UILabel alloc] init];
        _timeLb.font = [UIFont systemFontOfSize:12];
        _timeLb.textColor = [UIColor grayColor];
        [self.view addSubview:_timeLb];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.top.equalTo(self.nameLb);
        }];
	}
	return _timeLb;
}

- (UILabel *)typeLb {
	if(_typeLb == nil) {
		_typeLb = [[UILabel alloc] init];
        _typeLb.font = [UIFont systemFontOfSize:12];
        _typeLb.textColor = [UIColor grayColor];
        [self.view addSubview:_typeLb];
        [_typeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(self.nameLb.mas_bottom).offset(15);
        }];
	}
	return _typeLb;
}

- (UILabel *)sizeLb {
	if(_sizeLb == nil) {
		_sizeLb = [[UILabel alloc] init];
        _sizeLb.font = [UIFont systemFontOfSize:12];
        _sizeLb.textColor = [UIColor grayColor];
        [self.view addSubview:_sizeLb];
        [_sizeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.top.equalTo(self.typeLb);
        }];
	}
	return _sizeLb;
}

- (UIView *)backView {
	if(_backView == nil) {
		_backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor colorWithRed:248 / 255.0 green:248 / 255.0 blue:248 / 255.0 alpha:1];
        [self.view addSubview:_backView];
        [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.top.equalTo(self.typeLb.mas_bottom).offset(15);
        }];
	}
	return _backView;
}

- (UILabel *)stateLb {
	if(_stateLb == nil) {
		_stateLb = [[UILabel alloc] init];
        _stateLb.font = [UIFont systemFontOfSize:13];
        [self.backView addSubview:_stateLb];
        [_stateLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(40);
        }];
	}
	return _stateLb;
}

- (UIButton *)downloadBtn {
	if(_downloadBtn == nil) {
		_downloadBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.backView addSubview:_downloadBtn];
        [_downloadBtn setBackgroundImage:[UIImage imageNamed:@"download_bg~iphone"] forState:UIControlStateNormal];
        [_downloadBtn setTitle:@"开始下载" forState:UIControlStateNormal];
        [_downloadBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_downloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(-100);
            //背景图片大小 320 * 71
            make.size.equalTo(CGSizeMake(150, 35));
        }];
        _downloadProgress = [[SRDownloadManager sharedManager] progress:self.downloadURL];
        NSLog(@"%f", self.downloadProgress);
        self.dCircle.progress = _downloadProgress * 100;
        
        [_downloadBtn addTarget:self action:@selector(downloadFile) forControlEvents:UIControlEventTouchUpInside];
	}
	return _downloadBtn;
}
-(UIButton *)viewButton{
    if (_viewButton == nil) {
        _viewButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.backView addSubview:_viewButton];
        [_viewButton setBackgroundImage:[UIImage imageNamed:@"download_bg~iphone"] forState:UIControlStateNormal];
        [_viewButton setTitle:@"打开文件" forState:UIControlStateNormal];
        [_viewButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_viewButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(-100);
            //背景图片大小 320 * 71
            make.size.equalTo(CGSizeMake(150, 35));
        }];
        [_viewButton addTarget:self action:@selector(goToView) forControlEvents:UIControlEventTouchUpInside];
        
        _shareButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.backView addSubview:_shareButton];
        [_shareButton setBackgroundImage:[UIImage imageNamed:@"download_bg~iphone"] forState:UIControlStateNormal];
        [_shareButton setTitle:@"分享页面" forState:UIControlStateNormal];
        [_shareButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(self.viewButton.mas_bottom).offset(15);
            //背景图片大小 320 * 71
            make.size.equalTo(CGSizeMake(150, 35));
        }];
        [_shareButton addTarget:self action:@selector(shareView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _viewButton;
}
-(void)shareView{
    __weak typeof(self) weakSelf = self;
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        //真正的调用分享
        [weakSelf shareTextToPlatformType:platformType];
    }];
}

- (void)shareTextToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //设置文本
    messageObject.text = @"程序员区是IT阅读行业的一股清流、程序员周边服务平台。在这里，你可以发现各种新鲜热门的技术文章品。";
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];
}

#pragma mark - 查看文档
-(void)goToView{
    ReadDocVC *vc = [ReadDocVC new];
    vc.titleText = self.fileName;
    vc.fileURL = self.fileURL;
    [self.navigationController pushViewController:vc animated:YES];
}

- (SRDownloadState)stateWithProgress:(CGFloat)progress {
    SRDownloadState state;
    if (progress == 1.0) {
        state = SRDownloadStateCompleted;
    } else if (progress > 0) {
        state = SRDownloadStateSuspended;
    } else {
        state = SRDownloadStateFailed;
    }
    return state;
}
#pragma mark -下载文档
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //如果是下载完成的状态 则显示为100%
    if ([[SRDownloadManager sharedManager] isCompleted:self.downloadURL]) {
        _dCircle.progress = 1;
        [self.downloadBtn setHidden:YES];
        [self viewButton];
    }
}
-(void)downloadFile{
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSString *pathDocuments = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] ;
    NSString *createPath = [NSString stringWithFormat:@"%@/SRDownloadManager", pathDocuments];
    
    // 判断文件夹是否存在，如果不存在，则创建
    if (![[NSFileManager defaultManager] fileExistsAtPath:createPath]) {
        [fileManager createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
    } else {
        NSLog(@"FileDir is exists.");
    }
    [[SRDownloadManager sharedManager] download:self.downloadURL state:^(SRDownloadState state) {
        
    } progress:^(NSInteger receivedSize, NSInteger expectedSize, CGFloat progress) {
        self.dCircle.progress = progress;
        _downloadProgress = progress;
    } completion:^(BOOL isSuccess, NSString *filePath, NSError *error) {
        if (isSuccess) {
            NSLog(@"%@", filePath);
            [self.downloadBtn setHidden:YES];
            [self viewButton];
        } else {
            NSLog(@"%@", error);
        }
    }];
}

- (ZZCircleProgress *)dCircle {
    if(_dCircle == nil) {
        _dCircle = [[ZZCircleProgress alloc] initWithFrame:CGRectZero pathBackColor:nil pathFillColor:[UIColor blueColor] startAngle:-255 strokeWidth:10];
        _dCircle.reduceValue = 30;
        _dCircle.increaseFromLast = YES;
        _dCircle.pointImage = [UIImage imageNamed:@"test_point"];
//        _dCircle.progress = 0;
        _dCircle.progress = self.downloadProgress;
        [self.view addSubview:_dCircle];
        [_dCircle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(self.downloadBtn.mas_top).offset(-20);
            make.size.equalTo(CGSizeMake(150, 150));
        }];
    }
    return _dCircle;
}


@end
