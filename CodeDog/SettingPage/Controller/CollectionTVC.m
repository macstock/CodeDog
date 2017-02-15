//
//  CollectionTVC.m
//  CodeDog
//
//  Created by zerocpp on 17/2/9.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "CollectionTVC.h"
#import "NetManager.h"
#import "HotArticleTableViewCell.h"
#import "DetailDocVC.h"

@interface CollectionTVC ()
@property(nonatomic) NSArray *dataList;
@property(nonatomic) UILabel *titleLb;
@end

@implementation CollectionTVC
//纯代码初始化  隐藏底部bar
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [SXFactory addBackItemToVC:self];
    UIImageView *titleView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    self.navigationItem.titleView = titleView;
    _titleLb = [UILabel new];
    [titleView addSubview:_titleLb];
    _titleLb.font = [UIFont systemFontOfSize:15];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    self.titleLb.text = @"我的收藏";
     MJWeakSelf
    [self.tableView addHeaderRefresh:^{
       [NetManager getColletionCompletionHandler:^(CollectionModel *model, NSError *error) {
           if (!error) {
               weakSelf.dataList = model.data;
               [weakSelf.tableView reloadData];
               [weakSelf.tableView endHeaderRefresh];
           }
           [NSTimer bk_scheduledTimerWithTimeInterval:.4 block:^(NSTimer *timer) {
               [weakSelf.tableView configHeader];
           } repeats:NO];
       }];
    }];
    [self.tableView beginHeaderRefresh];
    
    [self.tableView registerClass:[HotArticleTableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HotArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    ColletionDataModel *model = self.dataList[indexPath.row];
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

@end
