//
//  DetailDocModel.h
//  CodeDog
//
//  Created by zerocpp on 17/1/23.
//  Copyright © 2017年 zerocpp. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DetailDataModel;
@interface DetailDocModel : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) DetailDataModel *data;


@end
@interface DetailDataModel : NSObject

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *iscollect;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *biaoqian;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *area;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *pimg;

@property (nonatomic, copy) NSString *ispraise;

@property (nonatomic, copy) NSString *username;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *ctime;

@property (nonatomic, copy) NSString *praise;

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, copy) NSString *sign;

@end

