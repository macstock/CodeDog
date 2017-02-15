//
//  NetManager.h
//  CodeDog
//
//  Created by zerocpp on 17/1/4.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "BaseNetManager.h"
#import "HomeModel.h"
#import "MineModel.h"
#import "ArticleModel.h"
#import "DocModel.h"
#import "DetailDocModel.h"
#import "ArticleDetailModel.h"
#import "MisarticleModel.h"
#import "HotarticleModel.h"
#import "MoreDocModel.h"
#import "DocDetailModel.h"
#import "CollectionModel.h"

@interface NetManager : BaseNetManager
//首页
+(id)getHomePageCompletionHandler:(void(^)(HomeModel *model, NSError *error))completionHander;
//我的
+(id)getMinePageCompletionHandler:(void(^)(MineModel *model, NSError *error))completionHander;

//文档
+(id)getDocWithPage:(NSInteger)page CompletionHandler:(void(^)(ArticleModel *model, NSError *error))completionHander;

//文章
+(id)getArtWithPage:(NSInteger)page CompletionHandler:(void(^)(DocModel *model, NSError *error))completionHander;

//文章详细
+(id)getDetailDocWithAid:(NSString *)aid CompletionHandler:(void(^)(DetailDocModel *model, NSError *error))completionHander;

//最新文章  更多跳转
+(id)getArtDetailWithPage:(NSInteger)page CompletionHandler:(void(^)(ArticleDetailModel *model, NSError *error))completionHander;

//最新资讯 更多跳转
+(id)getMisArticleDetailWithPage:(NSInteger)page CompletionHandler:(void(^)(MisarticleModel *model, NSError *error))completionHander;

//热门推荐 更多跳转
+(id)getHotArticleDetailWithPage:(NSInteger)page CompletionHandler:(void(^)(HotarticleModel *model, NSError *error))completionHander;

//文档 更多
+(id)getMoreDocWithPage:(NSInteger)page AndFid:(NSInteger)fid CompletionHandler:(void(^)(MoreDocModel *model, NSError *error))completionHander;

//文档详细
+(id)getDocDetailWithAid:(NSString *)aid CompletionHandler:(void(^)(DocDetailModel *model, NSError *error))completionHander;
    
//最新资讯文章详细
+(id)getMisArtDetailWithAid:(NSString *)aid CompletionHandler:(void(^)(DetailDocModel *model, NSError *error))completionHander;

//收藏
+(id)getColletionCompletionHandler:(void(^)(CollectionModel *model, NSError *error))completionHander;
@end
