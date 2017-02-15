//
//  HotarticleTableVC.m
//  CodeDog
//
//  Created by zerocpp on 17/1/19.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "HotarticleTableVC.h"
#import "HotArticleTableViewCell.h"
#import "NetManager.h"
#import "DetailDocVC.h"

@interface HotarticleTableVC ()
@property(nonatomic) NSMutableArray *dataList;
@property(nonatomic) NSInteger page;
@property(nonatomic) UILabel *titleLb;
@end

@implementation HotarticleTableVC
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
    [self.tableView registerClass:[HotArticleTableViewCell class] forCellReuseIdentifier:@"cell"];
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
       [NetManager getHotArticleDetailWithPage:1 CompletionHandler:^(HotarticleModel *model, NSError *error) {
           if (!error) {
               [weakSelf.dataList removeAllObjects];
               [weakSelf.dataList addObjectsFromArray:model.data];
               [weakSelf.tableView reloadData];
               [weakSelf.tableView endHeaderRefresh];
               _page = 2;
           }
       }];
    }];
    [self.tableView beginHeaderRefresh];
    
    [self.tableView addFooterRefresh:^{
        [NetManager getHotArticleDetailWithPage:weakSelf.page CompletionHandler:^(HotarticleModel *model, NSError *error) {
            [weakSelf.tableView endFooterRefresh];
            [weakSelf.dataList addObjectsFromArray:model.data];
            [weakSelf.tableView reloadData];
            _page += 1;
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HotArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    ArticleDetailDataModel *model = self.dataList[indexPath.row];
    [cell.iconIV setImageWithURL:model.pic.sx_URL placeholder:[UIImage imageNamed:@"placeHolder.jpg"]];
    cell.titleLb.text = model.title;
    NSInteger viewNum = [model.view integerValue];
    cell.viewNumLb.attributedText = [SXFactory addAttributedString:viewNum PvColor:pvColorGray];
    cell.typeLb.text = [NSString stringWithFormat:@"# %@", model.biaoqian];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailDocVC *dVC = [[DetailDocVC alloc]init];
    HotarticleDataModel *model = self.dataList[indexPath.row];
    dVC.aid = model.aid;
    [self.navigationController pushViewController:dVC animated:YES];
}
- (NSMutableArray *)dataList {
	if(_dataList == nil) {
		_dataList = [[NSMutableArray alloc] init];
	}
	return _dataList;
}

@end
