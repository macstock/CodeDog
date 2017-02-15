//
//  MoreDocTableVC.m
//  CodeDog
//
//  Created by zerocpp on 17/1/20.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "MoreDocTableVC.h"
#import "NetManager.h"
#import "DocTableViewCell.h"
#import "DownloadVC.h"

@interface MoreDocTableVC ()
@property(nonatomic) NSMutableArray<MoreDocDataModel *> *dataList;
@property(nonatomic) NSInteger page;
@property(nonatomic) UILabel *titleLb;
@end

@implementation MoreDocTableVC
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
    [self.tableView registerClass:[DocTableViewCell class] forCellReuseIdentifier:@"cell"];
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
        [NetManager getMoreDocWithPage:1 AndFid:weakSelf.fid CompletionHandler:^(MoreDocModel *model, NSError *error) {
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
        [NetManager getMoreDocWithPage:weakSelf.page AndFid:weakSelf.fid CompletionHandler:^(MoreDocModel *model, NSError *error) {
            if (!error) {
                [weakSelf.tableView endFooterRefresh];
                [weakSelf.dataList addObjectsFromArray:model.data];
                [weakSelf.tableView reloadData];
                _page += 1;
            }
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DocTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    MoreDocDataModel *model = self.dataList[indexPath.row];
    [cell.headIV setImageWithURL:model.pimg.sx_URL placeholder:[UIImage imageNamed:@"headIV"]];
    cell.userNameLb.text = model.username;
    cell.fNameLb.text = [NSString stringWithFormat:@"# %@", model.fname];
    cell.timeLb.text = [SXFactory timeWithTimeIntervalString:model.ctime];
    cell.contentLb.text = model.content;
    [cell backView];
    //tag == 1 pdf   2--> doc  3->xls 4->ppt
    if ([model.tag integerValue] == 1) {
        cell.fileTypeIV.image = [UIImage imageNamed:@"pdf~iphone"];
    }else if ([model.tag integerValue] == 2) {
        cell.fileTypeIV.image = [UIImage imageNamed:@"doc~iphone"];
    }else if ([model.tag integerValue] == 3) {
        cell.fileTypeIV.image = [UIImage imageNamed:@"xls~iphone"];
    }else if ([model.tag integerValue] == 4) {
        cell.fileTypeIV.image = [UIImage imageNamed:@"ppt~iphone"];
    }
    cell.fileNameLb.text = model.filename;
    NSInteger viewNum = [model.view integerValue];
    cell.viewNumLb.attributedText = [SXFactory addAttributedString:viewNum PvColor:pvColorBlack];
    [cell.praiseBtn setBackgroundImage:[UIImage imageNamed:@"unpraise~iphone"] forState:UIControlStateNormal];
    cell.praiseNum.text = model.praise;
    NSInteger commentNum = [model.comment integerValue];
    cell.commentLb.attributedText = [SXFactory addAttributedString:commentNum PvColor:commentUp];

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        YYTextView *tv = [[YYTextView alloc]initWithFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width - 70, 0)];
        tv.text = self.dataList[indexPath.row].content;
        return tv.textLayout.textBoundingSize.height + 150;
    
}
    
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DownloadVC *vc = [[DownloadVC alloc]init];
    vc.aid = self.dataList[indexPath.row].cid;
    [self.navigationController pushViewController:vc animated:YES];
}
- (NSMutableArray<MoreDocDataModel *> *)dataList {
	if(_dataList == nil) {
		_dataList = [[NSMutableArray<MoreDocDataModel *> alloc] init];
	}
	return _dataList;
}

@end
