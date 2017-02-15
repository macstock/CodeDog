//
//  NetManager.m
//  CodeDog
//
//  Created by zerocpp on 17/1/4.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import "NetManager.h"
#define kHomePath @"http://www.qidianlife.com/Singular/index.php?m=App&c=Index&a=main&uid=1482150488&page=1&pagesize=6"
#define kMinePath @"http://www.qidianlife.com/Singular/index.php?m=App&c=Member&a=getUserInfo&uid=1482150488&jid=1482150488"
#define kDocPath @"http://www.qidianlife.com/Singular/index.php?m=App&c=File&a=getUserFile&uid=1482150488&page=%ld&pagesize=10"
#define kArtPath @"http://www.qidianlife.com/Singular/index.php?m=App&c=Article&a=getUserArticle&uid=1482150488&page=%ld&pagesize=10"
#define kDetailPath @"http://www.qidianlife.com/Singular/index.php?m=App&c=Article&a=getUserArticleDetail&uid=1482150488&aid=%@"
//最新资讯 文章详细
#define kMisArtDetailPath @"http://www.qidianlife.com/Singular/index.php?m=App&c=MisArticle&a=getMisChoiceDetail&uid=1482150488&aid=%@"
//最新文章 更多
#define kArticleDetailPath @"http://www.qidianlife.com/Singular/index.php?m=App&c=Article&a=getArticleList&uid=1482150488&page=%ld&pagesize=10"
//最新资讯 更多跳转
#define kMisArticleDetailPath @"http://www.qidianlife.com/Singular/index.php?m=App&c=MisArticle&a=getMisChoiceList&uid=1482150488&page=%ld&pagesize=10"
//热门推荐 更多跳转
#define kHotArticleDetailPath @"http://www.qidianlife.com/Singular/index.php?m=App&c=Article&a=getHotMainArticle&uid=1482150488&page=%ld&pagesize=10"
//更多文档
#define kMoreDocPath @"http://www.qidianlife.com/Singular/index.php?m=App&c=File&a=getFindUserFile&uid=1482150488&fid=%ld&page=%ld&pagesize=10"
//文档详细内容
#define kDocDetailPath @"http://www.qidianlife.com/Singular/index.php?m=App&c=File&a=getFileDetails&aid=%@&uid=1482150488"
//收藏
#define kCollectionPath @"http://www.qidianlife.com/Singular/index.php?m=App&c=Collection&a=getCollectUserArticle&uid=1482150488&page=1&pagesize=10"

@implementation NetManager
+(id)getHomePageCompletionHandler:(void (^)(HomeModel *, NSError *))completionHander{
    return [self requestWithRequestMethod:NetworkRequestMethodGET path:kHomePath parameter:nil completionHandler:^(id responseObj, NSError *error) {
       !completionHander ?: completionHander([HomeModel parse:responseObj], error);
    }];
}

+(id)getMinePageCompletionHandler:(void (^)(MineModel *, NSError *))completionHander{
    return [self requestWithRequestMethod:NetworkRequestMethodGET path:kMinePath parameter:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHander ?: completionHander([MineModel parse:responseObj], error);
    }];
}

+(id)getDocWithPage:(NSInteger)page CompletionHandler:(void(^)(ArticleModel *model, NSError *error))completionHander{
    
    NSString *path = [NSString stringWithFormat:kDocPath, page];
    return [self requestWithRequestMethod:NetworkRequestMethodGET path:path parameter:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHander ?: completionHander([ArticleModel parse:responseObj], error);
    }];
}

+(id)getArtWithPage:(NSInteger)page CompletionHandler:(void(^)(DocModel *model, NSError *error))completionHander{
    NSString *path = [NSString stringWithFormat:kArtPath, page];
    
    return [self requestWithRequestMethod:NetworkRequestMethodGET path:path parameter:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHander ?: completionHander([DocModel parse:responseObj], error);
    }];
}

+(id)getDetailDocWithAid:(NSString *)aid CompletionHandler:(void(^)(DetailDocModel *model, NSError *error))completionHander{
    NSString *path = [NSString stringWithFormat:kDetailPath, aid];
    
    return [self requestWithRequestMethod:NetworkRequestMethodGET path:path parameter:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHander ?: completionHander([DetailDocModel parse:responseObj], error);
    }];
}

//最新文章  更多跳转
+(id)getArtDetailWithPage:(NSInteger)page CompletionHandler:(void(^)(ArticleDetailModel *model, NSError *error))completionHander{
    NSString *path = [NSString stringWithFormat:kArticleDetailPath, page];
    
    return [self requestWithRequestMethod:NetworkRequestMethodGET path:path parameter:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHander ?: completionHander([ArticleDetailModel parse:responseObj], error);
    }];
}
//最新资讯 更多跳转
+(id)getMisArticleDetailWithPage:(NSInteger)page CompletionHandler:(void(^)(MisarticleModel *model, NSError *error))completionHander{
    NSString *path = [NSString stringWithFormat:kMisArticleDetailPath, page];
    
    return [self requestWithRequestMethod:NetworkRequestMethodGET path:path parameter:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHander ?: completionHander([MisarticleModel parse:responseObj], error);
    }];
}

//热门推荐 更多跳转
+(id)getHotArticleDetailWithPage:(NSInteger)page CompletionHandler:(void(^)(HotarticleModel *model, NSError *error))completionHander{
    NSString *path = [NSString stringWithFormat:kHotArticleDetailPath, page];
    
    return [self requestWithRequestMethod:NetworkRequestMethodGET path:path parameter:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHander ?: completionHander([HotarticleModel parse:responseObj], error);
    }];
}
//文档 更多
+(id)getMoreDocWithPage:(NSInteger)page AndFid:(NSInteger)fid CompletionHandler:(void(^)(MoreDocModel *model, NSError *error))completionHander{
    NSString *path = [NSString stringWithFormat:kMoreDocPath, fid, page];
    
    return [self requestWithRequestMethod:NetworkRequestMethodGET path:path parameter:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHander ?: completionHander([MoreDocModel parse:responseObj], error);
    }];
}

//文档详细
+(id)getDocDetailWithAid:(NSString *)aid CompletionHandler:(void(^)(DocDetailModel *model, NSError *error))completionHander{
    NSString *path = [NSString stringWithFormat:kDocDetailPath, aid];
    
    return [self requestWithRequestMethod:NetworkRequestMethodGET path:path parameter:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHander ?: completionHander([DocDetailModel parse:responseObj], error);
    }];
}
    
//最新资讯文章详细
+(id)getMisArtDetailWithAid:(NSString *)aid CompletionHandler:(void(^)(DetailDocModel *model, NSError *error))completionHander{
    NSString *path = [NSString stringWithFormat:kMisArtDetailPath, aid];
    
    return [self requestWithRequestMethod:NetworkRequestMethodGET path:path parameter:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHander ?: completionHander([DetailDocModel parse:responseObj], error);
    }];
}

//收藏
+(id)getColletionCompletionHandler:(void(^)(CollectionModel *model, NSError *error))completionHander{
    return [self requestWithRequestMethod:NetworkRequestMethodGET path:kCollectionPath parameter:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHander ?: completionHander([CollectionModel parse:responseObj], error);
    }];
}
@end

