//
//  DocDetailModel.h
//  CodeDog
//
//  Created by zerocpp on 17/1/23.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DocDetailDiscussModel,DocDetailPraisesModel,DocDetailCommentsModel;
@interface DocDetailModel : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) DocDetailDiscussModel *discuss;

@end
@interface DocDetailDiscussModel : NSObject

@property (nonatomic, copy) NSString *praise;

@property (nonatomic, strong) NSArray<DocDetailPraisesModel *> *praises;

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
 *  id --> ID
 */
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *filename;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *coincount;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, strong) NSArray<DocDetailCommentsModel *> *comments;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *fname;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *username;

@end

@interface DocDetailPraisesModel : NSObject

@property (nonatomic, copy) NSString *pimg;

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, copy) NSString *uid;
/**
 *  id --> ID
 */
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *iscollect;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *username;

@property (nonatomic, copy) NSString *ispraise;

@property (nonatomic, copy) NSString *sign;

@end

@interface DocDetailCommentsModel : NSObject
/**
 *  id --> ID
 */
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *replyid;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *imgheight;

@property (nonatomic, copy) NSString *replyname;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *pimg;

@property (nonatomic, copy) NSString *replycontent;

@property (nonatomic, copy) NSString *username;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *imgwidth;

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, copy) NSString *sign;

@end

