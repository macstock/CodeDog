//
//  ArticleModel.h
//  CodeDog
//
//  Created by zerocpp on 17/1/23.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ArticleHotModel,ArticleDataModel;
@interface ArticleModel : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) NSArray<ArticleDataModel *> *data;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<ArticleHotModel *> *hot;

@end
@interface ArticleHotModel : NSObject
/**
 *  id -->  ID
 */
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *image;

@end

@interface ArticleDataModel : NSObject

@property (nonatomic, copy) NSString *praise;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *fid;

@property (nonatomic, copy) NSString *pimg;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *ispraise;

@property (nonatomic, copy) NSString *totalsize;

@property (nonatomic, copy) NSString *fileurl;

@property (nonatomic, copy) NSString *cid;

@property (nonatomic, copy) NSString *sign;

@property (nonatomic, copy) NSString *gender;

/**
 *  id -->  ID
 */
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *filename;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *coincount;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *fname;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *username;

@end

