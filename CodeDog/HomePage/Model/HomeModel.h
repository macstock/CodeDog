//
//  HomeModel.h
//  CodeDog
//
//  Created by zerocpp on 17/1/4.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeRandomModel,HomeCategoryModel,HomeArticleModel,HomeBannerModel,HomeHotarticleModel,HomePcategoryModel,HomeMisarticleModel,HomeHeadlineModel;
@interface HomeModel : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) NSArray<HomeBannerModel *> *banner;

@property (nonatomic, strong) NSArray<HomeCategoryModel *> *category;

@property (nonatomic, strong) NSArray<HomeArticleModel *> *article;

@property (nonatomic, strong) NSArray *folder;

@property (nonatomic, strong) NSArray<HomeRandomModel *> *random;

@property (nonatomic, strong) NSArray<HomeHotarticleModel *> *hotarticle;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<HomePcategoryModel *> *pcategory;

@property (nonatomic, strong) NSArray<HomeMisarticleModel *> *misarticle;

@property (nonatomic, strong) NSArray<HomeHeadlineModel *> *headline;

@end
@interface HomeRandomModel : NSObject

@property (nonatomic, copy) NSString *sign;

@property (nonatomic, copy) NSString *iscollect;

@property (nonatomic, copy) NSString *biaoqian;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *fid;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *area;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *ispraise;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *praise;

@property (nonatomic, copy) NSString *username;

@property (nonatomic, copy) NSString *pimg;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *gender;

@end

@interface HomeCategoryModel : NSObject
/**
 *  id   ID
 */
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *isfollow;

@property (nonatomic, copy) NSString *fid;

@property (nonatomic, copy) NSString *originimage;

@property (nonatomic, copy) NSString *introduction;

@property (nonatomic, copy) NSString *tpimg;

@property (nonatomic, copy) NSString *followcount;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *articlecount;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *name;

@end

@interface HomeArticleModel : NSObject

@property (nonatomic, copy) NSString *iscollect;

@property (nonatomic, copy) NSString *biaoqian;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *fid;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *ispraise;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *praise;

@property (nonatomic, copy) NSString *aid;

@end

@interface HomeBannerModel : NSObject
/**
 *  id   ID
 */
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *edittime;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *slide;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *autor;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *praise;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *status;

@end

@interface HomeHotarticleModel : NSObject

@property (nonatomic, copy) NSString *iscollect;

@property (nonatomic, copy) NSString *biaoqian;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *fid;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *ispraise;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *praise;

@property (nonatomic, copy) NSString *aid;

@end

@interface HomePcategoryModel : NSObject
/**
 *  id   ID
 */
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *introduction;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *image;

@end

@interface HomeMisarticleModel : NSObject

@property (nonatomic, copy) NSString *iscollect;

@property (nonatomic, copy) NSString *mid;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *mname;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *ispraise;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *praise;

@property (nonatomic, copy) NSString *aid;

@end

@interface HomeHeadlineModel : NSObject

@property (nonatomic, copy) NSString *praise;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *yprice;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *biaoqian;

@property (nonatomic, copy) NSString *fid;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *ioslink;

@property (nonatomic, copy) NSString *isshow;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *iscollect;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *ispraise;

@property (nonatomic, copy) NSString *type;
/**
 *  id   ID
 */
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *commission;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *pid;

@property (nonatomic, copy) NSString *mark;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *edittime;

@property (nonatomic, copy) NSString *ptype;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *comment;

@end

