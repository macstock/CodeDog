//
//  HomeVC.m
//  CodeDog
//
//  Created by zerocpp on 17/1/5.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "HomeVC.h"
#import "NetManager.h"
#import "ArticleCV.h"
#import "ArticleTVC.h"
#import "misarticleTableViewCell.h"
#import "misarticleCollectionView.h"
#import "RandomTableViewCell.h"
#import "RandomCollectionView.h"
#import "HotArticleTableViewCell.h"
#import "CategoryTableViewCell.h"
#import "NewPagedFlowView.h"
#import "PGIndexBannerSubiew.h"
#import "HeaderView.h"
#import "HeadLineCell.h"
#import "HeadLineTableView.h"
#import "DetailDocVC.h"
#import "ArticleTableVC.h"
#import "MisarticleTableVC.h"
#import "HotarticleTableVC.h"
#import "MisArtWebView.h"

@interface HomeVC ()<UITableViewDataSource, UITableViewDelegate, iCarouselDelegate, iCarouselDataSource, NewPagedFlowViewDelegate, NewPagedFlowViewDataSource>
/**
 *  轮播图数组
 */
@property(nonatomic) NSMutableArray<HomeBannerModel *> *bannerList;
/**
 *  最新文章数组
 */
@property(nonatomic) NSMutableArray<HomeArticleModel *> *articelList;
/**
 *  专题精选数组
 */
@property(nonatomic) NSMutableArray<HomeCategoryModel *> *categoryList;
/**
 *  最新资讯数组
 */
@property(nonatomic) NSMutableArray<HomeMisarticleModel *> *misarticleList;
/**
 *  头条数组
 */
@property(nonatomic) NSMutableArray<HomeHeadlineModel *> *headlineList;
/**
 *  小编推荐数组
 */
@property(nonatomic) NSMutableArray<HomeRandomModel *> *randomList;
@property(nonatomic) NSMutableArray<HomePcategoryModel *> *pcategoryList;
/**
 *  热门推荐数组
 */
@property(nonatomic) NSMutableArray<HomeHotarticleModel *> *hotarticleList;

@property(nonatomic) UITableView *tableView;
@property(nonatomic) iCarousel *ic;
@property(nonatomic) UIPageControl *pageC;
@property(nonatomic) NSTimer *timer;
@property (nonatomic) UIView *topView;
@end

@implementation HomeVC
#pragma mark -iC delegate
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return _bannerList.count;
}
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIImageView alloc] initWithFrame:carousel.bounds];
    }
    HomeBannerModel *model = _bannerList[index];
    [((UIImageView *)view) setImageURL:model.pic.sx_URL];
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
-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    DetailDocVC *dVC = [[DetailDocVC alloc]init];
    HomeBannerModel *model = self.bannerList[index];
    dVC.aid = model.aid;
    [self.navigationController pushViewController:dVC animated:YES];
}
#pragma mark -Life
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *titleView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 22)];
    titleView.image = [UIImage imageNamed:@"title~iphone"];
    self.navigationItem.titleView = titleView;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"bannnerCell"];
    [self.tableView registerClass:[ArticleTVC class] forCellReuseIdentifier:@"articleCell"];
    [self.tableView registerClass:[misarticleTableViewCell class] forCellReuseIdentifier:@"misarticleCell"];
    [self.tableView registerClass:[RandomTableViewCell class] forCellReuseIdentifier:@"randomCell"];
    [self.tableView registerClass:[HotArticleTableViewCell class] forCellReuseIdentifier:@"hotArticleCell"];
    [self.tableView registerClass:[CategoryTableViewCell class] forCellReuseIdentifier:@"categoryCell"];
    [self.tableView registerClass:[HeaderView class] forHeaderFooterViewReuseIdentifier:@"headView"];
    [self.tableView registerClass:[HeadLineCell class] forCellReuseIdentifier:@"headLineCell"];
    MJWeakSelf
    [self.tableView addHeaderRefresh:^{
        [NetManager getHomePageCompletionHandler:^(HomeModel *model, NSError *error) {
            if (!error) {
                [weakSelf.bannerList removeAllObjects];
                [weakSelf.bannerList addObjectsFromArray:model.banner];
                [weakSelf.articelList removeAllObjects];
                [weakSelf.articelList addObjectsFromArray:model.article];
                [weakSelf.categoryList removeAllObjects];
                [weakSelf.categoryList addObjectsFromArray:model.category];
                [weakSelf.misarticleList removeAllObjects];
                [weakSelf.misarticleList addObjectsFromArray:model.misarticle];
                [weakSelf.randomList removeAllObjects];
                [weakSelf.randomList addObjectsFromArray:model.random];
                [weakSelf.hotarticleList removeAllObjects];
                [weakSelf.hotarticleList addObjectsFromArray:model.hotarticle];
                [weakSelf.headlineList removeAllObjects];
                [weakSelf.headlineList addObjectsFromArray:model.headline];
                
                //如果没内容 停止定时器
                [weakSelf.timer invalidate];
                _timer = nil;
                [weakSelf.ic reloadData];
                weakSelf.pageC.numberOfPages = weakSelf.bannerList.count;
                _timer = [NSTimer bk_scheduledTimerWithTimeInterval:7 block:^(NSTimer *timer) {
                    [_ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
                } repeats:YES];
                
                [weakSelf.tableView reloadData];
                [weakSelf.tableView endHeaderRefresh];
            }
            [NSTimer bk_scheduledTimerWithTimeInterval:.4 block:^(NSTimer *timer) {
                [weakSelf.tableView configHeader];
            } repeats:NO];
        }];
    }];
    [self.tableView beginHeaderRefresh];
    [self tableView];
    
}

