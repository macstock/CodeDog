//
//  MineModel.h
//  CodeDog
//
//  Created by zerocpp on 17/1/12.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MineDataModel;
@interface MineModel : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) MineDataModel *data;

@property (nonatomic, copy) NSString *count;

@property (nonatomic, copy) NSString *expcount;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, copy) NSString *fanscount;

@property (nonatomic, copy) NSString *bgimg;

@property (nonatomic, copy) NSString *coincount;

@property (nonatomic, copy) NSString *hassign;

@end
@interface MineDataModel : NSObject

@property (nonatomic, copy) NSString *isarticle;

@property (nonatomic, copy) NSString *clientinfo;

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *invite;

@property (nonatomic, copy) NSString *subcription;

@property (nonatomic, copy) NSString *check;

@property (nonatomic, copy) NSString *pimg;

@property (nonatomic, copy) NSString *udid;

@property (nonatomic, copy) NSString *articlecount;

@property (nonatomic, copy) NSString *cid;
/**
 *  id --> ID
 */
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, copy) NSString *sign;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *unionid;

@property (nonatomic, copy) NSString *platform;

@property (nonatomic, copy) NSString *profession;

@property (nonatomic, copy) NSString *area;

@property (nonatomic, copy) NSString *edittime;

@property (nonatomic, copy) NSString *username;

@end

