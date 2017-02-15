//
//  MisarticleTableVC.m
//  CodeDog
//
//  Created by zerocpp on 17/1/19.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "MisarticleTableVC.h"
#import "MisArticleBigPicCell.h"
#import "NetManager.h"
#import "MisArtWebView.h"

@interface MisarticleTableVC ()
@property(nonatomic) NSMutableArray<MisarticleArticleModel *> *dataList;
@property(nonatomic) NSInteger page;
@property(nonatomic) UILabel *titleLb;
@end

@implementation MisarticleTableVC
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
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[MisArticleBigPicCell class] forCellReuseIdentifier:@"cell"];
    [SXFactory addBackItemToVC:self];
    UIImageView *titleView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    self.navigationItem.titleView = titleView;
    _titleLb = [UILabel new];
    [titleView addSubview:_titleLb];
    _titleLb.font = [UIFont systemFontOfSize:15];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    self.titleLb.text = self.NaviTitle;
     MJWeakSelf
    [self.tableView addHeaderRefresh:^{
       [NetManager getMisArticleDetailWithPage:1 CompletionHandler:^(MisarticleModel *model, NSError *error) {
           if (!error) {
               [weakSelf.dataList removeAllObjects];
               [weakSelf.dataList addObjectsFromArray:model.article];
               [weakSelf.tableView reloadData];
               [weakSelf.tableView endHeaderRefresh];
               _page = 2;
           }
       }];
    }];
    [self.tableView beginHeaderRefresh];
    
    [self.tableView addFooterRefresh:^{
        [NetManager getMisArticleDetailWithPage:weakSelf.page CompletionHandler:^(MisarticleModel *model, NSError *error) {
            [weakSelf.tableView endFooterRefresh];
            [weakSelf.dataList addObjectsFromArray:model.article];
            [weakSelf.tableView reloadData];
            _page += 1;
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MisArticleBigPicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    MisarticleArticleModel *model = self.dataList[indexPath.row];
    [cell.picIV setImageURL:model.pic.sx_URL];
    [cell lineView];
    cell.titleLb.text = model.title;
    cell.biaoqianInLb.text = [NSString stringWithFormat:@"# %@", model.mname];
    NSInteger viewNum = [model.view integerValue];
    cell.viewLb.attributedText = [SXFactory addAttributedString:viewNum PvColor:pvColorWhite];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MisArtWebView *dVC = [[MisArtWebView alloc]init];
    MisarticleArticleModel *model = self.dataList[indexPath.row];
    dVC.aid = model.aid;
    [self.navigationController pushViewController:dVC animated:YES];
}

- (NSMutableArray<MisarticleArticleModel *> *)dataList {
	if(_dataList == nil) {
		_dataList = [[NSMutableArray<MisarticleArticleModel *> alloc] init];
	}
	return _dataList;
}

@end
