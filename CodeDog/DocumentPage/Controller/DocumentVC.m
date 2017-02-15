//
//  DocumentVC.m
//  CodeDog
//
//  Created by zerocpp on 17/1/4.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "DocumentVC.h"
#import "NetManager.h"
#import "PicRightCell.h"
#import "BigPicCell.h"
#import "DetailDocVC.h"

@interface DocumentVC ()<iCarouselDelegate, iCarouselDataSource>
@property(nonatomic) NSInteger page;
@property(nonatomic) NSArray<DocBannerarticleModel *> *bannerList;
@property(nonatomic) NSMutableArray<DocUserModel *> *userList;
@property(nonatomic) NSMutableArray<DocUserarticleModel *> *userArtList;

@property(nonatomic) iCarousel *ic;
@property(nonatomic) UIPageControl *pageC;
@property(nonatomic) NSTimer *timer;
@property(nonatomic) UILabel *titleLb;
@property (nonatomic) UIView *topView;
@end

@implementation DocumentVC
#pragma mark -iC delegate
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return _bannerList.count;
}
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIImageView alloc] initWithFrame:carousel.bounds];
        //添加毛玻璃效果
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView *ve = [[UIVisualEffectView alloc]initWithEffect:effect];
        ve.frame = view.bounds;
        ve.alpha = 0.3;
        [view addSubview:ve];
    }
    DocBannerarticleModel *model = _bannerList[index];
    [((UIImageView *)view) setImageURL:model.pic.sx_URL];
    _titleLb.text = model.title;
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _pageC.currentPage = carousel.currentItemIndex;
}

#pragma mark -Life
- (void)viewDidLoad {
    [super viewDidLoad];
    [self topView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.title = @"文章";
    MJWeakSelf
    [self.tableView addHeaderRefresh:^{
       [NetManager getArtWithPage:1 CompletionHandler:^(DocModel *model, NSError *error) {
           if (!error) {
               weakSelf.bannerList = model.bannerarticle;
               [weakSelf.userArtList removeAllObjects];
               [weakSelf.userArtList addObjectsFromArray:model.userarticle];
               [weakSelf.userList removeAllObjects];
               [weakSelf.userList addObjectsFromArray:model.user];
               
               //如果没内容 停止定时器
               [weakSelf.timer invalidate];
               _timer = nil;
               [weakSelf.ic reloadData];
               weakSelf.pageC.numberOfPages = weakSelf.bannerList.count;
               _timer = [NSTimer bk_scheduledTimerWithTimeInterval:15 block:^(NSTimer *timer) {
                   [_ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
               } repeats:YES];
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
        [NetManager getArtWithPage:weakSelf.page CompletionHandler:^(DocModel *model, NSError *error) {
            if (!error) {
                [weakSelf.tableView endFooterRefresh];
                [weakSelf.userArtList addObjectsFromArray:model.userarticle];
                [weakSelf.tableView reloadData];
                _page += 1;
            }
        }];
    }];
    
    [self.tableView registerClass:[PicRightCell class] forCellReuseIdentifier:@"picrightCell"];
    
    [self.tableView registerClass:[BigPicCell class] forCellReuseIdentifier:@"bigpicCell"];
}

#pragma mark -Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
       return self.userArtList.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DocUserarticleModel *model = self.userArtList[indexPath.row];
    if ([model.tag integerValue] == 0) {
        return 250;
    }else{
        return 160;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DocUserarticleModel *model = self.userArtList[indexPath.row];
    if ([model.tag integerValue] == 0) {
        BigPicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bigpicCell" forIndexPath:indexPath];
        [cell.pimgIV setImageWithURL:model.pimg.sx_URL placeholder:[UIImage imageNamed:@"headIV"]];
        cell.userNameLb.text = model.username;
        cell.biaqianLb.text = [NSString stringWithFormat:@"# %@", model.biaoqian];
        cell.timeLb.text = [SXFactory timeWithTimeIntervalString:model.ctime];
        
        [cell.picIV setImageURL:model.pic.sx_URL];
        
        
        [cell lineView];
        cell.titleLb.text = model.title;
        cell.biaoqianInLb.text = [NSString stringWithFormat:@"# %@", model.biaoqian];
        NSInteger viewNum = [model.view integerValue];
        cell.viewLb.attributedText = [SXFactory addAttributedString:viewNum PvColor:pvColorWhite];
        return cell;
    }
    else{
    
    PicRightCell *cell = [tableView dequeueReusableCellWithIdentifier:@"picrightCell" forIndexPath:indexPath];
    [cell.pimgIV setImageWithURL:model.pimg.sx_URL placeholder:[UIImage imageNamed:@"headIV"]];
    cell.userNameLb.text = model.username;
    cell.biaqianLb.text = [NSString stringWithFormat:@"# %@", model.biaoqian];
    cell.timeLb.text = [SXFactory timeWithTimeIntervalString:model.ctime];
    [cell backView];
    cell.titleLb.text = model.title;
    [cell.picIV setImageURL:model.pic.sx_URL];
    NSString *read = model.view;
    NSString *comment = model.comment;
    NSString *like = model.praise;
    cell.readLb.text = [NSString stringWithFormat:@"阅读 %@ · 评论 %@ · 喜欢 %@", read, comment, like];
    return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailDocVC *dVC = [[DetailDocVC alloc]init];
    dVC.aid = self.userArtList[indexPath.row].aid;
    [self.navigationController pushViewController:dVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -Lazy
-(NSMutableArray<DocUserModel *> *)userList{
    if (!_userList) {
        _userList = [[NSMutableArray<DocUserModel *> alloc]init];
    }
    return _userList;
}

-(NSMutableArray<DocUserarticleModel *> *)userArtList{
    if (!_userArtList) {
        _userArtList = [[NSMutableArray<DocUserarticleModel *> alloc]init];
    }
    return _userArtList;
}
- (UIView *)topView {
	if(_topView == nil) {
		_topView = [[UIView alloc] init];
        //图片大小 770 * 513
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, kMyScreenWidth  * (400 / 770.0))];
        self.tableView.tableHeaderView = _topView;
        _ic = [iCarousel new];
        [_topView addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.scrollSpeed = 0;
        _ic.type = iCarouselTypeLinear;
        _titleLb = [UILabel new];
        [_topView addSubview:_titleLb];
        _titleLb.font = [UIFont boldSystemFontOfSize:15];
        _titleLb.textColor = [UIColor whiteColor];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
        }];
//        _pageC = [UIPageControl new];
//        [_topView addSubview:_pageC];
//        [_pageC mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(0);
//            make.bottom.equalTo(5);
//        }];
//        _pageC.currentPageIndicatorTintColor = [UIColor whiteColor];
//        _pageC.pageIndicatorTintColor = [UIColor lightGrayColor];
	}
	return _topView;
}

@end
