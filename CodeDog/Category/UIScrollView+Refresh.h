//
//  UIScrollView+Refresh.h
//  CodeDog
//
//  Created by zerocpp on 17/1/5.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Refresh)
- (void)addHeaderRefresh:(void(^)())block;
- (void)endHeaderRefresh;
- (void)beginHeaderRefresh;

- (void)addFooterRefresh:(void(^)())block;
- (void)endFooterRefresh;
- (void)endFooterRefreshWithNoMoreData;

/** 新增方法, 配置头部gif刷新的动画样式 */
- (void)configHeader;
@end
