//
//  DocModel.h
//  CodeDog
//
//  Created by zerocpp on 17/1/23.
//  Copyright © 2017年 //  Created by zerocpp on 17/1/23.
//  Copyright © 2017年 zerocpp. All rights reserved.
//. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DocUserarticleModel,DocUserModel,DocBannerarticleModel;
@interface DocModel : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) NSArray<DocBannerarticleModel *> *bannerarticle;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<DocUserarticleModel *> *userarticle;

@property (nonatomic, strong) NSArray<DocUserModel *> *user;

@end
@interface DocUserarticleModel : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *iscollect;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *biaoqian;

@property (nonatomic, copy) NSString *pimg;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *ispraise;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *sign;

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *area;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *paper;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *praise;

@property (nonatomic, copy) NSString *username;

@end

@interface DocUserModel : NSObject

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *biaoqian;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *iscollect;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *area;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *pimg;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *username;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *praise;

@property (nonatomic, copy) NSString *ispraise;

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, copy) NSString *sign;

@end

@interface DocBannerarticleModel : NSObject

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *biaoqian;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *iscollect;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *area;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *pimg;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *username;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *praise;

@property (nonatomic, copy) NSString *ispraise;

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, copy) NSString *sign;

@end