#pragma mark -TableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0 || section == 1 || section == 2 || section == 3 || section == 4) {
        return 1;
    }
    else{
        return self.hotarticleList.count;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 88;
    }
    if (indexPath.section == 1) {
        return 320;
    }
    if (indexPath.section == 2) {
        return 150;
    }
    if (indexPath.section == 3) {
        return 320;
    }
    if (indexPath.section == 4) {
        return 280;
    }
    return 100;
}
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return UITableViewAutomaticDimension;
//}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headView"];
    NSArray *titleArr = @[@" ", @"最新文章", @"专题精选", @"小编推荐", @"最新资讯", @"热门推荐"];
    header.titleLb.text = titleArr[section];
    
    if (section == 2 || section == 3) {
        [header.moreBtn setTitle:@" " forState:UIControlStateNormal];
    }else{
        [header.moreBtn setTitle:@"更多" forState:UIControlStateNormal];
    }
    __weak typeof(self) weakSelf = self;
    if (section == 1) {
        [header setPushVC:^(HeaderView * hv) {
            ArticleTableVC *vc = [[ArticleTableVC alloc]init];
            vc.NaviTitle = titleArr[section];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }];
    }
    if (section == 4) {
        [header setPushVC:^(HeaderView * hv) {
            MisarticleTableVC *vc = [[MisarticleTableVC alloc]init];
            vc.NaviTitle = titleArr[section];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }];
    }
    if (section == 5) {
        [header setPushVC:^(HeaderView * hv) {
            HotarticleTableVC *vc = [[HotarticleTableVC alloc]init];
            vc.NaviTitle = titleArr[section];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }];
    }
    return header;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat width = (self.view.frame.size.width - 10 * 3) / 2;
    //图片尺寸为750 * 340
    CGFloat height = (width * 340 / 750) + 40;
    if (indexPath.section == 0) {
        //今日头条
        //上下滚动tableViewCell
        HeadLineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"headLineCell" forIndexPath:indexPath];
        cell.userInteractionEnabled = NO;
        NSArray *arr = self.headlineList.copy;
        HeadLineTableView *headLineTV = [[HeadLineTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 88) withHeadLineArr:arr];
        [cell.headLineView addSubview:headLineTV];
        return cell;
    }
    if (indexPath.section == 1) {
        //最新文章
        ArticleTVC *cell = [tableView dequeueReusableCellWithIdentifier:@"articleCell" forIndexPath:indexPath];
        NSArray *array = self.articelList.copy;
        ArticleCV *articleCV = [[ArticleCV alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 320) collectionViewItemSize:CGSizeMake(width, height) withHomeArticleArr:array];
        
        //使用block反向传值 获得下一页的indexPath的值，并进行跳转
        [articleCV setBlock:^(NSIndexPath *indexPath) {
            DetailDocVC *dVC = [[DetailDocVC alloc]init];
            HomeArticleModel *model = self.articelList[indexPath.row];
            dVC.aid = model.aid;
            [self.navigationController pushViewController:dVC animated:YES];
        }];
        articleCV.backgroundColor = [UIColor whiteColor];
        [cell.collectionView addSubview:articleCV];
        return cell;
    }
    if (indexPath.section == 2) {
        //专题精选
        CategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"categoryCell" forIndexPath:indexPath];
        NewPagedFlowView *pageFlowView = [[NewPagedFlowView alloc] initWithFrame:CGRectMake(0, 8, kMyScreenWidth, (kMyScreenWidth - 84) * 340 / 750)];
        pageFlowView.backgroundColor = [UIColor whiteColor];
        pageFlowView.delegate = self;
        pageFlowView.dataSource = self;
        pageFlowView.minimumPageAlpha = 0.1;
        pageFlowView.minimumPageScale = 0.85;
        pageFlowView.orientation = NewPagedFlowViewOrientationHorizontal;
        
        //提前告诉有多少页
        pageFlowView.orginPageCount = self.categoryList.count;
        
        pageFlowView.isOpenAutoScroll = YES;
        UIScrollView *bottomScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        [bottomScrollView addSubview:pageFlowView];
        
        [pageFlowView reloadData];
        
        [cell.collectionView addSubview:bottomScrollView];
        
        return cell;
    }
    if (indexPath.section == 3) {
        //小编推荐
        RandomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"randomCell" forIndexPath:indexPath];
        NSArray *array = self.randomList.copy;
        RandomCollectionView *randomCV = [[RandomCollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 320) collectionViewItemSize:CGSizeMake(width, height) withHomeRandomArr:array];
        [randomCV setBlock:^(NSIndexPath *indexPath) {
            DetailDocVC *dVC = [[DetailDocVC alloc]init];
            HomeRandomModel *model = self.randomList[indexPath.row];
            dVC.aid = model.aid;
            [self.navigationController pushViewController:dVC animated:YES];
        }];
        randomCV.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:randomCV];
        return cell;
    }
    if (indexPath.section == 4) {
        //最新资讯
        misarticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"misarticleCell" forIndexPath:indexPath];
        NSArray *array = self.misarticleList.copy;
        misarticleCollectionView *misarticleCV = [[misarticleCollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 280) collectionViewItemSize:CGSizeMake(width, height) withHomeMisArticleArr:array];
        [misarticleCV setBlock:^(NSIndexPath *indexPath) {
            MisArtWebView *dVC = [[MisArtWebView alloc]init];
            HomeMisarticleModel *model = self.misarticleList[indexPath.row];
            dVC.aid = model.aid;
            [self.navigationController pushViewController:dVC animated:YES];
        }];
        misarticleCV.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:misarticleCV];
        return cell;
    }
    else{
        //热门推荐
        HotArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hotArticleCell" forIndexPath:indexPath];
        HomeHotarticleModel *model = self.hotarticleList[indexPath.row];
        [cell.iconIV setImageWithURL:model.pic.sx_URL placeholder:[UIImage imageNamed:@"placeHolder.jpg"]];
        cell.titleLb.text = model.title;
        NSInteger viewNum = [model.view integerValue];
        cell.viewNumLb.attributedText = [SXFactory addAttributedString:viewNum PvColor:pvColorGray];
        cell.typeLb.text = [NSString stringWithFormat:@"# %@", model.biaoqian];
        return cell;
    }
}
#pragma mark NewPagedFlowView Delegate
- (CGSize)sizeForPageInFlowView:(NewPagedFlowView *)flowView {
    return CGSizeMake(kMyScreenWidth - 84, (kMyScreenWidth - 84) * 340 / 750);
}
#pragma mark NewPagedFlowView Datasource
- (NSInteger)numberOfPagesInFlowView:(NewPagedFlowView *)flowView {
    
    return self.categoryList.count;
}
//专题精选跳转 有一个页面需要做

