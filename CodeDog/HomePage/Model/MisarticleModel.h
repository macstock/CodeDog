//
//  MisarticleModel.h
//  CodeDog
//
//  Created by zerocpp on 17/1/19.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MisarticleArticleModel,MisarticleCategoryModel,MisarticleHotarticleModel;
@interface MisarticleModel : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) NSArray<MisarticleArticleModel *> *article;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<MisarticleHotarticleModel *> *hotarticle;

@property (nonatomic, strong) NSArray<MisarticleCategoryModel *> *category;

@end
@interface MisarticleArticleModel : NSObject

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

@interface MisarticleCategoryModel : NSObject
/**
 *  id --> ID
 */
@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *introduction;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *originimage;

@end

@interface MisarticleHotarticleModel : NSObject

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

