//
//  ArticleVC.m
//  CodeDog
//
//  Created by zerocpp on 17/1/23.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "ArticleVC.h"
#import "NetManager.h"
#import "DocCollectionView.h"
#import "DocTableViewCell.h"
#import "HotDocCell.h"
#import "MoreDocTableVC.h"
#import "DownloadVC.h"

@interface ArticleVC ()
@property(nonatomic) NSArray<ArticleHotModel *> *hotDataList;
@property(nonatomic) NSMutableArray<ArticleDataModel *> *docDataList;
@property(nonatomic) NSInteger page;
@end

@implementation ArticleVC


#pragma mark -Life
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"文档社区";
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0,0,0,0.01)];
    MJWeakSelf
    [self.tableView addHeaderRefresh:^{
        [NetManager getDocWithPage:1 CompletionHandler:^(ArticleModel *model, NSError *error) {
            if (!error) {
                weakSelf.hotDataList = model.hot;
                [weakSelf.docDataList removeAllObjects];
                [weakSelf.docDataList addObjectsFromArray:model.data];
                [weakSelf.tableView reloadData];
                [weakSelf.tableView endHeaderRefresh];
                _page = 2;
            }
            [NSTimer bk_scheduledTimerWithTimeInterval:.4 block:^(NSTimer *timer) {
                [weakSelf.tableView configHeader];
            } repeats:NO];
        }];
    }];
    [self.tableView beginHeaderRefresh];
    
    [self.tableView addFooterRefresh:^{
        [NetManager getDocWithPage:weakSelf.page CompletionHandler:^(ArticleModel *model, NSError *error) {
            if (!error) {
                [weakSelf.tableView endFooterRefresh];
                [weakSelf.docDataList addObjectsFromArray:model.data];
                [weakSelf.tableView reloadData];
                _page += 1;
            }
        }];
    }];
    [self.tableView registerClass:[DocTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.tableView registerClass:[HotDocCell class] forCellReuseIdentifier:@"hotdocCell"];
    
    
}

#pragma mark -dataSourceDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.docDataList.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kMyScreenWidth - 60 * 2 - 100 * 2) / 3;
    //图片尺寸为750 * 340
    CGFloat height = width;
    if (indexPath.section == 0  ) {
        HotDocCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hotdocCell" forIndexPath:indexPath];
        DocCollectionView *docCV = [[DocCollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 220) collectionViewItemSize:CGSizeMake(width, height) withhotDocArr:_hotDataList];
        
        
        //block回调  传回NSIndexPath 参数
        [docCV setBlock:^(NSIndexPath *indexPaths) {
            MoreDocTableVC *vc = [[MoreDocTableVC alloc]init];
            ArticleHotModel *model = self.hotDataList[indexPaths.row];
            vc.fid = indexPaths.row + 1;
            vc.NaviTitle = model.name;
            [self.navigationController pushViewController:vc animated:YES];
        }];
        
        docCV.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:docCV];
        
        return cell;
    }else{
        DocTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        ArticleDataModel *model = self.docDataList[indexPath.section];
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
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DownloadVC *vc = [[DownloadVC alloc]init];
    vc.aid = self.docDataList[indexPath.section].cid;
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 220;
    }else{
        YYTextView *tv = [[YYTextView alloc]initWithFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width - 70, 0)];
        tv.text = self.docDataList[indexPath.section].content;
        return tv.textLayout.textBoundingSize.height + 150;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -Lazy
- (NSMutableArray<ArticleDataModel *> *)docDataList {
	if(_docDataList == nil) {
		_docDataList = [[NSMutableArray<ArticleDataModel *> alloc] init];
	}
	return _docDataList;
}

@end