//-(void)didSelectCell:(UIView *)subView withSubViewIndex:(NSInteger)subIndex{
//    DetailDocVC *dVC = [[DetailDocVC alloc]init];
//    HomeCategoryModel *model = self.categoryList[subIndex];
//    dVC.aid = model.fid;
//    [self.navigationController pushViewController:dVC animated:YES];
//}

- (UIView *)flowView:(NewPagedFlowView *)flowView cellForPageAtIndex:(NSInteger)index{
    PGIndexBannerSubiew *bannerView = (PGIndexBannerSubiew *)[flowView dequeueReusableCell];
    if (!bannerView) {
        bannerView = [[PGIndexBannerSubiew alloc] initWithFrame:CGRectMake(0, 0, kMyScreenWidth - 84, (kMyScreenWidth - 84) * 340 / 750)];
        bannerView.mainImageView.contentMode = UIViewContentModeScaleAspectFill;
        bannerView.clipsToBounds = YES;
        bannerView.layer.cornerRadius = 4;
        bannerView.layer.masksToBounds = YES;
    }
    HomeCategoryModel *model = self.categoryList[index];
    [bannerView.mainImageView setImageWithURL:model.tpimg.sx_URL placeholder:[UIImage imageNamed:@"placeHolder.jpg"]];
    return bannerView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailDocVC *dVC = [[DetailDocVC alloc]init];
    if (indexPath.section == 5) {
        dVC.aid = self.hotarticleList[indexPath.row].aid;
    }    
    [self.navigationController pushViewController:dVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -Lazy
-(UITableView *)tableView
{
    if(!_tableView){
        _tableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        //        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.sectionHeaderHeight = 35;
        _tableView.sectionFooterHeight = 10;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, kMyScreenWidth  * (340 / 750.0))];
        
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
        _pageC = [UIPageControl new];
        [_topView addSubview:_pageC];
        [_pageC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(5);
        }];
        _pageC.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageC.pageIndicatorTintColor = [UIColor lightGrayColor];
    }
    return _tableView;
}

