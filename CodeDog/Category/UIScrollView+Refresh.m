//
//  UIScrollView+Refresh.m
//  CodeDog
//
//  Created by zerocpp on 17/1/5.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "UIScrollView+Refresh.h"
#import "SXRefreshGifHeader.h"
@implementation UIScrollView (Refresh)
- (void)configHeader{
    //自定义的刷新动画
    NSArray *images0 = @[[UIImage imageNamed:@"img_top_refresh_gy1"],
                         [UIImage imageNamed:@"img_top_refresh_gy2"],
                         [UIImage imageNamed:@"img_top_refresh_gy3"],
                         [UIImage imageNamed:@"img_top_refresh_gy4"],
                         [UIImage imageNamed:@"img_top_refresh_gy5"],
                         [UIImage imageNamed:@"img_top_refresh_gy6"]];
    NSArray *images1 = @[[UIImage imageNamed:@"img_top_refresh_swz1"],
                         [UIImage imageNamed:@"img_top_refresh_swz2"],
                         [UIImage imageNamed:@"img_top_refresh_swz3"],
                         [UIImage imageNamed:@"img_top_refresh_swz4"],
                         [UIImage imageNamed:@"img_top_refresh_swz5"],
                         [UIImage imageNamed:@"img_top_refresh_swz6"],
                         [UIImage imageNamed:@"img_top_refresh_swz7"],
                         [UIImage imageNamed:@"img_top_refresh_swz8"]];
    NSArray *images2 = @[[UIImage imageNamed:@"img_top_refresh_swzd1"],
                         [UIImage imageNamed:@"img_top_refresh_swzd2"],
                         [UIImage imageNamed:@"img_top_refresh_swzd3"],
                         [UIImage imageNamed:@"img_top_refresh_swzd4"],
                         [UIImage imageNamed:@"img_top_refresh_swzd5"],
                         [UIImage imageNamed:@"img_top_refresh_swzd6"],
                         [UIImage imageNamed:@"img_top_refresh_swzd7"],
                         [UIImage imageNamed:@"img_top_refresh_swzd8"],
                         [UIImage imageNamed:@"img_top_refresh_swzd9"],
                         [UIImage imageNamed:@"img_top_refresh_swzd10"],
                         [UIImage imageNamed:@"img_top_refresh_swzd11"],
                         [UIImage imageNamed:@"img_top_refresh_swzd12"],
                         [UIImage imageNamed:@"img_top_refresh_swzd13"],
                         [UIImage imageNamed:@"img_top_refresh_swzd14"]];
    NSArray *images3 = @[[UIImage imageNamed:@"img_top_refresh_sx1"],
                         [UIImage imageNamed:@"img_top_refresh_sx2"],
                         [UIImage imageNamed:@"img_top_refresh_sx3"],
                         [UIImage imageNamed:@"img_top_refresh_sx4"],
                         [UIImage imageNamed:@"img_top_refresh_sx5"],
                         [UIImage imageNamed:@"img_top_refresh_sx6"],
                         [UIImage imageNamed:@"img_top_refresh_sx7"],
                         [UIImage imageNamed:@"img_top_refresh_sx8"],
                         [UIImage imageNamed:@"img_top_refresh_sx9"],
                         [UIImage imageNamed:@"img_top_refresh_sx10"],
                         [UIImage imageNamed:@"img_top_refresh_sx11"]];
    SXRefreshGifHeader *header = (SXRefreshGifHeader *)self.mj_header;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    
    NSInteger num = arc4random() % 4;
    NSArray *im = @[images0, images1, images2, images3][num];
//    header.titleLb.text = @[@"来嘛..", @"浪哩个浪~", @"嘿嘿嘿嘿~", @"刷一刷,再扭一扭"][num];
    [header setImages:im forState:MJRefreshStateIdle];
    [header setImages:im forState:MJRefreshStatePulling];
    [header setImages:im forState:MJRefreshStateRefreshing];
    
}
- (void)addHeaderRefresh:(void(^)())block{
    SXRefreshGifHeader *header = [SXRefreshGifHeader headerWithRefreshingBlock:^{
        !block ?: block();
    }];
    
    self.mj_header = header;
    [self configHeader];
}
- (void)endHeaderRefresh{
    [self.mj_header endRefreshing];
}
- (void)beginHeaderRefresh{
    [self.mj_header beginRefreshing];
}

- (void)addFooterRefresh:(void(^)())block{
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:block];
}
- (void)endFooterRefresh{
    [self.mj_footer endRefreshing];
}
- (void)endFooterRefreshWithNoMoreData{
    [self.mj_footer endRefreshingWithNoMoreData];
}
@end
