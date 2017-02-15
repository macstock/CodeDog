//
//  MoreDocModel.h
//  CodeDog
//
//  Created by zerocpp on 17/1/20.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <Foundation/Foundation.h>
//更多 文档模型
@class MoreDocDataModel;
@interface MoreDocModel : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<MoreDocDataModel *> *data;

@end
@interface MoreDocDataModel : NSObject

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
 *  id --> ID
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

