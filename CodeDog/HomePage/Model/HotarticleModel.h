//
//  HotarticleModel.h
//  CodeDog
//
//  Created by zerocpp on 17/1/19.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HotarticleDataModel;
@interface HotarticleModel : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<HotarticleDataModel *> *data;

@end
@interface HotarticleDataModel : NSObject

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