- (NSMutableArray<HomeBannerModel *> *)bannerList {
    if(_bannerList == nil) {
        _bannerList = [[NSMutableArray<HomeBannerModel *> alloc] init];
    }
    return _bannerList;
}

- (NSMutableArray<HomeArticleModel *> *)articelList {
    if(_articelList == nil) {
        _articelList = [[NSMutableArray<HomeArticleModel *> alloc] init];
    }
    return _articelList;
}

-(NSMutableArray<HomeCategoryModel *> *)categoryList{
    if (!_categoryList) {
        _categoryList = [[NSMutableArray<HomeCategoryModel *> alloc]init];
    }
    return _categoryList;
}

-(NSMutableArray<HomeMisarticleModel *> *)misarticleList{
    if (!_misarticleList) {
        _misarticleList = [[NSMutableArray<HomeMisarticleModel *> alloc]init];
    }
    return _misarticleList;
}
-(NSMutableArray<HomeRandomModel *> *)randomList{
    if (!_randomList) {
        _randomList = [[NSMutableArray<HomeRandomModel *> alloc]init];
    }
    return _randomList;
}
-(NSMutableArray<HomeHotarticleModel *> *)hotarticleList{
    if (!_hotarticleList) {
        _hotarticleList = [[NSMutableArray<HomeHotarticleModel *> alloc]init];
    }
    return _hotarticleList;
}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *headerView = [UIView alloc]
//}


- (NSMutableArray<HomeHeadlineModel *> *)headlineList {
    if(_headlineList == nil) {
        _headlineList = [[NSMutableArray<HomeHeadlineModel *> alloc] init];
    }
    return _headlineList;
}

@end
